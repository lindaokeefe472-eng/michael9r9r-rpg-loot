execute if score brutal_nights broot > rpgloot0 constants run function rpgloot:brutal_night_timecheck
scoreboard players add rpgloot timer10sdays 1

execute if score rpgloot timer10sdays matches 60 if score pillager_settlements pilset matches 1.. run function rpgloot:settlements/settlement_check
execute if score rpgloot timer10sdays matches 60 run scoreboard players set rpgloot timer10sdays 0

# If the glowing mobs setting is enabled, make them glow.
execute if score rpgloot glowset matches 1.. run effect give @e[tag=rpgloot.boss] glowing 6

# World Event wave dispatch (currentevent set by events/determine_event)
execute if score currenteventp currentevent matches 1 run function rpgloot:events/event_boss
execute if score currenteventp currentevent matches 2 run function rpgloot:events/event_undead
execute if score currenteventp currentevent matches 3 run function rpgloot:events/event_creepers
execute if score currenteventp currentevent matches 4 run function rpgloot:events/event_spiders

# 26.2: "time query time" returns the absolute overworld clock; modulo 24000 -> time of day
execute store result score rpgloot timeofday run time query time
scoreboard players operation rpgloot timeofday %= rpgloot24000 constants

# This starts the boss spawning process
function rpgloot:check_boss_setting

schedule function rpgloot:5seconds 5s replace



