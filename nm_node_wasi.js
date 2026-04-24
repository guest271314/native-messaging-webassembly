#!/usr/bin/env -S /home/user/bin/node

import { readFile } from "node:fs/promises";
import { WASI } from "node:wasi";

try {
  const wasi = new WASI({
    version: "preview1",
    args: [],
    env: {},
    returnOnExit: true,
  });

  const bytes = await readFile(
    new URL(process.argv.at(-1), import.meta.url),
  );

  const { instance } = await WebAssembly.instantiateStreaming(
  new Response(bytes, { headers: { "content-type": "application/wasm" } }),
    { wasi_snapshot_preview1: wasi.wasiImport },
  );

  wasi.start(instance);
  // instance.exports._start();
} catch (e) {
  if (e instanceof WebAssembly.RuntimeError) {
    process.stdout.write(e.stack);
  }
  throw e;
}
