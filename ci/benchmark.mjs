// Headless benchmark for the native-messaging WASI hosts (CI / standalone).
//
// For each host `.wasm`, spawn it under wasmtime, send a Chrome Native Messaging
// frame (4-byte little-endian length + UTF-8 JSON body) over stdin — the same
// `Array(N)` payload `background.js` / `test_wasi.js` send — collect the framed
// response(s) over stdout, time the round-trip, validate the echoed JSON, and
// print a sorted table (fastest first). This is the headless equivalent of the
// Chrome `connectNative` benchmark in `test_wasi.js` (which can't run in CI).
//
// Usage:  node ci/benchmark.mjs <wasmtime> <host1.wasm> [host2.wasm ...]
//   env:  N=209715   array length (default; ~1 MiB JSON, matches background.js)
//         RUNS=5     timed repetitions per host (the best wall time is reported)
//         TIMEOUT=60 per-run seconds before the host is killed
//
// A host "passes" if the concatenated response frames are all valid JSON and the
// element count round-trips (sum of array lengths === N).

import { spawn } from "node:child_process";
import { mkdirSync, readFileSync, writeFileSync } from "node:fs";

const [wasmtime, ...hosts] = process.argv.slice(2);
if (!wasmtime || hosts.length === 0) {
  console.error(
    "usage: node ci/benchmark.mjs <wasmtime> <host1.wasm> [host2.wasm ...]",
  );
  process.exit(1);
}
const N = Number(process.env.N) || 209715;
const RUNS = Number(process.env.RUNS) || 5;
const TIMEOUT = (Number(process.env.TIMEOUT) || 60) * 1000;

const body = Buffer.from(JSON.stringify(new Array(N)), "utf8"); // [null,null,...]
const header = Buffer.alloc(4);
header.writeUInt32LE(body.length, 0);
const message = Buffer.concat([header, body]);

function runOnce(wasm) {
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

const rows = [];
for (const wasm of hosts) {
  const name = wasm
    .split("/")
    .pop()
    .replace(/\.wasm$/, "");
  let best = null,
    last = null;
  for (let i = 0; i < RUNS; i++) {
    const r = await runOnce(wasm);
    last = r;
    if (!r.error && r.ok && (best === null || r.wall < best.wall)) best = r;
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
console.log(
  `\nNative Messaging host benchmark — N=${N} (~${(body.length / 1048576).toFixed(2)} MiB JSON), best of ${RUNS}\n`,
);
console.table(rows);

// Static results page for GitHub Pages (site/index.html + machine-readable results.json).
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
const tbody = rows
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
const html = `<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Native Messaging WASI host benchmark</title>
<style>
  :root { color-scheme: light dark; }
  body { font: 15px/1.5 system-ui, -apple-system, sans-serif; max-width: 840px; margin: 2rem auto; padding: 0 1rem; }
  h1 { font-size: 1.4rem; margin-bottom: .25rem; }
  code { background: #8881; padding: .1em .35em; border-radius: 4px; }
  table { border-collapse: collapse; width: 100%; margin: 1.25rem 0; }
  th, td { padding: .4rem .65rem; text-align: right; border-bottom: 1px solid #8884; }
  th:first-child, td.host { text-align: left; font-weight: 600; }
  thead th { border-bottom: 2px solid #8888; }
  td.ok { color: #2a9d6a; } td.bad { color: #d6455d; font-weight: 700; }
  .meta { color: #8889; font-size: .88rem; }
</style></head><body>
<h1>Native Messaging WASI host benchmark</h1>
<p>Each host is sent a Chrome Native Messaging frame (4-byte LE length + UTF-8 JSON) carrying
<code>Array(${N})</code> (~${(body.length / 1048576).toFixed(2)} MiB) over stdin under wasmtime; the echoed frames
are validated as JSON and the round-trip is timed. Headless equivalent of the <code>connectNative</code>
benchmark in <code>test_wasi.js</code>. Lower <code>wall(s)</code> is faster; best of ${RUNS} runs.</p>
<table><thead><tr>${cols.map((k) => `<th>${k}</th>`).join("")}</tr></thead>
<tbody>
${tbody}
</tbody></table>
<p class="meta">Generated ${generated} by <code>ci/benchmark.mjs</code> · sorted fastest first.</p>
</body></html>
`;
writeFileSync("site/index.html", html);
writeFileSync(
  "site/results.json",
  JSON.stringify({ N, runs: RUNS, generated, rows }, null, 2),
);
console.log("wrote site/index.html + site/results.json");

const failed = rows.filter((r) => !r["validJSON"] || !r["match(N)"]);
if (failed.length) {
  console.error(
    `\n${failed.length} host(s) failed validation: ${failed.map((r) => r.host).join(", ")}`,
  );
  process.exit(1);
}
