clear @s paper[custom_data={rpg_map:"library"}] 1
playsound minecraft:item.book.page_turn master @s ~ ~ ~ 1 1
title @s actionbar {"text":"✨ 已解析失落图书馆定向藏宝图！", "color":"gold"}
loot give @s loot rpgloot:maps/library
