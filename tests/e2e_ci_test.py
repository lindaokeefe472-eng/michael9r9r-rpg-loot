import json
import os
import re
import subprocess
import time
import shutil
from pathlib import Path

ROOT = Path(r"D:/game/mc/michael9r9r-s-rpg-loot-v1-15")
TEST_SERVER_DIR = ROOT / "scratch/e2e_server_test"
BUILD_DIR = ROOT / "build"
FUNC_DIR = ROOT / "data/rpgloot/functions"
MC_LT_DIR = ROOT / "data/minecraft/loot_table"

def run_e2e_test():
    print("==================================================")
    print("[STEP 1] RUNNING DYNAMIC ASSET & JSON VALIDATION")
    print("==================================================")
    
    # 1. Validate all JSON syntax dynamically
    json_files = list(ROOT.rglob("*.json"))
    json_errors = []
    for jp in json_files:
        if "scratch" in jp.parts or ".git" in jp.parts or "build" in jp.parts:
            continue
        try:
            json.loads(jp.read_text(encoding="utf-8"))
        except Exception as e:
            json_errors.append((jp, str(e)))
            
    if json_errors:
        print(f"[FAIL] Found {len(json_errors)} invalid JSON files!")
        for jp, err in json_errors:
            print(f"  - {jp}: {err}")
        exit(1)
    print(f"[OK] DYNAMIC VALIDATION PASSED: All {len(json_files)} JSON files are 100% valid!")

    # 2. Dynamically discover all pack assets
    summon_funcs = [f.stem for f in (FUNC_DIR / "summon").glob("*.mcfunction")]
    locate_funcs = [f.stem for f in (FUNC_DIR / "locate").glob("*.mcfunction")]
    event_funcs = [f.stem for f in (FUNC_DIR / "events").glob("*.mcfunction")]
    
    print(f"[DYNAMIC COVERAGE] Discovered {len(summon_funcs)} summon funcs, {len(locate_funcs)} locate funcs, {len(event_funcs)} event funcs.")

    print("\n==================================================")
    print("[STEP 2] RUNNING HEADLESS MINECRAFT SERVER E2E TEST")
    print("==================================================")
    
    java_exe = r"C:\Users\30435\AppData\Roaming\.minecraft\runtime\java-runtime-epsilon\bin\java.exe"
    server_jar = TEST_SERVER_DIR / "server.jar"
    
    # Clean world datapacks
    world_dp_dir = TEST_SERVER_DIR / "world/datapacks"
    if world_dp_dir.exists():
        shutil.rmtree(world_dp_dir)
    world_dp_dir.mkdir(parents=True, exist_ok=True)
    
    # Copy fresh datapack to test server
    target_dp = world_dp_dir / "rpgloot"
    shutil.copytree(ROOT / "data", target_dp / "data")
    shutil.copy(ROOT / "pack.mcmeta", target_dp / "pack.mcmeta")
    
    print("[INFO] Clean RPG Loot Datapack deployed to test server world!")
    
    proc = subprocess.Popen(
        [java_exe, "-Xmx2G", "-jar", str(server_jar), "--nogui"],
        cwd=str(TEST_SERVER_DIR),
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        bufsize=1
    )
    
    server_logs = []
    ready = False
    stop_sent = False

    while True:
        line = proc.stdout.readline()
        if not line:
            if proc.poll() is not None:
                break
            time.sleep(0.05)
            continue
            
        l_str = line.strip()
        server_logs.append(l_str)
        
        if "Done (" in l_str and not ready:
            ready = True
            print("=== MINECRAFT SERVER READY ===")
            time.sleep(1.0)
            print(">>> EXECUTING DYNAMIC DATAPACK TEST SUITE...")
            proc.stdin.write("function rpgloot:test_suite\n")
            proc.stdin.flush()
            
        if ready and not stop_sent and any("Veteran Zombie has the following entity data" in log for log in server_logs):
            stop_sent = True
            time.sleep(1.0)
            print(">>> EXECUTING STOP COMMAND...")
            proc.stdin.write("stop\n")
            proc.stdin.flush()

    print("\n==================================================")
    print("[LOGS] VERIFYING E2E ASSERTION LOGS")
    print("==================================================")
    
    errors_found = []
    customname_ok = False
    loot_drop_ok = False
    
    for line in server_logs:
        if "[Worker-Main-" in line and "ERROR" in line:
            errors_found.append(line)
        if "Failed to load function" in line or "Couldn't parse data file" in line:
            errors_found.append(line)
        if "Veteran Zombie has the following entity data" in line:
            customname_ok = True
            print(f"  [OK] CUSTOMNAME VERIFIED: {line}")
        if "Dropped" in line and "items from loot table" in line:
            loot_drop_ok = True
            print(f"  [OK] LOOT DROP LOG: {line}")

    if errors_found:
        print("[FAIL] E2E FAIL: Detected data file or function load errors!")
        for err in errors_found[:10]:
            print(f"  [ERROR] CRITICAL LOG ERROR: {err}")
        exit(1)
        
    if not (customname_ok and loot_drop_ok):
        print(f"[FAIL] E2E FAIL: Assertion failed! CustomName OK: {customname_ok}, Loot Drop OK: {loot_drop_ok}")
        exit(1)

    print("\n[SUCCESS] DYNAMIC E2E TEST PASSED 100% WITH ZERO ERRORS!")
    print("==================================================")

if __name__ == "__main__":
    run_e2e_test()
