tellraw @a {"text":"What a price to pay, for a soul to slay.","color":"red"}
function rpgloot:summon/summon_veteran_sacrifice
summon minecraft:lightning_bolt ~ ~ ~
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:crying_obsidian",tag:{display:{Name:"{\"text\":\"Sacrifice\"}"}}}}] 
