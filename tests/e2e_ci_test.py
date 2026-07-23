import os
import sys
import json
import time
import shutil
import urllib.request
import subprocess
from pathlib import Path

# Force UTF-8 output encoding for Windows CMD
if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')

# Paths
ROOT_DIR = Path(__file__).resolve().parent.parent
DATA_DIR = ROOT_DIR / "data"
SCRATCH_DIR = ROOT_DIR / "scratch/e2e_server_test"
JAR_PATH = SCRATCH_DIR / "server.jar"
PACK_MCMETA = ROOT_DIR / "pack.mcmeta"

MC_SERVER_JAR_URL = "https://piston-data.mojang.com/v1/objects/4b93196924843ed24058d92ed6be27bc1296c09b/server.jar"

# System Java Resolution
def get_java_executable():
    # 1. Known Windows Runtime Java 21+ fallback
    win_custom = Path(r"C:\Users\30435\AppData\Roaming\.minecraft\runtime\java-runtime-epsilon\bin\java.exe")
    if win_custom.exists():
        return str(win_custom)
        
    # 2. Environment variable
    if "JAVA_HOME" in os.environ:
        java_bin = Path(os.environ["JAVA_HOME"]) / "bin" / ("java.exe" if os.name == "nt" else "java")
        if java_bin.exists():
            return str(java_bin)
    
    # 3. PATH check
    java_in_path = shutil.which("java")
    if java_in_path:
        return java_in_path
        
    return "java"

# Step 1: Static JSON Validation
def run_static_json_validation():
    print("==================================================")
    print("[STEP 1] RUNNING STATIC JSON & SYNTAX VALIDATION")
    print("==================================================")
    errors = []
    
    loot_tables = list(DATA_DIR.rglob("*.json"))
    print(f"[INFO] Auditing {len(loot_tables)} JSON files in data/...")
    
    for p in loot_tables:
        try:
            content = p.read_text(encoding="utf-8")
            data = json.loads(content)
        except Exception as e:
            errors.append(f"JSON Parse Error in {p.relative_to(ROOT_DIR)}: {e}")
            continue
            
        # Check minecraft:loot_table entries use 'value' key instead of 'name'
        def check_value_key(obj):
            if isinstance(obj, dict):
                if obj.get("type") == "minecraft:loot_table" and "name" in obj:
                    errors.append(f"Invalid 'name' key instead of 'value' in minecraft:loot_table entry: {p.relative_to(ROOT_DIR)}")
                for v in obj.values(): check_value_key(v)
            elif isinstance(obj, list):
                for item in obj: check_value_key(item)
                
        check_value_key(data)
        
        # Check enchant_with_levels format
        def check_ench_levels(obj):
            if isinstance(obj, dict):
                if obj.get("function") == "minecraft:enchant_with_levels":
                    levels = obj.get("levels")
                    if isinstance(levels, dict) and "type" in levels:
                        errors.append(f"Invalid 'type' field in enchant_with_levels levels: {p.relative_to(ROOT_DIR)}")
                for v in obj.values(): check_ench_levels(v)
            elif isinstance(obj, list):
                for item in obj: check_ench_levels(item)
                
        check_ench_levels(data)

    if errors:
        print("\n[FAIL] STATIC VALIDATION FAILED WITH ERRORS:")
        for err in errors:
            print(f"  - {err}")
        return False
        
    print("[OK] STATIC VALIDATION PASSED (0 errors found)\n")
    return True

