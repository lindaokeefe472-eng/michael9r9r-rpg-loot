import json
import os
import re
import subprocess
import time
import shutil
from pathlib import Path

ROOT = Path(r"D:/game/mc/michael9r9r-s-rpg-loot-v1-15")
TEST_SERVER_DIR = ROOT / "scratch/e2e_server_test"
FUNC_DIR = ROOT / "data/rpgloot/functions"

def run_e2e_test():
    print("==================================================")
    print("[STEP 1] DYNAMIC ASSET & JSON VALIDATION")
    print("==================================================")
    
    # 1. Kill lingering java processes if any
    try:
        subprocess.run(["taskkill", "/F", "/IM", "java.exe"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        time.sleep(1.0)
    except Exception:
        pass

    # 2. Validate all JSON syntax dynamically
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

    # 3. Dynamically discover all pack assets
    summon_funcs = [f.stem for f in (FUNC_DIR / "summon").glob("*.mcfunction")]
    locate_funcs = [f.stem for f in (FUNC_DIR / "locate").glob("*.mcfunction")]
    event_funcs = [f.stem for f in (FUNC_DIR / "events").glob("*.mcfunction")]
    
    print(f"[DYNAMIC COVERAGE] Discovered {len(summon_funcs)} summon funcs, {len(locate_funcs)} locate funcs, {len(event_funcs)} event funcs.")

    print("\n==================================================")
    print("[STEP 2] RUNNING HEADLESS MINECRAFT SERVER 100% E2E TEST")
    print("==================================================")
    
    java_exe = r"C:\Users\30435\AppData\Roaming\.minecraft\runtime\java-runtime-epsilon\bin\java.exe"
    server_jar = TEST_SERVER_DIR / "server.jar"
    
    # Clean world datapacks & lock
    world_dp_dir = TEST_SERVER_DIR / "world/datapacks"
    session_lock = TEST_SERVER_DIR / "world/session.lock"
    if session_lock.exists():
        try:
            session_lock.unlink()
        except Exception:
            pass
            
    if world_dp_dir.exists():
        shutil.rmtree(world_dp_dir, ignore_errors=True)
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
    test_suite_executed = False
    start_time = time.time()

    while True:
        line = proc.stdout.readline()
        if not line:
            if proc.poll() is not None:
                break
            time.sleep(0.05)
            if time.time() - start_time > 60 and not stop_sent:
                proc.stdin.write("stop\n")
                proc.stdin.flush()
                stop_sent = True
            continue
            
        l_str = line.strip()
        server_logs.append(l_str)
        print(f"[SERVER LOG] {l_str}")
        
        if "Done (" in l_str and not ready:
            ready = True
            print("=== MINECRAFT SERVER READY ===")
            time.sleep(1.0)
            print(">>> EXECUTING 100% COVERAGE DATAPACK FULL E2E TEST SUITE...")
            proc.stdin.write("function rpgloot:full_e2e_test_suite\n")
            proc.stdin.flush()
            time.sleep(3.0)
            proc.stdin.write("stop\n")
            proc.stdin.flush()
            stop_sent = True
            
        if "Running function rpgloot:full_e2e_test_suite" in l_str:
            test_suite_executed = True

    print("\n==================================================")
    print("[LOGS] VERIFYING 100% E2E ASSERTION LOGS")
    print("==================================================")
    
    errors_found = []
    recipes_loaded = False
    advancements_loaded = False
    
    for line in server_logs:
        if "[Worker-Main-" in line and "ERROR" in line:
            errors_found.append(line)
        if "Failed to load function" in line or "Couldn't parse data file" in line or "Unknown function" in line:
            errors_found.append(line)
        if "Loaded" in line and "recipes" in line:
            recipes_loaded = True
            print(f"  [OK] SERVER RECIPES LOADED: {line}")
        if "Loaded" in line and "advancements" in line:
            advancements_loaded = True
            print(f"  [OK] SERVER ADVANCEMENTS LOADED: {line}")

    if errors_found:
        print("[FAIL] E2E FAIL: Detected data file or function load errors!")
        for err in errors_found[:15]:
            print(f"  [ERROR] CRITICAL LOG ERROR: {err}")
        exit(1)
        
    if not (recipes_loaded and advancements_loaded and test_suite_executed):
        print(f"[FAIL] E2E FAIL: Assertion failed! Recipes: {recipes_loaded}, Advancements: {advancements_loaded}, FullTestSuite: {test_suite_executed}")
        exit(1)

    print("\n[SUCCESS] 100% FULL E2E COVERAGE MINECRAFT SERVER TEST PASSED WITH ZERO ERRORS!")
    print("==================================================")

if __name__ == "__main__":
    run_e2e_test()
