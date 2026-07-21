##Called from tick

execute at @e[tag=painelemental.ghastball] at @p[distance=0..6] run summon area_effect_cloud ~ ~1 ~ {Particle:smoke,Radius:1f,RadiusPerTick:-0.05f,Duration:20,Effects:[{Id:2,Amplifier:0,Duration:20,ShowParticles:0b},{Id:20,Amplifier:1,Duration:200}]}
data merge entity @s {ExplosionPower:5}