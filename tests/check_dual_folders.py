import os

root_dir = r"D:/game/mc/michael9r9r-s-rpg-loot-v1-15/data/rpgloot"
print("Checking function vs functions directories:")
print("function dir exists:", os.path.exists(os.path.join(root_dir, "function")))
print("functions dir exists:", os.path.exists(os.path.join(root_dir, "functions")))

for folder in ["function", "functions"]:
    p = os.path.join(root_dir, folder, "tick.mcfunction")
    if os.path.exists(p):
        with open(p, "r", encoding="utf-8") as f:
            content = f.read()
            print(f"--- {folder}/tick.mcfunction ---")
            print(content[-300:])
