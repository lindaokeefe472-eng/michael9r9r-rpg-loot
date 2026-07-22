tellraw @a {"text":"Fee-fi-fo-fum! I smell the blood of an Englishman. Be he alive, or be he dead, I'll grind his bones to make my bread.","color":"dark_red"}
#fill ~ ~ ~10 ~ ~75 ~10 jungle_log destroy
setblock ~1 ~76 ~11 chest{LootTable:"rpgloot:chests/enchanted_egg_loot"} replace
fill ~-1 ~ ~9 ~1 ~75 ~11 vine[east=true,north=true,south=true,west=true] destroy

bossbar add blunderbore {"text":"Blunderbore, Giant of the Stalk","color":"green"}
bossbar set blunderbore color green
bossbar set blunderbore max 900


summon giant ~10 ~25 ~ {CustomNameVisible:1b,death_loot_table:"rpgloot:blunderbore_loot",PersistenceRequired:1b,NoAI:0b,Health:900f,Tags:["rpgloot.raidboss","rpgloot.boss","blunderbore"],Passengers:[{id:"minecraft:zombie",Silent:1b,Health:4f,ArmorItems:[{},{},{},{id:'minecraft:leather_helmet',Count:1b}],ArmorDropChances:[0.085F,0.085F,0.085F,0.085F],active_effects:[{id:"minecraft:slowness",amplifier:3,duration:199980,show_particles:0b},{id:"minecraft:invisibility",amplifier:1,duration:199980,show_particles:0b}],attributes:[{id:"minecraft:follow_range",base:94},{id:"minecraft:movement_speed",base:.25}]}],CustomName:'[{"text":"Blunderbore","color":"white"}]',HandItems:[{id:"minecraft:iron_shovel",Count:1b,components:{"minecraft:custom_data":{Unbreakable:1b,Damage:18}}},{id:"minecraft:egg",Count:1b}],HandDropChances:[0.000F,0.000F],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,components:{"minecraft:custom_data":{display:{color:5388344}}}},{id:"minecraft:leather_leggings",Count:1b,components:{"minecraft:custom_data":{display:{color:3866624}}}},{id:"minecraft:leather_chestplate",Count:1b,components:{"minecraft:custom_data":{display:{color:14592060},Unbreakable:1b}}},{}],ArmorDropChances:[0.000F,0.000F,0.000F,0.085F],active_effects:[{id:"minecraft:slowness",amplifier:3,duration:199980,show_particles:0b},{id:"minecraft:regeneration",amplifier:1,duration:199980,show_particles:0b},{id:"minecraft:fire_resistance",amplifier:1,duration:199980,show_particles:0b},{id:"minecraft:slow_falling",amplifier:1,duration:2400,show_particles:0b}],attributes:[{id:"minecraft:max_health",base:900},{id:"minecraft:follow_range",base:94},{id:"minecraft:knockback_resistance",base:0.6},{id:"minecraft:movement_speed",base:.25},{id:"minecraft:attack_damage",base:18},{id:"minecraft:armor",base:10}]}

scoreboard players add @e[tag=blunderbore,type=giant] atk_cool 0