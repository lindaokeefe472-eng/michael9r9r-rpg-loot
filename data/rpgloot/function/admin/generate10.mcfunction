tellraw @s {"text":"Generating 10 structures 500-1000 blocks away from your position... Please wait.","color":"green"}
#gamemode @s creative

#Run through this routine 10 times. 

#1
function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..25 run function rpgloot:admin/generate_commands/t1-1
execute if score rpgloot rpgloot.rng matches 26..50 run function rpgloot:admin/generate_commands/t1-2
execute if score rpgloot rpgloot.rng matches 51..75 run function rpgloot:admin/generate_commands/t1-3
execute if score rpgloot rpgloot.rng matches 76..100 run function rpgloot:admin/generate_commands/t1-4


#2
function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..25 run function rpgloot:admin/generate_commands/t1-1
execute if score rpgloot rpgloot.rng matches 26..50 run function rpgloot:admin/generate_commands/t1-2
execute if score rpgloot rpgloot.rng matches 51..75 run function rpgloot:admin/generate_commands/t1-3
execute if score rpgloot rpgloot.rng matches 76..100 run function rpgloot:admin/generate_commands/t1-4

