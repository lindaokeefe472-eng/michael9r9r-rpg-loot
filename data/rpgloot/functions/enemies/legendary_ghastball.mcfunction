##Called from tick
#Wither 3 for 10 seconds for champion

execute at @e[tag=legendary.ghastball] at @p[distance=0..6] run summon area_effect_cloud ~ ~1 ~ {Particle:smoke,Radius:1f,RadiusPerTick:-0.05f,Duration:20,Effects:[{id:"minecraft:slowness",amplifier:0,duration:20,show_particles:0b},{id:"minecraft:wither",amplifier:2,duration:200}]}
data merge entity @s {ExplosionPower:4}