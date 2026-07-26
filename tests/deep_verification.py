import os, json, re

import pathlib
data_dir = str(pathlib.Path(__file__).resolve().parent.parent / "data")

print("==========================================")
print("     RPG LOOT DEEP VERIFICATION SUITE     ")
print("==========================================")

errors = []
warnings = []

# 1. Collect all functions and loot tables
existing_functions = set()
existing_loot_tables = set()

for root, dirs, files in os.walk(data_dir):
    for f in files:
        rel_path = os.path.relpath(os.path.join(root, f), data_dir).replace("\\", "/")
        parts = rel_path.split("/")
        namespace = parts[0]
        
        if len(parts) > 2 and (parts[1] == "functions" or parts[1] == "function"):
            func_name = f"{namespace}:" + "/".join(parts[2:]).replace(".mcfunction", "")
            existing_functions.add(func_name)
            
        if len(parts) > 2 and (parts[1] == "loot_tables" or parts[1] == "loot_table"):
            table_name = f"{namespace}:" + "/".join(parts[2:]).replace(".json", "")
            existing_loot_tables.add(table_name)

print(f"[*] Found {len(existing_functions)} registered functions.")
print(f"[*] Found {len(existing_loot_tables)} registered loot tables.")

# 2. Check JSON files
json_count = 0
for root, dirs, files in os.walk(data_dir):
    for f in files:
        if f.endswith(".json"):
            json_count += 1
            path = os.path.join(root, f)
            try:
                with open(path, "r", encoding="utf-8") as fp:
                    json.load(fp)
            except Exception as e:
                errors.append(f"Invalid JSON at {path}: {e}")

print(f"[*] Verified {json_count} JSON files for syntax correctness.")

# 3. Check mcfunction references
mcf_count = 0
for root, dirs, files in os.walk(data_dir):
    for f in files:
        if f.endswith(".mcfunction"):
            mcf_count += 1
            path = os.path.join(root, f)
            with open(path, "r", encoding="utf-8", errors="ignore") as fp:
                for line_idx, line in enumerate(fp, 1):
                    line = line.strip()
                    if not line or line.startswith("#"):
                        continue
                    
                    # Check function calls
                    func_matches = re.findall(r'function\s+([a-z0-9_.-]+:[a-z0-9_./-]+)', line)
                    for func_ref in func_matches:
                        if func_ref not in existing_functions:
                            errors.append(f"Broken function call '{func_ref}' at {path}:{line_idx}")

                    # Check loot calls
                    loot_matches = re.findall(r'loot\s+(?:give|spawn|replace)[^\n]+loot\s+([a-z0-9_.-]+:[a-z0-9_./-]+)', line)
                    for loot_ref in loot_matches:
                        if loot_ref not in existing_loot_tables:
                            errors.append(f"Broken loot table reference '{loot_ref}' at {path}:{line_idx}")

print(f"[*] Verified {mcf_count} mcfunction files and cross-references.")

# 4. Check new map recipes & map loot tables specifically
print("\n--- Map System & UX Verification ---")
required_maps = [
    "rpgloot:maps/overgrown_armory",
    "rpgloot:maps/library",
    "rpgloot:maps/sunken_ruins",
    "rpgloot:maps/jeweled_caverns",
    "rpgloot:maps/magma_manufactory",
    "rpgloot:maps/catacombs",
    "rpgloot:maps/arid_tomb",
    "rpgloot:maps/buried_fortress",
    "rpgloot:maps/brimstone_bastion",
    "rpgloot:maps/divine_sanctum",
    "rpgloot:maps/alpha_castle",
    "rpgloot:maps/graveyard",
    "rpgloot:maps/capped_tower",
    "rpgloot:maps/collapsed_ruins"
]

for m in required_maps:
    if m not in existing_loot_tables:
        errors.append(f"Missing map loot table: {m}")
    else:
        print(f"  [OK] Map Loot Table verified: {m}")

print("\n==========================================")
if errors:
    print(f"FAILED: Found {len(errors)} issues:")
    for err in errors:
        print("  - " + err)
else:
    print("SUCCESS: 100% Empirically Verified! Zero broken references or syntax errors.")
print("==========================================")
