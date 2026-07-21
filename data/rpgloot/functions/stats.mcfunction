#Attribute data for players

execute as @a store result score @s Armor run attribute @s armor get 100

execute as @a store result score @s Armor_Toughness run attribute @s armor_toughness get 100

execute as @a store result score @s Attack_Damage run attribute @s attack_damage get 100

execute as @a store result score @s Attack_Knockback run attribute @s attack_knockback get 100

execute as @a store result score @s Attack_Speed run attribute @s attack_speed get 100

execute as @a store result score @s Health run attribute @s max_health get 100

execute as @a store result score @s Movement_Speed run attribute @s movement_speed get 4300

execute as @a store result score @s Knockback_resistance run attribute @s knockback_resistance get 100

execute as @a store result score @s Luck run attribute @s luck get 100

execute as @a store result score @s DPS run scoreboard players operation @s Attack_Damage *= @s Attack_Speed

execute as @a run scoreboard players operation @s DPS /= 100 multiply

execute as @a run scoreboard players operation @s Attack_Damage /= @s Attack_Speed

#tellraw

execute as @p run tellraw @s [{"selector":"@s","color":"blue","bold":true},{"translate":"rpgloot.msg.stats_suffix","color":"blue","bold":true}]

execute as @p run tellraw @s [{"translate":"rpgloot.msg.stat.armor","color":"blue"},{"score":{"name":"@s","objective":"Armor"}}]

execute as @p run tellraw @s [{"translate":"rpgloot.msg.stat.armor_toughness","color":"blue"},{"score":{"name":"@s","objective":"Armor_Toughness"}}]

execute as @p run tellraw @s [{"translate":"rpgloot.msg.stat.attack_damage","color":"blue"},{"score":{"name":"@s","objective":"Attack_Damage"}}]

execute as @p run tellraw @s [{"translate":"rpgloot.msg.stat.attack_knockback","color":"blue"},{"score":{"name":"@s","objective":"Attack_Knockback"}}]

execute as @p run tellraw @s [{"translate":"rpgloot.msg.stat.attack_speed","color":"blue"},{"score":{"name":"@s","objective":"Attack_Speed"}}]

execute as @p run tellraw @s [{"translate":"rpgloot.msg.stat.dps","color":"blue"},{"score":{"name":"@s","objective":"DPS"}}]

execute as @p run tellraw @s [{"translate":"rpgloot.msg.stat.health","color":"blue"},{"score":{"name":"@s","objective":"Health"}}]

execute as @p run tellraw @s [{"translate":"rpgloot.msg.stat.movement_speed","color":"blue"},{"score":{"name":"@s","objective":"Movement_Speed"}}]

execute as @p run tellraw @s [{"translate":"rpgloot.msg.stat.knockback_resist","color":"blue"},{"score":{"name":"@s","objective":"Knockback_resistance"}}]

execute as @p run tellraw @s [{"translate":"rpgloot.msg.stat.luck","color":"blue"},{"score":{"name":"@s","objective":"Luck"}}]
