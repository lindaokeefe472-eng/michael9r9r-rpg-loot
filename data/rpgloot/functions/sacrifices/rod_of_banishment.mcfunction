teleport @e[tag=rpgloot.raidboss] ~0 -100000 ~0
effect give @e[tag=rpgloot.raidboss] instant_damage 999 255
tellraw @a {"text":"A powerful evil has been banished... but for how long?","color":"green"}
summon minecraft:lightning_bolt ~ ~ ~
