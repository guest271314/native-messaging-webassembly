async function nativeMessagingPerformanceTest(i = 10) {
  const runtimes = new Map([
    ["nm_assemblyscript", 0],
    ["nm_c_wasi", 0],
    ["nm_cpp_wasi", 0],
 //   ["nm_nodejs", 0],
    ["nm_rust_wasi", 0],
    ["nm_go_wasi", 0],
    ["nm_tinygo_wasi", 0],
    ["nm_warpo", 0],
    ["nm_zig_wasi", 0]
  ]);
  for (let j = 0; j < i; j++) {
    for (const [runtime] of runtimes) {
      console.log(`${runtime} run no. ${j} of ${i}}`);
      try {
        const { resolve, reject, promise } = Promise.withResolvers();
        const now = performance.now();
        const port = chrome.runtime.connectNative(runtime);
        port.onMessage.addListener((message) => {
          console.assert(message.length === 209715, {
            message,
            runtime,
          });
          const n = runtimes.get(runtime);
          runtimes.set(runtime, n + ((performance.now() - now) / 1000));
          port.disconnect();
          resolve();
        });
        port.onDisconnect.addListener(() => reject(chrome.runtime.lastError));
        port.postMessage(new Array(209715));
        // Handle SpiderMonkey, send "\r\n\r\n" to process full message with js
        if (runtime === "nm_spidermonkey") {
          port.postMessage("\r\n\r\n");
        }
        await promise;
      } catch (e) {
        console.log(e, runtime);
        continue;
      }
    }
    await scheduler.postTask(() => {}, {
      delay: 10
    });
  }
  const sorted = [...runtimes].map(([k, n]) => [k, n / i]).sort((
    [, a],
    [, b],
  ) => a < b ? -1 : a === b ? 0 : 1);
  console.table(sorted);
}
await nativeMessagingPerformanceTest(100);
