# Automatic Self-Test Suite for Headless MC Server E2E
time set night
function rpgloot:options
function rpgloot:debug
function rpgloot:locate/menu
function rpgloot:events/determine_event

# Test Locate Subfunctions
execute at @s run function rpgloot:locate/alpha_castle
execute at @s run function rpgloot:locate/arid_tomb
execute at @s run function rpgloot:locate/brimstone_bastion
execute at @s run function rpgloot:locate/buried_fortress
execute at @s run function rpgloot:locate/capped_tower

# Test Summoning & Drops
execute at @s run function rpgloot:summon/veteran_zombie
execute in minecraft:overworld as @e[type=zombie,limit=1] run data get entity @s CustomName
execute in minecraft:overworld run loot spawn ~ ~ ~ kill @e[type=zombie,limit=1]
