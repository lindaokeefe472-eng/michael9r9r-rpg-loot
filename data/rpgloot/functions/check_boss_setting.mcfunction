##Called from 5second
#run every 5 seconds

# This function is called every time 5 seconds pass while the Spawn Mobs setting is on.
execute as @a[nbt={Inventory:[{Slot:103b,tag:{carloshelm:1}}]}] run effect give @s absorption 10 0 true

# World Event spawns
execute if score currenteventp currentevent matches 1 run function rpgloot:events/event_boss
execute if score currenteventp currentevent matches 2 run function rpgloot:events/event_undead
execute if score currenteventp currentevent matches 3 run function rpgloot:events/event_creepers
execute if score currenteventp currentevent matches 4 run function rpgloot:events/event_spiders

#say check_boss_setting

# Proceed if boss spawning is enabled
execute if score mob_setting mobset > rpgloot0 constants run function rpgloot:determine_boss

