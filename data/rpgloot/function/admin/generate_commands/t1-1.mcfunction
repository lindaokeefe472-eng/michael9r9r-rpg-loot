

#structure 1
tp @s ~500 ~ ~400
function rpgloot:admin/tier1
tp @s ~-500 ~ ~-400 
tellraw @s {"text":"Done","color":"blue"}
scoreboard players add rpgloot admingencount 1
