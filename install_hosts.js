import { webcrypto } from "node:crypto";
import { chmodSync, readFileSync, writeFileSync } from "node:fs";
import { exec } from "node:child_process";

const { dirname } = import.meta;
const encoder = new TextEncoder();
const decoder = new TextDecoder();
const args = process.argv.at(-1);
let runtime = "wasmtime";
if (args.startsWith("--runtime=")) {
  runtime = args.split("=").at(-1);
}

// const manifest = JSON.parse(decoder.decode(readFileSync("manifest.json")));

// Generate Chrome extension ID
// https://stackoverflow.com/questions/26053434
// https://gist.github.com/dfkaye/84feac3688b110e698ad3b81713414a9
async function generateIdForPath(path) {
  return [
    ...[
      ...new Uint8Array(
        await webcrypto.subtle.digest(
          "SHA-256",
          new TextEncoder().encode(path),
        ),
      ),
    ].map((u8) => u8.toString(16).padStart(2, "0")).join("").slice(0, 32),
  ]
    .map((hex) => String.fromCharCode(parseInt(hex, 16) + "a".charCodeAt(0)))
    .join(
      "",
    );
}

const id = await generateIdForPath(dirname);
// Write Native Messaging host manifest to NativeMessagingHosts
// in Chromium or Chrome user data directory
const hosts = {
  "nm_assemblyscript": {
    "i": "nm_assemblyscript.ts",
    "description": "AssemblyScript WASI Native Messaging host",
    "compile":
      "bun install assemblyscript@latest @assemblyscript/wasi-shim@latest && bun x --bun asc -Ospeed --converge --config ./node_modules/@assemblyscript/wasi-shim/asconfig.json nm_assemblyscript.ts -o nm_assemblyscript.wasm",
  },
  "nm_c_wasi": {
    "i": "nm_c.c",
    "description": "C WASI Native Messaging host",
    "compile": "wasi-clang --wasm-opt -O3 -flto nm_c.c -o nm_c_wasi.wasm",
  },
  "nm_cpp_wasi": {
    "i": "nm_cpp.cpp",
    "description": "C++ WASI Native Messaging host",
    "compile":
      "wasi-clang++ -std=c++2a --wasm-opt -O3 -flto -fno-exceptions nm_cpp.cpp -o nm_cpp_wasi.wasm",
  },
  "nm_go_wasi": {
    "i": "nm_go.go",
    "description": "Go WASI Native Messaging host",
    "compile":
      'GOOS=wasip1 GOARCH=wasm go build -ldflags="-s -w" -a -o nm_go_wasi.wasm nm_go.go',
  },
  "nm_tinygo_wasi": {
    "i": "nm_go.go",
    "description": "TinyGo WASI Native Messaging host",
    "compile":
      "tinygo build -opt=2 -no-debug -panic=trap -scheduler=none -target=wasip1 -o nm_tinygo_wasi.wasm nm_go.go",
  },
  "nm_warpo": {
    "i": "nm_assemblyscript.ts",
    "description": "Warpo WASI Native Messaging host",
    "compile":
      "bun x warpo --optimizeLevel=3 --host=wasi_snapshot_preview1 nm_assemblyscript.ts -o nm_warpo.wasm",
  },
  "nm_javy": {
    "i": "nm_javy.js",
    "description": "Javy Native Messaging host",
    "compile":
      "javy build -C source=omitted -J simd-json-builtins -o nm_javy.wasm nm_javy.js",
  },
  "nm_javy_node_wasi": {
    "i": "nm_javy.js",
    "description": "Javy Node.js WASI Native Messaging host",
    "compile": "javy emit-plugin -o javy_plugin.wasm && javy build -C dynamic -C plugin=javy_plugin.wasm -o nm_javy_node_wasi.wasm nm_javy.js"
  },
  "nm_rust_wasi": {
    "i": "nm_rust.rs",
    "description": "Rust WASI Native Messaging host",
    "compile":
      "rustc -C opt-level=s -C lto=fat -C codegen-units=1 -C panic=abort --target=wasm32-wasip1 -o nm_rust_wasi.wasm nm_rust.rs",
  },
  "nm_zig_wasi": {
    "i": "nm_zig.zig",
    "description": "Zig WASI Native Messaging host",
    "compile":
      "zig-stable build-exe nm_zig.zig -O ReleaseSmall -target wasm32-wasi --name nm_zig_wasi",
  },
  "nm_qjs_wasi": {
    "i": "nm_qjs_wasi.js",
    "description": "QuickJS WASI Native Messaging host",
    "compile":
      `bun -e 'await fetch("https://github.com/quickjs-ng/quickjs/releases/latest/download/qjs-wasi.wasm").then(async(r)=> [r.headers.get("content-disposition").match(/(?<=filename=).+$/)[0], await r.bytes()]).then(async([filename,file])=>await Bun.write(filename,file))' && bun build --minify --outfile=nm_qjs_wasi_min.js nm_qjs_wasi.js`,
  },
};

writeFileSync("hosts.json", JSON.stringify(Object.keys(hosts)));

for (const [nativeHost, { compile, description, i }] of Object.entries(hosts)) {
  const host = {};
  console.log(nativeHost);
  host.name = nativeHost;
  host.description = description;
  host.path = `${dirname}/${host.name}${host.name === "nm_javy_node_wasi" ? ".js" : ".sh"}`;
  host.type = "stdio";
  host.allowed_origins = [];
  host.allowed_origins.push(`chrome-extension://${id}/`);
  // Include other/additional extension ID's inhost manifest
  // host.allowed_origins.push(
  //  `chrome-extension://${await generateIdForPath(
  //    `${dirname.slice(0, dirname.lastIndexOf("/"))}/tab`,
  //  )}/`,
  // );

  const { resolve, promise } = Promise.withResolvers();
  exec(compile, (error, stdout, stderr) => {
    if (error) {
      console.error(`exec. error: ${error}`);
      return;
    }
    console.log(`Successfully compiled ${i} to ${host.name}.wasm`);
    // console.log(`stdout: ${stdout}`);
    // console.error(`stderr: ${stderr}`);
    resolve();
  });
  await promise;
  if (host.name !== "nm_javy_node_wasi") {
    const shellscript = host.name === "nm_qjs_wasi"
      ? `#!/bin/bash
exec /home/user/bin/wasmtime run --dir=. /home/user/bin/qjs-wasi.wasm --std -m -e '${
        readFileSync("./nm_qjs_wasi_min.js", "utf8")
      }'`
      : `#!/usr/bin/env -S /home/user/bin/${runtime} ${dirname}/${host.name}.wasm`;
    writeFileSync(`${host.name}.sh`, shellscript);
  }
  chmodSync(host.path, 0o764);

  console.log(`${host.path} set to executable.`);

  writeFileSync(`${host.name}.json`, JSON.stringify(host, null, 2));
  // https://chromium.googlesource.com/chromium/src.git/+/HEAD/docs/user_data_dir.md

  const chromeUserDataDir = `${
    dirname.split("/").slice(0, 3).join("/")
  }/.config/chromium/NativeMessagingHosts`;

  writeFileSync(
    `${chromeUserDataDir}/${host.name}.json`,
    JSON.stringify(host, null, 2),
  );

  console.log(
    `${host.name} Native Messaging host manifest written to ${chromeUserDataDir}/${host.name}.json`,
  );
}

console.log(`
Launch chrome with \`chrome --load-extension=${dirname}\` and navigate to URL \`chrome-extension://${id}/index.html\`, open DevTools`);
