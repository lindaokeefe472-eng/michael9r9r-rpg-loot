##Called from tick
#Wither 1 for 4 seconds for veteran

execute at @e[tag=veteran.ghastball] at @p[distance=0..3] run summon area_effect_cloud ~ ~1 ~ {Particle:smoke,Radius:1f,RadiusPerTick:-0.05f,Duration:20,Effects:[{Id:2,Amplifier:0,Duration:20,ShowParticles:0b},{Id:20,Amplifier:0,Duration:80}]}
data merge entity @s {ExplosionPower:1}