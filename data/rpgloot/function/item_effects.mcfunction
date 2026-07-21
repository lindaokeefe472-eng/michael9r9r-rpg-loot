##Called from 1second
#run every second

execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:slime_block",components:{"minecraft:custom_name":'{"text":"Friend Cube"}'}}] at @s run function rpgloot:sacrifices/friend_cube
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:diamond_block",components:{"minecraft:custom_name":'{"text":"Offering"}'}}] at @s run function rpgloot:sacrifices/offering
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:gold_block",components:{"minecraft:custom_name":'{"text":"Phat Loot"}'}}] at @s run function rpgloot:sacrifices/phat_loot
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:raw_iron_block",components:{"minecraft:custom_name":'{"text":"Magic Beans"}'}}] at @s run function rpgloot:sacrifices/magic_beans
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:crying_obsidian",components:{"minecraft:custom_name":'{"text":"Sacrifice"}'}}] at @s run function rpgloot:sacrifices/veteran_sacrifice
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:ancient_debris",components:{"minecraft:custom_name":'{"text":"Sacrifice"}'}}] at @s run function rpgloot:sacrifices/unique_sacrifice
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:diamond_pickaxe",components:{"minecraft:custom_name":'{"text":"Ancient Excavator"}'}}}] at @s run function rpgloot:sacrifices/ancient_excavator
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:netherite_pickaxe",components:{"minecraft:custom_name":'{"text":"Ancient Excavator"}'}}}] at @s run function rpgloot:sacrifices/ancient_excavator_netherite
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:blaze_rod",components:{"minecraft:custom_name":'{"text":"Rod of Banishment"}'}}] at @s run function rpgloot:sacrifices/rod_of_banishment
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:egg",components:{"minecraft:custom_data":{enchanted_egg:1b}}}}] at @s run function rpgloot:summon/enchanted_chicken
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:coal_block",components:{"minecraft:custom_name":'{"text":"Infernal Fuel"}'}}] at @s run function rpgloot:sacrifices/infernal_fuel