# Step 2: Headless Minecraft Server E2E Test
def run_headless_server_e2e_test():
    print("==================================================")
    print("[STEP 2] RUNNING HEADLESS MINECRAFT SERVER E2E TEST")
    print("==================================================")
    
    java_exe = get_java_executable()
    print(f"[INFO] Using Java binary: {java_exe}")
    
    SCRATCH_DIR.mkdir(parents=True, exist_ok=True)
    
    # Download Server JAR if not present
    if not JAR_PATH.exists():
        print(f"[INFO] Downloading Minecraft 1.21.4 / 26.2 Server JAR from Mojang...")
        urllib.request.urlretrieve(MC_SERVER_JAR_URL, str(JAR_PATH))
        print(f"[INFO] Server JAR downloaded successfully ({JAR_PATH.stat().st_size} bytes)")
        
    # EULA
    eula_file = SCRATCH_DIR / "eula.txt"
    eula_file.write_text("eula=true\n", encoding="utf-8")
    
    # Server Properties
    props_file = SCRATCH_DIR / "server.properties"
    props_file.write_text("online-mode=false\nspawn-protection=0\nlevel-type=flat\n", encoding="utf-8")
    
    # Copy Datapack
    test_pack_dir = SCRATCH_DIR / "world/datapacks/rpg_test_pack"
    dst_data = test_pack_dir / "data"
    if dst_data.exists():
        shutil.rmtree(dst_data)
    shutil.copytree(DATA_DIR, dst_data)
    shutil.copy(PACK_MCMETA, test_pack_dir / "pack.mcmeta")
    print("[INFO] RPG Loot Datapack deployed to test server world!")
    
    # Launch Server Process
    cmd = [java_exe, "-Xmx1G", "-jar", str(JAR_PATH), "nogui"]
    proc = subprocess.Popen(
        cmd,
        cwd=str(SCRATCH_DIR),
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        encoding="utf-8",
        errors="replace",
        bufsize=1
    )
    
    logs = []
    
    def send_command(c):
        print(f"\n>>> EXECUTING TEST COMMAND: {c}")
        proc.stdin.write(c + "\n")
        proc.stdin.flush()
        
    server_ready = False
    start_time = time.time()
    
    while time.time() - start_time < 50:
        line = proc.stdout.readline()
        if not line: break
        line_str = line.strip()
        logs.append(line_str)
        
        if "Done (" in line_str and not server_ready:
            server_ready = True
            print("=== MINECRAFT SERVER READY ===")
            time.sleep(1.0)
            
            send_command("time set night")
            time.sleep(0.5)
            
            send_command("execute in minecraft:overworld run kill @e[type=item]")
            time.sleep(0.5)

            # Test 1: Load Options UI
            send_command("function rpgloot:options")
            time.sleep(1.0)
            
            # Test 2: Load Debug UI
            send_command("function rpgloot:debug")
            time.sleep(1.0)
            
            # Test 3: Summon Veteran Zombie
            send_command("execute in minecraft:overworld run function rpgloot:summon/veteran_zombie")
            time.sleep(1.5)
            
            # Test 4: Verify CustomName SNBT
            send_command("execute in minecraft:overworld as @e[type=zombie,limit=1] run data get entity @s CustomName")
            time.sleep(1.5)
            
            # Test 5: Kill Zombie & Assert RPG Loot Drop
            send_command("execute in minecraft:overworld run loot spawn 0 64 0 kill @e[type=zombie,limit=1]")
            time.sleep(2.0)
            
            # Test 6: Assert Item Drop count
            send_command("execute in minecraft:overworld as @e[type=item] run data get entity @s item.id")
            time.sleep(1.5)
            
            send_command("stop")

    proc.wait()
    
    if not server_ready:
        print("[FAIL] SERVER CRASHED OR TIMED OUT DURING BOOT!")
        return False
        
    # Assertions on Logs
    print("\n==================================================")
    print("[LOGS] VERIFYING E2E ASSERTION LOGS")
    print("==================================================")
    
    has_parse_error = False
    has_customname_ok = False
    has_item_dropped = False
    
    for l in logs:
        if "Couldn't parse data file" in l or "Failed to load function" in l:
            print("  [ERROR] CRITICAL LOG ERROR:", l)
            has_parse_error = True
        elif "has the following entity data" in l or "CustomName" in l or "Veteran" in l:
            if "has the following entity data" in l:
                print("  [OK] CUSTOMNAME VERIFIED:", l)
                has_customname_ok = True
        if "Dropped" in l and "from loot table" in l:
            print("  [OK] LOOT DROP LOG:", l)
            if "Dropped 0" not in l:
                has_item_dropped = True
                
    if has_parse_error:
        print("[FAIL] E2E FAIL: Detected data file or function load errors!")
        return False
    if not has_customname_ok:
        print("[FAIL] E2E FAIL: Veteran Zombie CustomName failed to render or verify!")
        return False
    if not has_item_dropped:
        print("[FAIL] E2E FAIL: Mob death dropped 0 items (loot table evaluation broken)!")
        return False
        
    print("\n[SUCCESS] ALL E2E ASSERTIONS PASSED SUCCESSFULLY!")
    return True

if __name__ == "__main__":
    ok1 = run_static_json_validation()
    if not ok1:
        sys.exit(1)
        
    ok2 = run_headless_server_e2e_test()
    if not ok2:
        sys.exit(1)
        
    print("\n==================================================")
    print("ALL CI/CD E2E INTEGRATION TESTS PASSED 100%")
    print("==================================================")
    sys.exit(0)
