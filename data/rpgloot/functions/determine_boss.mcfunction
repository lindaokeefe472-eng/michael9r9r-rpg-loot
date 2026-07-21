##Called from check_boss_setting
#run every 5 seconds if boss mobs spawning enabled

function rpgloot:rng/1-100
#say determine_boss

# Proceed if rng condition is met
execute if score rpgloot rpgloot.rng <= rpgloot boss_chance run function rpgloot:boss_count_check
