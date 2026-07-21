tellraw @a {"text":"You hear the sounds of marching and clanking armor draw closer...","color":"dark_red"}
weather thunder

bossbar add vassal {"text":"Poseidon's Vassal","color":"white"}
bossbar set vassal color blue
bossbar set vassal max 150

execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:gold_block",tag:{display:{Name:"{\"text\":\"Phat Loot\"}"}}}}] positioned ~5 ~100 ~-5 run function rpgloot:summon/raid_poseidon_vassal
execute at @e[tag=vassal] positioned ~20 ~ ~ run function rpgloot:summon/raid_poseidon_knight
execute at @e[tag=vassal] positioned ~ ~ ~20 run function rpgloot:summon/raid_poseidon_knight
execute at @e[tag=vassal] positioned ~20 ~ ~20 run function rpgloot:summon/raid_poseidon_knight
execute at @e[tag=vassal] positioned ~-20 ~ ~ run function rpgloot:summon/raid_poseidon_knight
execute at @e[tag=vassal] positioned ~ ~ ~-20 run function rpgloot:summon/raid_poseidon_knight
execute at @e[tag=vassal] positioned ~-20 ~ ~-20 run function rpgloot:summon/raid_poseidon_knight
execute at @e[tag=vassal] positioned ~20 ~ ~-20 run function rpgloot:summon/raid_poseidon_knight
execute at @e[tag=vassal] positioned ~-20 ~ ~20 run function rpgloot:summon/raid_poseidon_knight