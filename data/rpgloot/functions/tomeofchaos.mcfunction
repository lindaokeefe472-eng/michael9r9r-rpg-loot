function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..9 run effect give @s regeneration 11 0 true
execute if score rpgloot rpgloot.rng matches 10..18 run effect give @s resistance 11 0 true
execute if score rpgloot rpgloot.rng matches 19..27 run effect give @s fire_resistance 11 0 true
execute if score rpgloot rpgloot.rng matches 28..36 run effect give @s haste 11 0 true
execute if score rpgloot rpgloot.rng matches 37..45 run effect give @s strength 11 0 true
execute if score rpgloot rpgloot.rng matches 46..54 run effect give @s speed 11 0 true
execute if score rpgloot rpgloot.rng matches 55..63 run effect give @s jump_boost 11 0 true
execute if score rpgloot rpgloot.rng matches 64..72 run effect give @s absorption 11 0 true
execute if score rpgloot rpgloot.rng matches 73..81 run effect give @s water_breathing 11 0 true
execute if score rpgloot rpgloot.rng matches 82..90 run effect give @s dolphins_grace 11 0 true
execute if score rpgloot rpgloot.rng matches 91..100 run effect give @s slow_falling 11 0 true