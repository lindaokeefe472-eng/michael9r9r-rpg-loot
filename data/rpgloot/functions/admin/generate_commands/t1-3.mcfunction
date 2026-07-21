

#structure 1
tp @s ~800 ~ ~500
function rpgloot:admin/tier1
tp @s ~-800 ~ ~-500 
tellraw @s {"text":"Tier 1 Generated","color":"green"}
scoreboard players add rpgloot admingencount 1
