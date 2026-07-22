##Called from tick

execute at @e[tag=painelemental.ghastball] at @p[distance=0..6] run summon area_effect_cloud ~ ~1 ~ {Particle:smoke,Radius:1f,RadiusPerTick:-0.05f,Duration:20,Effects:[{id:"minecraft:slowness",amplifier:0,duration:20,show_particles:0b},{id:"minecraft:wither",amplifier:1,duration:200}]}
data merge entity @s {ExplosionPower:5}