import os

data_dir = r"D:/game/mc/michael9r9r-s-rpg-loot-v1-15/data"

print("Searching for legacy 'horse.jump_strength' attributes:")
for root, dirs, files in os.walk(data_dir):
    for f in files:
        if f.endswith(".mcfunction"):
            path = os.path.join(root, f)
            with open(path, "r", encoding="utf-8", errors="ignore") as fp:
                content = fp.read()
                if "horse.jump_strength" in content or 'Name:' in content:
                    print(f"MATCH: {os.path.relpath(path, data_dir)}")
