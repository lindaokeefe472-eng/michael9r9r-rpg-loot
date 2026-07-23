function rpgloot:rng/1-100

scoreboard players set currenteventp currentevent 0
execute if score rpgloot rpgloot.rng matches 1..25 run scoreboard players set currenteventp currentevent 1
execute if score rpgloot rpgloot.rng matches 26..50 run scoreboard players set currenteventp currentevent 2
execute if score rpgloot rpgloot.rng matches 51..75 run scoreboard players set currenteventp currentevent 3
execute if score rpgloot rpgloot.rng matches 76..100 run scoreboard players set currenteventp currentevent 4

execute if score currenteventp currentevent matches 1 run tellraw @a [{"translate":"rpgloot.event.prefix","fallback":"[World Event] ","color":"gold","bold":true},{"translate":"rpgloot.event.bad_night","fallback":"This is going to be a bad night... A powerful Boss has descended!","color":"red"}]
execute if score currenteventp currentevent matches 2 run tellraw @a [{"translate":"rpgloot.event.prefix","fallback":"[World Event] ","color":"gold","bold":true},{"translate":"rpgloot.event.blood_moon","fallback":"Blood Moon rises... The dead hunger...","color":"dark_red","bold":true}]
execute if score currenteventp currentevent matches 3 run tellraw @a [{"translate":"rpgloot.event.prefix","fallback":"[World Event] ","color":"gold","bold":true},{"translate":"rpgloot.event.creepers","fallback":"You hear hissing in the distance... Creepers are approaching!","color":"green"}]
execute if score currenteventp currentevent matches 4 run tellraw @a [{"translate":"rpgloot.event.prefix","fallback":"[World Event] ","color":"gold","bold":true},{"translate":"rpgloot.event.spiders","fallback":"The creepy crawlies have come out to play...","color":"dark_purple"}]

execute if score currenteventp currentevent matches 1 run function rpgloot:events/event_boss
execute if score currenteventp currentevent matches 2 run function rpgloot:events/event_undead
execute if score currenteventp currentevent matches 3 run function rpgloot:events/event_creepers
execute if score currenteventp currentevent matches 4 run function rpgloot:events/event_spiders
