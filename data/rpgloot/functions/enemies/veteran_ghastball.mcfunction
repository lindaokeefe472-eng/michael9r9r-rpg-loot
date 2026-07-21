##Called from tick
#Wither 1 for 4 seconds for veteran

execute at @e[tag=veteran.ghastball] at @p[distance=0..3] run summon area_effect_cloud ~ ~1 ~ {Particle:smoke,Radius:1f,RadiusPerTick:-0.05f,Duration:20,Effects:[{name:"minecraft:slowness",amplifier:0,duration:20,show_particles:0b},{name:"minecraft:wither",amplifier:0,duration:80}]}
data merge entity @s {ExplosionPower:1}