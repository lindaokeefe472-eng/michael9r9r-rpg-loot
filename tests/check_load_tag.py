import os, json

root_dir = r"D:/game/mc/michael9r9r-s-rpg-loot-v1-15/data"

print("--- SEARCHING FOR LOAD TAGS & FUNCTIONS ---")
for root, dirs, files in os.walk(root_dir):
    for f in files:
        if f.endswith(".json") or f.endswith(".mcfunction"):
            path = os.path.join(root, f)
            with open(path, "r", encoding="utf-8", errors="ignore") as fp:
                content = fp.read()
                if "rpg_help" in content or "load" in path.lower():
                    print(f"{os.path.relpath(path, root_dir)} -> contains match")
                    if "load.json" in f:
                        print("  CONTENT:", content)
