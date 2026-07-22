# Try to transform individual mob immediately on spawn
tag @s add rpgloot.valid_mob

# Check if mob spawning is enabled and under boss limit
execute if score mob_setting mobset matches 1.. run function rpgloot:rng/1-100
execute if score mob_setting mobset matches 1.. if score rpgloot rpgloot.rng <= rpgloot boss_chance run function rpgloot:make_boss_this_mob
