clear @s paper[custom_data={rpg_map:"dungeon_t3"}] 1
playsound minecraft:item.book.page_turn master @s ~ ~ ~ 1 1
title @s actionbar {"text":"✨ 已解析终极秘境藏宝图！", "color":"gold"}
execute store result score rpgloot rpgloot.rng run random value 1..100
execute if score rpgloot rpgloot.rng matches 1..33 run loot give @s loot rpgloot:maps/buried_fortress
execute if score rpgloot rpgloot.rng matches 34..66 run loot give @s loot rpgloot:maps/brimstone_bastion
execute if score rpgloot rpgloot.rng matches 67..100 run loot give @s loot rpgloot:maps/divine_sanctum
