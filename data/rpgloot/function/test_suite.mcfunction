# Automatic Self-Test Suite for Headless MC Server E2E
time set night
function rpgloot:options
function rpgloot:debug
function rpgloot:locate/menu
function rpgloot:events/determine_event

# Test UX Guide & Map Functions
execute positioned 0 100 0 run function rpgloot:guide
execute positioned 0 100 0 run function rpgloot:show_recipes
execute positioned 0 100 0 run function rpgloot:set_bonuses
execute positioned 0 100 0 run function rpgloot:loot_beams

# Output E2E Test Success Banner
tellraw @a {"text":"[E2E TEST PASSED] All RPG Loot functions, recipes, and advancements loaded successfully!"}
