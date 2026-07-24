import os, re

base_dir = r"D:/game/mc/michael9r9r-s-rpg-loot-v1-15/data/rpgloot"
func_dirs = [os.path.join(base_dir, "functions"), os.path.join(base_dir, "function")]

attr_map = {
    'Name:"generic.max_health"': 'id:"minecraft:max_health"',
    'Name:"generic.movement_speed"': 'id:"minecraft:movement_speed"',
    'Name:"generic.follow_range"': 'id:"minecraft:follow_range"',
    'Name:"generic.knockback_resistance"': 'id:"minecraft:knockback_resistance"',
    'Name:"generic.attack_knockback"': 'id:"minecraft:attack_knockback"',
    'Name:"generic.attack_damage"': 'id:"minecraft:attack_damage"',
    'Name:"generic.armor"': 'id:"minecraft:armor"',
    'Name:"generic.armor_toughness"': 'id:"minecraft:armor_toughness"',
    'Name:"horse.jump_strength"': 'id:"minecraft:jump_strength"',
    'Name:"zombie.spawn_reinforcements"': 'id:"minecraft:spawn_reinforcements"',
    'Base:': 'base:'
}

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
                
                new_content = content
                for old_key, new_key in attr_map.items():
                    new_content = new_content.replace(old_key, new_key)
                
                if new_content != content:
                    fixed_count += 1
                    with open(path, "w", encoding="utf-8") as fp:
                        fp.write(new_content)

print(f"Upgraded legacy attributes to 26.2 format in {fixed_count} function files!")
