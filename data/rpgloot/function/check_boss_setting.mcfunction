##Called from 5second
#run every 5 seconds

# This function is called every time 5 seconds pass while the Spawn Mobs setting is on.


#say check_boss_setting

# Proceed if boss spawning is enabled
execute if score mob_setting mobset > rpgloot0 constants run function rpgloot:determine_boss

