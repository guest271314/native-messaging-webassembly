#!/usr/bin/env -S /home/user/bin/deno -A
// #!/usr/bin/env -S /home/user/bin/node
// #!/usr/bin/env -S /home/user/bin/bun -b
// https://github.com/bytecodealliance/javy/blob/main/docs/docs-using-nodejs.md
// javy emit-plugin -o javy_plugin.wasm
// javy build -C dynamic -C plugin=javy_plugin.wasm -o nm_javy_node_wasi.wasm nm_javy.js
import { readFile } from "node:fs/promises";
import { WASI } from "node:wasi";

try {
  const [embeddedModule, pluginModule] = await Promise.all([
    compileModule("./nm_javy_node_wasi.wasm"),
    compileModule("./javy_plugin.wasm"),
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
    // Deno's "node:wasi" is a stub, not implemented
    // https://docs.deno.com/api/node/wasi/
    // https://github.com/denoland/deno/issues/21025
    let wasi = null;

    try {
      wasi = new WASI({
        version: "preview1",
      });
    } catch (e) {
      // Deno
      // Error: Context is currently not supported at new Context (node:wasi:6:11)
      // console.log(e);
    } finally {
      wasi ??= new (await import("./wasi.js")).default();
    }

    const pluginInstance = await WebAssembly.instantiate(
      pluginModule,
      { wasi_snapshot_preview1: wasi?.wasiImport || wasi?.exports },
    );

    const instance = await WebAssembly.instantiate(
      embeddedModule,
      { "javy-default-plugin-v3": pluginInstance.exports },
    );
    wasi.memory = pluginInstance.exports.memory;
    //console.log(instance.exports, pluginInstance.exports); process.exit();
    // Javy plugin is a WASI reactor see https://github.com/WebAssembly/WASI/blob/main/legacy/application-abi.md?plain=1
    // Bun's "node:wasi" module doesn't have an `initialize` method, even though documentation says it does
    // https://bun.com/reference/node/wasi
    wasi.initialize ??= wasi?.start;
    wasi.initialize?.(pluginInstance);
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
