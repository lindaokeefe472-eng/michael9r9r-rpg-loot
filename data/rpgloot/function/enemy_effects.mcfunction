##Called from 5tics
#run every 5 ticks the tagged enemy is present

execute at @e[tag=wraith] at @p[distance=0..25] run summon area_effect_cloud ~ ~1 ~ {Particle:smoke,Radius:1f,RadiusPerTick:-0.05f,Duration:20,Effects:[{name:"minecraft:slowness",amplifier:0,duration:20,show_particles:0b},{name:"minecraft:wither",amplifier:1,duration:100}]}
execute at @e[tag=rpgloot.spider] at @p[distance=0..3] run summon area_effect_cloud ~ ~ ~ {Particle:spell,Radius:1f,RadiusPerTick:-0.05f,Duration:20,Potion:"minecraft:poison"}
execute at @e[tag=rpgloot.plagueswarm] at @p[distance=0..3] run summon area_effect_cloud ~ ~ ~ {Particle:spell,Radius:1f,RadiusPerTick:-0.05f,Duration:20,Potion:"minecraft:slowness"}
execute at @e[tag=rpgloot.flare] at @p[distance=0..5] run data merge entity @p[distance=0..5] {Fire:20}
execute as @e[tag=rpgloot.spore] at @e[tag=rpgloot.spore] run effect give @p[distance=0..16] blindness 5

#execute at @e[tag=painelemental.ghastball] run function rpgloot:bosses/pain_elemental_summons
