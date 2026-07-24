clear @s paper[custom_data={rpg_map:"ruins"}] 1
playsound minecraft:item.book.page_turn master @s ~ ~ ~ 1 1
title @s actionbar {"text":"✨ 已解析地表遗迹藏宝图！", "color":"gold"}
execute store result score rpgloot rpgloot.rng run random value 1..100
execute if score rpgloot rpgloot.rng matches 1..25 run loot give @s loot rpgloot:maps/alpha_castle
execute if score rpgloot rpgloot.rng matches 26..50 run loot give @s loot rpgloot:maps/graveyard
execute if score rpgloot rpgloot.rng matches 51..75 run loot give @s loot rpgloot:maps/capped_tower
execute if score rpgloot rpgloot.rng matches 76..100 run loot give @s loot rpgloot:maps/collapsed_ruins
