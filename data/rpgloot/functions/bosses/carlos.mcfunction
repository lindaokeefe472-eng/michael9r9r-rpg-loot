execute at @e[type=trident,tag=lightningTrident] run summon lightning_bolt

execute if entity @e[tag=carlos] run function rpgloot:rng/1-100
execute as @e[tag=carlos] at @s run function rpgloot:bosses/carlosfire