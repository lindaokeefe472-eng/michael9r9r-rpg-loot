import os

base_dirs = [
    r"D:/game/mc/michael9r9r-s-rpg-loot-v1-15/data/rpgloot/functions/structures",
    r"D:/game/mc/michael9r9r-s-rpg-loot-v1-15/data/rpgloot/function/structures"
]

missing_structs = {
    "alpha_castle": "place structure rpgloot:alpha_castle ~ ~ ~",
    "arid_tomb": "place structure rpgloot:arid_tomb ~ ~ ~",
    "capped_tower": "place structure rpgloot:capped_tower ~ ~ ~",
    "collapsed_ruins": "place structure rpgloot:collapsed_ruins ~ ~ ~",
    "graveyard": "place structure rpgloot:graveyard ~ ~ ~"
}

for base_dir in base_dirs:
    if os.path.exists(base_dir):
        for name, cmd in missing_structs.items():
            file_path = os.path.join(base_dir, f"{name}.mcfunction")
            with open(file_path, "w", encoding="utf-8") as f:
                f.write(f"# Place {name}\n{cmd}\n")

print("Created missing structure place functions!")
