"""Boot a real Minecraft server for a version target and verify the built
datapack loads with zero errors.

Usage:
    python tools/verify_target.py --target 26.2
    python tools/verify_target.py --target 1.21.4

Server jars are looked up in tools/servers.json ({target: jar path}); a fresh
world is generated in scratch/version_servers/<target>/ on first run.
Assertions: no rpgloot function/data parse errors, recipes+advancements loaded,
`function rpgloot:test_suite` executes.
"""
import argparse
import json
import os
import shutil
import subprocess
import sys
import time
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DEFAULT_JAVA = r"C:\Users\30435\AppData\Roaming\.minecraft\runtime\java-runtime-epsilon\bin\java.exe"


def load_servers():
    p = ROOT / "tools/servers.json"
    if not p.exists():
        raise SystemExit("tools/servers.json missing - map targets to server jars first")
    return json.loads(p.read_text(encoding="utf-8"))


def build_zip(target):
    subprocess.run([sys.executable, str(ROOT / "tools/package.py"), "--target", target],
                   check=True)
    version = (ROOT / "VERSION").read_text(encoding="utf-8").strip()
    suffix = "" if target == "26.2" else f"-mc{target}"
    return ROOT / "build" / f"michael9r9r-rpg-loot-datapack-v{version}{suffix}.zip"


def prepare_server(target, jar):
    sandbox = ROOT / "scratch/version_servers" / target
    sandbox.mkdir(parents=True, exist_ok=True)
    (sandbox / "eula.txt").write_text("eula=true\n", encoding="utf-8")
    props = sandbox / "server.properties"
    if not props.exists():
        props.write_text(
            "online-mode=false\nlevel-type=minecraft\\:flat\nspawn-protection=0\n"
            "view-distance=4\nmax-tick-time=-1\nsync-chunk-writes=false\n",
            encoding="utf-8")
    lock = sandbox / "world/session.lock"
    if lock.exists():
        try:
            lock.unlink()
        except OSError:
            pass
    return sandbox


def deploy_datapack(sandbox, zip_path):
    # Deploy the ZIP itself (not extracted): pack discovery validates zip
    # metadata exactly like the client UI does, so "corrupted pack" class
    # bugs are caught here.
    dp_dir = sandbox / "world/datapacks"
    if dp_dir.exists():
        shutil.rmtree(dp_dir, ignore_errors=True)
    dp_dir.mkdir(parents=True, exist_ok=True)
    shutil.copy(zip_path, dp_dir / "rpgloot.zip")


def run_server(sandbox, jar, timeout=240):
    java = os.environ.get("RPGLOOT_JAVA", DEFAULT_JAVA)
    if not Path(java).exists():
        java = "java"
    proc = subprocess.Popen(
        [java, "-Xmx2G", "-jar", str(jar), "--nogui"],
        cwd=str(sandbox), stdin=subprocess.PIPE, stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT, text=True, bufsize=1,
        encoding="utf-8", errors="replace")
    logs = []
    ready = stop_sent = suite_ran = False
    start = time.time()
    while True:
        line = proc.stdout.readline()
        if not line:
            if proc.poll() is not None:
                break
            if time.time() - start > timeout and not stop_sent:
                proc.kill()
                break
            time.sleep(0.05)
            continue
        l = line.strip()
        logs.append(l)
        if "Done (" in l and not ready:
            ready = True
            time.sleep(1.0)
            proc.stdin.write("datapack list\n")
            proc.stdin.write("function rpgloot:test_suite\n")
            proc.stdin.flush()
            time.sleep(2.0)
            proc.stdin.write("stop\n")
            proc.stdin.flush()
            stop_sent = True
        if "Running function rpgloot:test_suite" in l:
            suite_ran = True
    return logs, ready, suite_ran


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--target", required=True)
    args = parser.parse_args()

    servers = load_servers()
    if args.target not in servers:
        raise SystemExit(f"no server jar mapped for target {args.target} in tools/servers.json")
    jar = (ROOT / servers[args.target]).resolve()
    if not jar.exists():
        raise SystemExit(f"server jar not found: {jar}")

    zip_path = build_zip(args.target)
    sandbox = prepare_server(args.target, jar)
    deploy_datapack(sandbox, zip_path)
    print(f"[*] Booting {args.target} server ({jar.name}) with {zip_path.name}")
    logs, ready, suite_ran = run_server(sandbox, jar)

    errors = [l for l in logs if
              ("Failed to load function" in l)
              or ("Couldn't parse data file" in l)
              or ("Error reading pack metadata" in l)
              or ("ERROR" in l and "rpgloot" in l)]
    recipes = any("Loaded" in l and "recipes" in l for l in logs)
    advancements = any("Loaded" in l and "advancements" in l for l in logs)
    pack_listed = any("rpgloot.zip" in l and "enabled" in l for l in logs)

    print(f"[*] ready={ready} suite={suite_ran} recipes={recipes} "
          f"advancements={advancements} pack_listed={pack_listed} errors={len(errors)}")
    for e in errors[:15]:
        print("  [ERROR]", e)
    if errors or not (ready and suite_ran and recipes and advancements and pack_listed):
        print(f"[FAIL] target {args.target} verification failed")
        raise SystemExit(1)
    print(f"[SUCCESS] target {args.target}: zip pack recognized + loads clean on real server")


if __name__ == "__main__":
    main()
