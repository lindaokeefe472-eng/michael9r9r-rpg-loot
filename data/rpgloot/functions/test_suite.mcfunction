# Automatic Self-Test Suite for Headless MC Server E2E
time set night
function rpgloot:options
function rpgloot:debug
function rpgloot:locate/menu
function rpgloot:events/determine_event

# Test Locate Subfunctions
execute positioned 0 100 0 run function rpgloot:locate/alpha_castle
execute positioned 0 100 0 run function rpgloot:locate/arid_tomb
execute positioned 0 100 0 run function rpgloot:locate/brimstone_bastion
execute positioned 0 100 0 run function rpgloot:locate/buried_fortress
execute positioned 0 100 0 run function rpgloot:locate/capped_tower

# Test Summoning & Drops
execute positioned 0 100 0 run function rpgloot:summon/veteran_zombie
execute in minecraft:overworld as @e[type=zombie,limit=1] run data get entity @s CustomName
execute in minecraft:overworld positioned 0 100 0 run loot spawn ~ ~ ~ kill @e[type=zombie,limit=1]

# Test UX Guide & Map Functions
execute positioned 0 100 0 run function rpgloot:guide
execute positioned 0 100 0 run function rpgloot:show_recipes
execute positioned 0 100 0 run function rpgloot:set_bonuses
execute positioned 0 100 0 run function rpgloot:loot_beams
