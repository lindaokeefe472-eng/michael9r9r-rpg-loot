function rpgloot:rng/1-100

# Not a very complex way of solving the issue. Simply checks the rng value and sets the currentevent value to it.
# First line sets the value to 0 by default, before potentially replacing it.
scoreboard players set currenteventp currentevent 0
execute if score rpgloot rpgloot.rng matches 1..25 run scoreboard players set currenteventp currentevent 1
execute if score rpgloot rpgloot.rng matches 26..50 run scoreboard players set currenteventp currentevent 2
execute if score rpgloot rpgloot.rng matches 51..75 run scoreboard players set currenteventp currentevent 3
execute if score rpgloot rpgloot.rng matches 76..100 run scoreboard players set currenteventp currentevent 4

# functions are repeated so that the text only displays once. If the tellraw function was stored in the event file, it would repeat.
# tellraw @a "eventhandler"
execute if score currenteventp currentevent matches 1 run tellraw @a {"text":"This is going to be a bad night...","color":"grey"}
execute if score currenteventp currentevent matches 2 run tellraw @a {"text":"It's a blood moon out... the dead hunger...","color":"dark_red"}
execute if score currenteventp currentevent matches 3 run tellraw @a {"text":"You hear hissing in the distance...","color":"dark_green"}
execute if score currenteventp currentevent matches 4 run tellraw @a {"text":"The creepy crawlies have come out to play...","color":"red"}

# execution of the actual event functions is handled in determine_boss