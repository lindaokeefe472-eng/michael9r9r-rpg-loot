##Called from tick
#run every time Ember is used

execute as @e[tag=emberarrow] run data merge entity @s {life:1200,pickup:0,Fire:1200}
execute at @e[tag=emberarrow] run summon area_effect_cloud ~ ~ ~ {Particle:flame,Radius:1f,Duration:1}
execute at @e[tag=emberarrow] as @e[distance=..5,type=#rpgloot:normal_hostile_mobs] run data merge entity @s {Fire:100}
