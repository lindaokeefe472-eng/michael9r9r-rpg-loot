import os, re

base_dir = r"D:/game/mc/michael9r9r-s-rpg-loot-v1-15/data/rpgloot"
func_dirs = [os.path.join(base_dir, "functions"), os.path.join(base_dir, "function")]

targets = [
    "enchanted_chicken.mcfunction",
    "raid_blunderbore.mcfunction",
    "spectre_spider.mcfunction",
    "spectre_zombie.mcfunction",
    "unique_headless_horseman.mcfunction"
]

fixed_count = 0
for d in func_dirs:
    if not os.path.exists(d):
        continue
    for root, dirs, files in os.walk(d):
        for f in files:
            if f.endswith(".mcfunction"):
                path = os.path.join(root, f)
                with open(path, "r", encoding="utf-8", errors="ignore") as fp:
                    content = fp.read()
                
                # Replace unquoted and quoted Name:horse.jump_strength
                new_content = re.sub(r'\{Name:["\']?horse\.jump_strength["\']?\s*,\s*base:\s*([0-9.]+)\}', r'{"id":"minecraft:jump_strength","base":\1}', content)
                new_content = re.sub(r'\{Name:["\']?generic\.([a-z_]+)["\']?\s*,\s*base:\s*([0-9.]+)\}', r'{"id":"minecraft:\1","base":\2}', new_content)
                
                if new_content != content:
                    fixed_count += 1
                    with open(path, "w", encoding="utf-8") as fp:
                        fp.write(new_content)

print(f"Fixed legacy unquoted attributes in {fixed_count} function files!")
