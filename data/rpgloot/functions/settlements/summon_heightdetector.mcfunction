function rpgloot:rng/1-100

execute if score @s rpgloot.rng matches 1..25 as @s run summon armor_stand ~50 200 ~ {Tags:["rpgloot.heightdetector"]}
execute if score @s rpgloot.rng matches 26..50 as @s run summon armor_stand ~ 200 ~50 {Tags:["rpgloot.heightdetector"]}
execute if score @s rpgloot.rng matches 51..75 as @s run summon armor_stand ~50 200 ~50 {Tags:["rpgloot.heightdetector"]}
execute if score @s rpgloot.rng matches 76..100 as @s run summon armor_stand ~-50 200 ~-50 {Tags:["rpgloot.heightdetector"]}
