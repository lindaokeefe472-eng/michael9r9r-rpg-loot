import os

data_dir = r"D:/game/mc/michael9r9r-s-rpg-loot-v1-15/data"

print("Searching for Name: or jump_strength across data directory...")
for root, dirs, files in os.walk(data_dir):
    for f in files:
        if f.endswith(".mcfunction") or f.endswith(".nbt") or f.endswith(".json"):
            path = os.path.join(root, f)
            try:
                with open(path, "r", encoding="utf-8", errors="ignore") as fp:
                    content = fp.read()
                    if "jump_strength" in content or 'Name:"' in content:
                        print(f"MATCH in {os.path.relpath(path, data_dir)}")
            except Exception as e:
                pass
