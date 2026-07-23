clear @s paper[custom_data={rpg_map:"sunken_ruins"}] 1
playsound minecraft:item.book.page_turn master @s ~ ~ ~ 1 1
title @s actionbar {"text":"✨ 已解析沉没废墟定向藏宝图！", "color":"gold"}
loot give @s loot rpgloot:maps/sunken_ruins
