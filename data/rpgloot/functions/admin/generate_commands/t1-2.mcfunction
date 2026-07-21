

#structure 1
tp @s ~600 ~ ~600
function rpgloot:admin/tier1
tp @s ~-600 ~ ~-600 
tellraw @s {"text":"Tier 1 Generated","color":"green"}
scoreboard players add rpgloot admingencount 1
