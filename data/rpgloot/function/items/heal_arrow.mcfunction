##Called from tick
#run every time the Long Bow of the Cleric is used

data merge entity @s {life:1200,pickup:0}
summon area_effect_cloud ~ ~ ~ {Particle:spell,ReapplicationDelay:20,Radius:1f,Duration:2,Potion:"minecraft:regeneration"}
execute at @p[distance=0..5] run summon area_effect_cloud ~ ~ ~ {Particle:spell,Radius:2f,Duration:20,Effects:[{Id:10,Amplifier:1,Duration:100}]}