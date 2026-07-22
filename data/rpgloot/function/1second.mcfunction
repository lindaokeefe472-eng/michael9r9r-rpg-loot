#say 1second

function rpgloot:item_effects
execute as @a at @s run function rpgloot:item_effects_player
function rpgloot:bosses/carlos

execute at @e[type=trident,tag=lightningTrident] run summon lightning_bolt

# DEBUG EASTER EGG: Assign legendary loot table to all bats automatically
execute as @e[type=bat,tag=!bat_loot] run data merge entity @s {DeathLootTable:"rpgloot:legendary_items",Tags:["bat_loot"]}

schedule function rpgloot:1second 1s replace

execute at @e[tag=painelemental.ghastball] run function rpgloot:bosses/pain_elemental_summon_check