## WebAssembly Native Messaging host

### Compiling and installing

Compilers and runtimes used: 

- WASI-SDK `clang` and `clang++` symlinked to `wasi-clang` and `wasi-clang++`
- Bytecode Alliance `javy`
- `go` and `tinygo`
- `zig` symlinked as `zig-stable`
- `rustc` and/or `cargo`
- `warpo`
- `assemblyscript`/`asc` and `@assemblyscript/wasi-shim`
- QuickJS NG `qjs-wasi.wasm`
- `wasmtime`
- `bun` for fetching packages from NPM and bundling and minifiying source code
- `node` for `node:wasi` 

Compile programmatically, create and write Native Messaging manifests to Chromium configuration folder

```bash
node install_hosts.js
```

Alternatively use `deno -A install_hosts.js` or `bun install_hosts.js`. 

### Manual installation and usage on Chrome and Chromium

1. Navigate to `chrome://extensions`.
2. Toggle `Developer mode`.
3. Click `Load unpacked`.
4. Select `native-messaging-webassembly` folder.
5. Note the generated extension ID.
6. Open `nm_wasm.json` in a text editor, set `"path"` to absolute path of `nm_wasm.sh` and edit the shebang line therein to the compiled WASM file, e.g., `nm_assemblyscript.wasm`, and set `chrome-extension://<ID>/` using ID from 5 in `"allowed_origins"` array. 
7. Copy the file to Chrome or Chromium configuration folder, e.g., Chromium on Linux `~/.config/chromium/NativeMessagingHosts`; Chrome Dev Channel on Linix `~/.config/google-chrome-unstable/NativeMessagingHosts`.
8. Make sure `nm_wasm.sh` file is executable. For WAT embedded in `nm_c_wat.sh` we use `kill_wasmtime.sh` to terminate `wasmtime` using polling of `nm_c_wat.sh` because process substitution keeps `wasmtime` running after the Native Messaging host is disconnected and exits; those files need to executable, too.
9. To test click `service worker` link in panel of unpacked extension which is DevTools for `background.js` in MV3 `ServiceWorker`, observe echo'ed message from WASI Native Messaging host. To disconnect run `port.disconnect()`.

The Native Messaging host echoes back the message passed. 


# License
Do What the Fuck You Want to Public License [WTFPLv2](http://www.wtfpl.net/about/)
