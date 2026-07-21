scoreboard objectives remove timer
scoreboard objectives remove timer10s
scoreboard objectives remove timer10sdays
scoreboard objectives remove atk_cool
scoreboard objectives remove stats
scoreboard objectives remove guide

scoreboard objectives remove admingencount

#stats Scorboards
scoreboard objectives remove Armor
scoreboard objectives remove Armor_Toughness
scoreboard objectives remove Attack_Damage
scoreboard objectives remove Attack_Knockback
scoreboard objectives remove Attack_Speed
scoreboard objectives remove DPS
scoreboard objectives remove Health
scoreboard objectives remove Movement_Speed
scoreboard objectives remove Knockback_resistance
scoreboard objectives remove Luck
scoreboard objectives remove multiply

#Scheduling
schedule clear rpgloot:5tics
schedule clear rpgloot:1second
schedule clear rpgloot:5seconds
schedule clear rpgloot:10seconds

#Pillager 
scoreboard objectives remove pilset1exists
scoreboard objectives remove pilset1size
scoreboard objectives remove pilset1built

# Variable storing
scoreboard objectives remove constants
scoreboard objectives remove count
scoreboard objectives remove timeofday
scoreboard objectives remove currentevent

scoreboard objectives remove rpgloot.rng
scoreboard objectives remove boss_chance
scoreboard objectives remove rpgloot.boss_var

scoreboard objectives remove mobset
scoreboard objectives remove broot
scoreboard objectives remove structuregeneration
scoreboard objectives remove pilset
scoreboard objectives remove glowset
scoreboard objectives remove eventset
scoreboard objectives remove eventchance
scoreboard objectives remove bosslimitset
scoreboard objectives remove bosscount

#Life Steal (Credit to MC_Ninja38 for this method)
scoreboard objectives remove dealt

scoreboard objectives remove lyupic
scoreboard objectives remove assassinpic

#Motion (boneblast)
scoreboard objectives remove FB_x1
scoreboard objectives remove FB_y1
scoreboard objectives remove FB_z1

scoreboard objectives remove FB_x2
scoreboard objectives remove FB_y2
scoreboard objectives remove FB_z2

tellraw @a [{"text":"michael9r9r's RPG Loot, Mobs & Dungeons uninstalled!","color":"red"}]