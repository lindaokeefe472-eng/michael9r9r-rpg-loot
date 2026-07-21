##Called from determine_boss
#run every 5 seconds if boss mob spawning enabled

#Proceed if not too many bosses already
#say boss_count_check

execute store result score rpgloot bosscount if entity @e[tag=rpgloot.boss]
execute if score rpgloot bosscount < rpgloot bosslimitset run function rpgloot:make_boss

