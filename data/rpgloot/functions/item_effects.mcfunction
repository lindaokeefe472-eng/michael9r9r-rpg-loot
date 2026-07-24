##Called from 1second
#run every second

execute as @e[type=minecraft:item,nbt={item:{id:"minecraft:slime_block",components:{"minecraft:custom_name":'{"text":"Friend Cube"}'}}}] at @s run function rpgloot:sacrifices/friend_cube
execute as @e[type=minecraft:item,nbt={item:{id:"minecraft:diamond_block",components:{"minecraft:custom_name":'{"text":"Offering"}'}}}] at @s run function rpgloot:sacrifices/offering
execute as @e[type=minecraft:item,nbt={item:{id:"minecraft:gold_block",components:{"minecraft:custom_name":'{"text":"Phat Loot"}'}}}] at @s run function rpgloot:sacrifices/phat_loot
execute as @e[type=minecraft:item,nbt={item:{id:"minecraft:raw_iron_block",components:{"minecraft:custom_name":'{"text":"Magic Beans"}'}}}] at @s run function rpgloot:sacrifices/magic_beans
execute as @e[type=minecraft:item,nbt={item:{id:"minecraft:crying_obsidian",components:{"minecraft:custom_name":'{"text":"Sacrifice"}'}}}] at @s run function rpgloot:sacrifices/veteran_sacrifice
execute as @e[type=minecraft:item,nbt={item:{id:"minecraft:ancient_debris",components:{"minecraft:custom_name":'{"text":"Sacrifice"}'}}}] at @s run function rpgloot:sacrifices/unique_sacrifice
execute as @e[type=minecraft:item,nbt={item:{id:"minecraft:diamond_pickaxe",components:{"minecraft:custom_name":'{"text":"Ancient Excavator"}'}}}] at @s run function rpgloot:sacrifices/ancient_excavator
execute as @e[type=minecraft:item,nbt={item:{id:"minecraft:netherite_pickaxe",components:{"minecraft:custom_name":'{"text":"Ancient Excavator"}'}}}] at @s run function rpgloot:sacrifices/ancient_excavator_netherite
execute as @e[type=minecraft:item,nbt={item:{id:"minecraft:blaze_rod",components:{"minecraft:custom_name":'{"text":"Rod of Banishment"}'}}}] at @s run function rpgloot:sacrifices/rod_of_banishment
execute as @e[type=minecraft:item,nbt={item:{id:"minecraft:egg",components:{"minecraft:custom_data":{enchanted_egg:1b}}}}] at @s run function rpgloot:summon/enchanted_chicken
execute as @e[type=minecraft:item,nbt={item:{id:"minecraft:coal_block",components:{"minecraft:custom_name":'{"text":"Infernal Fuel"}'}}}] at @s run function rpgloot:sacrifices/infernal_fuel



# Explorer Map Scroll Activations
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{rpg_map:"dungeon_t1"}}}]}] at @s run function rpgloot:maps/activate_dungeon_t1
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{rpg_map:"dungeon_t3"}}}]}] at @s run function rpgloot:maps/activate_dungeon_t3
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{rpg_map:"ruins"}}}]}] at @s run function rpgloot:maps/activate_ruins
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{rpg_map:"library"}}}]}] at @s run function rpgloot:maps/activate_library
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{rpg_map:"sunken_ruins"}}}]}] at @s run function rpgloot:maps/activate_sunken_ruins
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{rpg_map:"magma_manufactory"}}}]}] at @s run function rpgloot:maps/activate_magma_manufactory
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{rpg_map:"catacombs"}}}]}] at @s run function rpgloot:maps/activate_catacombs
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{rpg_map:"buried_fortress"}}}]}] at @s run function rpgloot:maps/activate_buried_fortress

execute as @e[type=minecraft:item,nbt={item:{components:{"minecraft:custom_data":{rpg_map:"dungeon_t1"}}}}] at @s run function rpgloot:maps/activate_dungeon_t1_dropped
execute as @e[type=minecraft:item,nbt={item:{components:{"minecraft:custom_data":{rpg_map:"dungeon_t3"}}}}] at @s run function rpgloot:maps/activate_dungeon_t3_dropped
execute as @e[type=minecraft:item,nbt={item:{components:{"minecraft:custom_data":{rpg_map:"ruins"}}}}] at @s run function rpgloot:maps/activate_ruins_dropped
execute as @e[type=minecraft:item,nbt={item:{components:{"minecraft:custom_data":{rpg_map:"library"}}}}] at @s run function rpgloot:maps/activate_library_dropped
execute as @e[type=minecraft:item,nbt={item:{components:{"minecraft:custom_data":{rpg_map:"sunken_ruins"}}}}] at @s run function rpgloot:maps/activate_sunken_ruins_dropped
execute as @e[type=minecraft:item,nbt={item:{components:{"minecraft:custom_data":{rpg_map:"magma_manufactory"}}}}] at @s run function rpgloot:maps/activate_magma_manufactory_dropped
execute as @e[type=minecraft:item,nbt={item:{components:{"minecraft:custom_data":{rpg_map:"catacombs"}}}}] at @s run function rpgloot:maps/activate_catacombs_dropped
execute as @e[type=minecraft:item,nbt={item:{components:{"minecraft:custom_data":{rpg_map:"buried_fortress"}}}}] at @s run function rpgloot:maps/activate_buried_fortress_dropped

# Tick Set Bonuses & Loot Beams
function rpgloot:set_bonuses
function rpgloot:loot_beams

# Reforge Rune Ritual (Item dropped near an Anvil or on ground)
execute as @e[type=minecraft:item,nbt={item:{components:{"minecraft:custom_data":{reforge_rune:1b}}}}] at @s run function rpgloot:reforge
