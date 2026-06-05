// Headless benchmark for the native-messaging WASI hosts (CI / standalone).
//
// For each host `.wasm` and each message size, spawn it under wasmtime, send a
// Chrome Native Messaging frame (4-byte little-endian length + UTF-8 JSON body)
// carrying `Array(N)` over stdin — the same payload background.js / test_wasi.js
// send — collect the framed response(s) over stdout, time the round-trip,
// validate the echoed JSON, and print a sorted timing/memory table per size.
// This is the headless equivalent of the Chrome `connectNative` benchmark in
// test_wasi.js (which can't run in CI). It also writes a GitHub Pages results
// site (site/index.html + site/results.json).
//
// Usage:  node ci/benchmark.mjs <wasmtime> <host1.wasm> [host2.wasm ...]
//   env:  SIZES=209715,13421760  element counts to test (default: ~1 MiB and ~64 MiB)
//         RUNS=5                  timed repetitions per host (best wall reported)
//         TIMEOUT=60              per-run seconds before the host is killed
//
// A host "passes" a size if the concatenated response frames are all valid JSON
// and the element count round-trips (sum of array lengths === N). Validation
// failures are reported in the table (validJSON/match columns) but do NOT fail
// the process — this is a showcase benchmark, not a regression gate.

import { spawn } from "node:child_process";
import { mkdirSync, readFileSync, writeFileSync } from "node:fs";

const [wasmtime, ...hosts] = process.argv.slice(2);
if (!wasmtime || hosts.length === 0) {
  console.error(
    "usage: node ci/benchmark.mjs <wasmtime> <host1.wasm> [host2.wasm ...]",
  );
  process.exit(1);
}
const SIZES = (process.env.SIZES || "209715,13421760")
  .split(",")
  .map((s) => Number(s.trim()));
const RUNS = Number(process.env.RUNS) || 5;
const TIMEOUT = (Number(process.env.TIMEOUT) || 60) * 1000;

function runOnce(wasm, message, N) {
  return new Promise((resolve) => {
    const args = [
      "run",
      "-W",
      "gc=y,function-references=y,tail-call=y,exceptions=y",
      "--dir=.",
      wasm,
    ];
    const child = spawn(wasmtime, args, { stdio: ["pipe", "pipe", "ignore"] });
    let peak = 0;
    const mon = setInterval(() => {
      try {
        const m = /VmRSS:\s+(\d+)/.exec(
          readFileSync(`/proc/${child.pid}/status`, "utf8"),
        );
        if (m) peak = Math.max(peak, +m[1]);
      } catch {}
    }, 5);
    const chunks = [];
    let last = 0;
    const t0 = performance.now();
    child.stdout.on("data", (d) => {
      chunks.push(d);
      last = performance.now();
    });
    child.on("error", () => {
      clearInterval(mon);
      clearInterval(iv);
      clearTimeout(killer);
      resolve({ error: "spawn" });
    });
    // Keep stdin open and stop via idle-detection + kill (like nm_standalone_test.js).
    // Closing stdin makes hosts that don't handle EOF spin echoing empty frames.
    child.stdin.write(message);

    const finish = (extra = {}) => {
      clearInterval(mon);
      clearInterval(iv);
      clearTimeout(killer);
      try {
        child.kill("SIGKILL");
      } catch {}
      const out = Buffer.concat(chunks);
      let p = 0,
        frames = 0,
        elems = 0,
        ok = out.length > 0;
      while (p + 4 <= out.length) {
        const L = out.readUInt32LE(p);
        p += 4;
        const f = out.subarray(p, p + L);
        p += L;
        frames++;
        try {
          const a = JSON.parse(f.toString());
          if (Array.isArray(a)) elems += a.length;
          else ok = false;
        } catch {
          ok = false;
        }
      }
      resolve({
        wall: (last - t0) / 1000,
        peakMB: peak / 1024,
        frames,
        elems,
        ok,
        match: elems === N,
        ...extra,
      });
    };
    // idle detection: response complete when no new output for 250 ms
    const iv = setInterval(() => {
      if (last && performance.now() - last > 250 && chunks.length) finish();
    }, 25);
    const killer = setTimeout(() => finish({ error: "timeout" }), TIMEOUT);
  });
}

