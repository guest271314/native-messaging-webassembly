WebAssembly C Native Messaging host

Installation and usage on Chrome and Chromium

1. Compile `nm_c.c` to WASM 

```
$ git clone https://github.com/guest271314/native-messaging-webassembly
$ cd native-messaging-webassembly
$ /path/to/wasi-sdk-19.0/bin/clang nm_c.c -o nm_c.wasm
```
2. Download and save `wasmtime` executable to the extension directory.
3. Navigate to `chrome://extensions`.
4. Toggle `Developer mode`.
5. Click `Load unpacked`.
6. Select native-messaging-webassembly folder.
7. Note the generated extension ID.
8. Open `nm_c_wasm.json` in a text editor, set `"path"` to absolute path of `nm_c_wasm.sh` or `nm_c_wat.sh` and `chrome-extension://<ID>/` using ID from 7 in `"allowed_origins"` array. 
9. Copy the file to Chrome or Chromium configuration folder, e.g., Chromium on \*nix `~/.config/chromium/NativeMessagingHosts`; Chrome dev channel on \*nix `~/.config/google-chrome-unstable/NativeMessagingHosts`.
10. Make sure `*.sh` files are executable executable; for WAT embedded in `nm_c_wat.sh` we use `kill_wasmtime.sh` to terminate `wasmtime` using polling of `nm_c_wat.sh` because process substitution keeps `wasmtime` running after the Native Messaging host is disconnected and exits.
11. To test click `service worker` link in panel of unpacked extension which is DevTools for `background.js` in MV3 `ServiceWorker`, observe echo'ed message from WASI Native Messaging host. To disconnect run `port.disconnect()`.

The Native Messaging host echoes back the message passed. 


This is FOSS. If you think a license is necessary consider WTFPLv2 https://en.wikipedia.org/wiki/WTFPL applicable.
