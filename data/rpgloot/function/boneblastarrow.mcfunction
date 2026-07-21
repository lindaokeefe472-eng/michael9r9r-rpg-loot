#called from tick
# AS AT PLAYER

summon minecraft:wither_skull ^ ^ ^0.5 {Tags:["player"]}

playsound minecraft:entity.wither.shoot player @a ~ ~ ~ 1 1.2

kill @e[type=minecraft:arrow,tag=boneblast,sort=nearest,limit=1]