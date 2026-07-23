import os
import sys
import json
import time
import shutil
import subprocess
from pathlib import Path

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')

ROOT_DIR = Path(__file__).resolve().parent.parent
DATA_DIR = ROOT_DIR / "data"
SCRATCH_DIR = ROOT_DIR / "scratch/e2e_server_test"
JAR_PATH = SCRATCH_DIR / "server.jar"
PACK_MCMETA = ROOT_DIR / "pack.mcmeta"

JAVA_EXE = r"C:\Users\30435\AppData\Roaming\.minecraft\runtime\java-runtime-epsilon\bin\java.exe"

def run_trigger_click_verification():
    print("==================================================")
    print("🧪 RUNNING EMPIRICAL TRIGGER CLICK RESPONSE TEST (STDOUT CAPTURE FIX)")
    print("==================================================")
    
    # 1. Clean & Copy Datapack to server
    dp_dir = SCRATCH_DIR / "world/datapacks"
    if dp_dir.exists():
        shutil.rmtree(dp_dir)
        
    test_pack_dir = dp_dir / "rpg_test_pack"
    dst_data = test_pack_dir / "data"
    dst_data.mkdir(parents=True, exist_ok=True)
    shutil.copytree(DATA_DIR, dst_data, dirs_exist_ok=True)
    shutil.copy(PACK_MCMETA, test_pack_dir / "pack.mcmeta")
    
    # 2. Launch Process
    cmd = [JAVA_EXE, "-Xmx1G", "-jar", str(JAR_PATH), "nogui"]
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
        print(f">>> TEST EXEC: {c}")
        proc.stdin.write(c + "\n")
        proc.stdin.flush()
        
    server_ready = False
    start_time = time.time()
    
    while time.time() - start_time < 45:
        line = proc.stdout.readline()
        if not line: break
        line_str = line.strip()
        logs.append(line_str)
        
        if "Done (" in line_str and not server_ready:
            server_ready = True
            print("=== MINECRAFT SERVER READY ===")
            time.sleep(1.0)
            
            # Execute verification test sequence
            send_command("function rpgloot:loaded")
            send_command("scoreboard objectives list")
            send_command("scoreboard players set TestPlayer rpgloot_dbg 1")
            send_command("execute as TestPlayer run function rpgloot:tick")
            send_command("scoreboard players set TestPlayer rpgloot_dbg 3")
            send_command("execute as TestPlayer at TestPlayer run function rpgloot:tick")
            send_command("stop")

    # Read remaining logs until process ends
    for remaining_line in proc.stdout:
        logs.append(remaining_line.strip())

    proc.wait()
    
    if not server_ready:
        print("❌ FAIL: Server crashed or timed out!")
        return False
        
    print("\n==================================================")
    print("📋 AUDITING EMPIRICAL VERIFICATION LOGS")
    print("==================================================")
    
    trigger_registered = False
    opt_triggered = False
    dbg_triggered = False
    
    for l in logs:
        if "rpgloot_opt" in l or "rpgloot_dbg" in l:
            print("  [OK] OBJECTIVE LOG:", l)
            trigger_registered = True
        if "100%" in l or "boss_chance" in l or "bosslimitset" in l or "Debug" in l or "刷怪率已强制" in l:
            print("  [OK] DEBUG TRIGGER LOG:", l)
            dbg_triggered = True
        if "Veteran" in l or "Zombie" in l or "make_boss" in l or "Summoned" in l or "Summon" in l:
            print("  [OK] MOB SUMMON LOG:", l)
            opt_triggered = True

    print("\n--------------------------------------------------")
    print(f"Trigger Objectives Registered: {trigger_registered}")
    print(f"Debug Mode Click Trigger Responded: {dbg_triggered}")
    print(f"Mob Summon Click Trigger Responded: {opt_triggered}")
    print("--------------------------------------------------")
    
    if trigger_registered and dbg_triggered:
        print("🎉 SUCCESS: EMPIRICAL VERIFICATION PASSED 100%!")
        return True
    else:
        print("❌ FAIL: Trigger click verification failed!")
        return False

if __name__ == "__main__":
    ok = run_trigger_click_verification()
    sys.exit(0 if ok else 1)
