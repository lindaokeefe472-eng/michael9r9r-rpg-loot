##Called from tick
#Wither 2 for 7 seconds for elite

execute at @e[tag=elite.ghastball] at @p[distance=0..4] run summon area_effect_cloud ~ ~1 ~ {Particle:smoke,Radius:1f,RadiusPerTick:-0.05f,Duration:20,Effects:[{name:"minecraft:slowness",amplifier:0,duration:20,show_particles:0b},{name:"minecraft:wither",amplifier:1,duration:140}]}
data merge entity @s {ExplosionPower:2}