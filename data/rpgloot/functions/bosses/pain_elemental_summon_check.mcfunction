execute store result score rpgloot lostsoulcount if entity @e[tag=rpgloot.lostsoul]
execute if score rpgloot lostsoulcount < rpgloot10 constants run function rpgloot:bosses/pain_elemental_summons

#This prevents more than 10 lost souls from spawning. Would have made it 21 like classic Doom 2 but 21 of these [censored] is a pain to fight and laggy