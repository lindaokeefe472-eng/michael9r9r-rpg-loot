##Called from tick
#Wither 2 for 10 seconds for champion

execute at @e[tag=champion.ghastball] at @p[distance=0..5] run summon area_effect_cloud ~ ~1 ~ {Particle:smoke,Radius:1f,RadiusPerTick:-0.05f,Duration:20,Effects:[{Id:2,Amplifier:0,Duration:20,ShowParticles:0b},{Id:20,Amplifier:1,Duration:200}]}
data merge entity @s {ExplosionPower:3}