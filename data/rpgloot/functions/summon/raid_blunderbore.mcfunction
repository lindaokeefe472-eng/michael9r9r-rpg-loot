tellraw @a {"text":"Fee-fi-fo-fum! I smell the blood of an Englishman. Be he alive, or be he dead, I'll grind his bones to make my bread.","color":"dark_red"}
#fill ~ ~ ~10 ~ ~75 ~10 jungle_log destroy
setblock ~1 ~76 ~11 chest{LootTable:"rpgloot:chests/enchanted_egg_loot"} replace
fill ~-1 ~ ~9 ~1 ~75 ~11 vine[east=true,north=true,south=true,west=true] destroy

bossbar add blunderbore {"text":"Blunderbore, Giant of the Stalk","color":"green"}
bossbar set blunderbore color green
bossbar set blunderbore max 900


summon giant ~10 ~25 ~ {CustomNameVisible:1b,DeathLootTable:"rpgloot:blunderbore_loot",PersistenceRequired:1b,NoAI:0b,Health:900f,Tags:["rpgloot.raidboss","rpgloot.boss","blunderbore"],Passengers:[{id:"minecraft:zombie",Silent:1b,Health:4f,ArmorItems:[{},{},{},{id:'minecraft:leather_helmet',Count:1b}],ArmorDropChances:[0.085F,0.085F,0.085F,0.085F],ActiveEffects:[{Id:2b,Amplifier:3b,Duration:199980,ShowParticles:0b},{Id:14b,Amplifier:1b,Duration:199980,ShowParticles:0b}],Attributes:[{Name:generic.follow_range,Base:94},{Name:generic.movement_speed,Base:.25}]}],CustomName:'{"text":"Blunderbore","color":"green"}',HandItems:[{id:"minecraft:iron_shovel",Count:1b,tag:{Unbreakable:1b,Damage:18}},{id:"minecraft:egg",Count:1b}],HandDropChances:[0.000F,0.000F],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:5388344}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3866624}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:14592060},Unbreakable:1b}},{}],ArmorDropChances:[0.000F,0.000F,0.000F,0.085F],ActiveEffects:[{Id:2b,Amplifier:3b,Duration:199980,ShowParticles:0b},{Id:10b,Amplifier:1b,Duration:199980,ShowParticles:0b},{Id:12b,Amplifier:1b,Duration:199980,ShowParticles:0b},{Id:28b,Amplifier:1b,Duration:2400,ShowParticles:0b}],Attributes:[{Name:generic.max_health,Base:900},{Name:generic.follow_range,Base:94},{Name:generic.knockback_resistance,Base:0.6},{Name:generic.movement_speed,Base:.25},{Name:generic.attack_damage,Base:18},{Name:generic.armor,Base:10}]}

scoreboard players add @e[tag=blunderbore,type=giant] atk_cool 0