#!/usr/bin/env -S /home/user/bin/node
// https://github.com/bytecodealliance/javy/blob/main/docs/docs-using-nodejs.md
// ./javy emit-plugin -o plugin.wasm
// ./javy build -C dynamic -C plugin=plugin.wasm -o javy_node_wasi.wasm embedded.js


import { readFile } from "node:fs/promises";
import { WASI } from "node:wasi";

try {
  const [embeddedModule, pluginModule] = await Promise.all([
    compileModule("./embedded.wasm"),
    compileModule("./plugin.wasm"),
  ]);
  const result = await runJavy(pluginModule, embeddedModule);
} catch (e) {
  throw e;
}

async function compileModule(wasmPath) {
  const bytes = await readFile(new URL(wasmPath, import.meta.url));
  return WebAssembly.compile(bytes);
}

async function runJavy(pluginModule, embeddedModule) {
  /*
  // Use stdin/stdout/stderr to communicate with Wasm instance
  // See https://k33g.hashnode.dev/wasi-communication-between-nodejs-and-wasm-modules-another-way-with-stdin-and-stdout
  */
  try {
    const wasi = new WASI({
      version: "preview1",
      args: [],
      env: {},
      returnOnExit: true,
    });

    const pluginInstance = await WebAssembly.instantiate(
      pluginModule,
      wasi.getImportObject(),
    );

    const instance = await WebAssembly.instantiate(
      embeddedModule,
      { "javy-default-plugin-v3": pluginInstance.exports },
    );
    // Javy plugin is a WASI reactor see https://github.com/WebAssembly/WASI/blob/main/legacy/application-abi.md?plain=1
    wasi.initialize(pluginInstance);
    instance.exports._start();
  } catch (e) {
    if (e instanceof WebAssembly.RuntimeError) {
      if (errorMessage) {
        throw new Error(errorMessage);
      }
    }
    throw e;
  } 
}
