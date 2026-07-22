tellraw @a {"text":"What a price to pay, for a soul to slay.","color":"gold"}
execute as @e[type=minecraft:item,nbt={item:{id:"minecraft:ancient_debris",components:{"minecraft:custom_name":'{"text":"Sacrifice"}'}}}] run function rpgloot:summon/summon_unique_sacrifice
summon minecraft:lightning_bolt ~ ~ ~
kill @e[type=minecraft:item,nbt={item:{id:"minecraft:ancient_debris",components:{"minecraft:custom_name":'{"text":"Sacrifice"}'}}}] 