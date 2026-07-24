effect give @s minecraft:strength 2 1 true
particle minecraft:flame ~ ~1 ~ 1 0.5 1 0.05 10
execute as @e[type=!minecraft:player,distance=..8] run data modify entity @s Fire set value 40s
