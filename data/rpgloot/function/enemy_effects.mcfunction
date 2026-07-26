##Called from 5tics
#run every 5 ticks the tagged enemy is present
# NOTE: applies effects directly instead of legacy area_effect_cloud NBT
#       (AEC Particle/Potion/Effects fields were removed in MC 1.20.5+ and silently did nothing)

execute at @e[tag=wraith] as @a[distance=..25] run effect give @s slowness 1 0 true
execute at @e[tag=wraith] as @a[distance=..25] run effect give @s wither 5 1 true
execute at @e[tag=wraith] as @a[distance=..25] at @s run particle minecraft:smoke ~ ~1 ~ 0.4 0.6 0.4 0.02 6

execute at @e[tag=rpgloot.spider] as @a[distance=..3] run effect give @s poison 5 0 true
execute at @e[tag=rpgloot.plagueswarm] as @a[distance=..3] run effect give @s slowness 5 0 true

execute at @e[tag=rpgloot.flare] as @a[distance=..2] run damage @s 2 minecraft:on_fire
execute as @e[tag=rpgloot.spore] at @s run effect give @a[distance=..16] blindness 5 0 true
