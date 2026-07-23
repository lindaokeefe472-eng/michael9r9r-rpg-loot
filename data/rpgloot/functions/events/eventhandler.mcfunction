function rpgloot:rng/1-100

scoreboard players set currenteventp currentevent 0
execute if score rpgloot rpgloot.rng matches 1..25 run scoreboard players set currenteventp currentevent 1
execute if score rpgloot rpgloot.rng matches 26..50 run scoreboard players set currenteventp currentevent 2
execute if score rpgloot rpgloot.rng matches 51..75 run scoreboard players set currenteventp currentevent 3
execute if score rpgloot rpgloot.rng matches 76..100 run scoreboard players set currenteventp currentevent 4

execute if score currenteventp currentevent matches 1 run tellraw @a [{"text":"[世界随机事件] ","color":"gold","bold":true},{"text":"今夜将是一个漫长的噩梦... 强大的区域 BOSS 降临了！","color":"red"}]
execute if score currenteventp currentevent matches 2 run tellraw @a [{"text":"[世界随机事件] ","color":"gold","bold":true},{"text":"血月降临... 死者在饥饿... 亡灵军团发起了暴动！","color":"dark_red","bold":true}]
execute if score currenteventp currentevent matches 3 run tellraw @a [{"text":"[世界随机事件] ","color":"gold","bold":true},{"text":"远方传来了危险的嘶嘶声... 苦力怕大军正在逼近！","color":"green"}]
execute if score currenteventp currentevent matches 4 run tellraw @a [{"text":"[世界随机事件] ","color":"gold","bold":true},{"text":"密密麻麻的毒蛛爬出了巢穴... 蛛群将你包围！","color":"dark_purple"}]

execute if score currenteventp currentevent matches 1 run function rpgloot:events/event_boss
execute if score currenteventp currentevent matches 2 run function rpgloot:events/event_undead
execute if score currenteventp currentevent matches 3 run function rpgloot:events/event_creepers
execute if score currenteventp currentevent matches 4 run function rpgloot:events/event_spiders