async function benchSize(N) {
  const body = Buffer.from(JSON.stringify(new Array(N)), "utf8"); // [null,null,...]
  const header = Buffer.alloc(4);
  header.writeUInt32LE(body.length, 0);
  const message = Buffer.concat([header, body]);
  const rows = [];
  for (const wasm of hosts) {
    const name = wasm
      .split("/")
      .pop()
      .replace(/\.wasm$/, "");
    let best = null,
      last = null;
    for (let i = 0; i < RUNS; i++) {
      const r = await runOnce(wasm, message, N);
      last = r;
      if (r.error) break; // don't retry a host that errored/timed out
      if (r.ok && (best === null || r.wall < best.wall)) best = r;
    }
    const r = best || last;
    rows.push({
      host: name,
      "wall(s)": r.error ? `ERR(${r.error})` : r.wall.toFixed(3),
      "peak(MB)": r.error ? "-" : r.peakMB.toFixed(0),
      frames: r.frames ?? "-",
      elems: r.elems ?? "-",
      validJSON: r.error ? false : r.ok,
      "match(N)": r.error ? false : r.match,
    });
  }
  rows.sort((a, b) => {
    const av = parseFloat(a["wall(s)"]),
      bv = parseFloat(b["wall(s)"]);
    if (Number.isNaN(av)) return 1;
    if (Number.isNaN(bv)) return -1;
    return av - bv;
  });
  return { N, bytes: body.length, rows };
}

const results = [];
for (const N of SIZES) {
  const res = await benchSize(N);
  results.push(res);
  console.log(
    `\n--- N=${N} (~${(res.bytes / 1048576).toFixed(2)} MiB JSON), best of ${RUNS} ---\n`,
  );
  console.table(res.rows);
}

// ---- GitHub Pages results site ----
mkdirSync("site", { recursive: true });
const generated = new Date().toISOString();
const cols = [
  "host",
  "wall(s)",
  "peak(MB)",
  "frames",
  "elems",
  "validJSON",
  "match(N)",
];
const tableHtml = (res) => {
  const tbody = res.rows
    .map((r) => {
      const cells = cols
        .map((k) => {
          const cls =
            k === "host"
              ? "host"
              : k === "validJSON" || k === "match(N)"
                ? r[k]
                  ? "ok"
                  : "bad"
                : "";
          return `<td class="${cls}">${r[k]}</td>`;
        })
        .join("");
      return `<tr>${cells}</tr>`;
    })
    .join("\n");
  return `<h2>~${(res.bytes / 1048576).toFixed(2)} MiB &mdash; <code>Array(${res.N})</code></h2>
<table><thead><tr>${cols.map((k) => `<th>${k}</th>`).join("")}</tr></thead>
<tbody>
${tbody}
</tbody></table>`;
};
const html = `<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Native Messaging WASI host benchmark</title>
<style>
  :root { color-scheme: light dark; }
  body { font: 15px/1.5 system-ui, -apple-system, sans-serif; max-width: 860px; margin: 2rem auto; padding: 0 1rem; }
  h1 { font-size: 1.4rem; margin-bottom: .25rem; } h2 { font-size: 1.1rem; margin-top: 2rem; }
  code { background: #8881; padding: .1em .35em; border-radius: 4px; }
  table { border-collapse: collapse; width: 100%; margin: .75rem 0; }
  th, td { padding: .4rem .65rem; text-align: right; border-bottom: 1px solid #8884; }
  th:first-child, td.host { text-align: left; font-weight: 600; }
  thead th { border-bottom: 2px solid #8888; }
  td.ok { color: #2a9d6a; } td.bad { color: #d6455d; font-weight: 700; }
  .meta { color: #8889; font-size: .88rem; }
</style></head><body>
<h1>Native Messaging WASI host benchmark</h1>
<p>Each host is sent a Chrome Native Messaging frame (4-byte LE length + UTF-8 JSON) carrying
<code>Array(N)</code> over stdin under wasmtime; the echoed frames are validated as JSON and the
round-trip is timed. Headless equivalent of the <code>connectNative</code> benchmark in
<code>test_wasi.js</code>. Two sizes: ~1 MiB (a typical message) and ~64 MiB (Chrome's
extension&rarr;host maximum). Lower <code>wall(s)</code> is faster; <code>peak(MB)</code> is the host
process's peak RSS &mdash; at 64 MiB it separates streaming hosts (flat memory) from those that hold
the whole body. Best of ${RUNS} runs.</p>
${results.map(tableHtml).join("\n")}
<p class="meta">Generated ${generated} by <code>ci/benchmark.mjs</code> &middot; each table sorted fastest first.</p>
</body></html>
`;
writeFileSync("site/index.html", html);
writeFileSync(
  "site/results.json",
  JSON.stringify({ runs: RUNS, generated, results }, null, 2),
);
console.log("\nwrote site/index.html + site/results.json");

const failed = results
  .flatMap((r) => r.rows.map((row) => ({ N: r.N, ...row })))
  .filter((r) => !r.validJSON || !r["match(N)"]);
if (failed.length) {
  console.error(
    `\nNote: ${failed.length} host/size combo(s) did not validate: ${failed.map((r) => `${r.host}@${r.N}`).join(", ")}`,
  );
}
