WebAssembly C Native Messaging host

Installation and usage on Chrome and Chromium

1. Compile `nm_c.c` to WASM 

```
$ git clone https://github.com/guest271314/native-messaging-webassembly
$ cd native-messaging-webassembly
$ /path/to/wasi-sdk-19.0/bin/clang nm_c.c -o nm_c.wasm
```

2. Navigate to `chrome://extensions`.
3. Toggle `Developer mode`.
4. Click `Load unpacked`.
5. Select native-messaging-webassembly folder.
6. Note the generated extension ID.
7. Open `nm_c_wasm.json` in a text editor, set `"path"` to absolute path of `nm_c_wasm.sh` or `nm_c_wat.sh` and `chrome-extension://<ID>/` using ID from 5 in `"allowed_origins"` array. 
8. Copy the file to Chrome or Chromium configuration folder, e.g., Chromium on \*nix `~/.config/chromium/NativeMessagingHosts`; Chrome dev channel on \*nix `~/.config/google-chrome-unstable/NativeMessagingHosts`.
9. Make sure `*.sh` files are executable executable.
10. To test click `service worker` link in panel of unpacked extension which is DevTools for `background.js` in MV3 `ServiceWorker`, observe echo'ed message from Node.js Native Messaging host. To disconnect run `port.disconnect()`.

The Native Messaging host echoes back the message passed. 


This is FOSS. If you think a license is necessary consider WTFPLv2 https://en.wikipedia.org/wiki/WTFPL applicable.
