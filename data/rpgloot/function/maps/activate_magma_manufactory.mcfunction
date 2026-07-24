clear @s paper[custom_data={rpg_map:"magma_manufactory"}] 1
playsound minecraft:item.book.page_turn master @s ~ ~ ~ 1 1
title @s actionbar {"text":"✨ 已解析熔岩工坊定向藏宝图！", "color":"gold"}
loot give @s loot rpgloot:maps/magma_manufactory
