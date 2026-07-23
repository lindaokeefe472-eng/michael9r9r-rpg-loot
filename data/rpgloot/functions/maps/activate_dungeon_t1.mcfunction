clear @s paper[custom_data={rpg_map:"dungeon_t1"}] 1
playsound minecraft:item.book.page_turn master @s ~ ~ ~ 1 1
title @s actionbar {"text":"✨ 已解析地下城藏宝图！", "color":"gold"}
execute store result score rpgloot rpgloot.rng run random value 1..100
execute if score rpgloot rpgloot.rng matches 1..15 run loot give @s loot rpgloot:maps/overgrown_armory
execute if score rpgloot rpgloot.rng matches 16..30 run loot give @s loot rpgloot:maps/library
execute if score rpgloot rpgloot.rng matches 31..40 run loot give @s loot rpgloot:maps/sunken_ruins
execute if score rpgloot rpgloot.rng matches 41..55 run loot give @s loot rpgloot:maps/jeweled_caverns
execute if score rpgloot rpgloot.rng matches 56..70 run loot give @s loot rpgloot:maps/magma_manufactory
execute if score rpgloot rpgloot.rng matches 71..85 run loot give @s loot rpgloot:maps/catacombs
execute if score rpgloot rpgloot.rng matches 86..100 run loot give @s loot rpgloot:maps/arid_tomb
