tellraw @a ["",{"text":"[RPG Loot] 默认配置文件已加载！刷新率设为 100% / 上限 30 只。","color":"green"}]

scoreboard objectives add rpgloot.rng dummy
scoreboard objectives add boss_chance dummy
scoreboard objectives add rpgloot.boss_var dummy

scoreboard objectives add mobset dummy
scoreboard objectives add broot dummy
scoreboard objectives add bosslimitset dummy
scoreboard objectives add structuregeneration dummy
scoreboard objectives add pilset dummy
scoreboard objectives add glowset dummy
scoreboard objectives add eventset dummy
scoreboard objectives add eventchance dummy

scoreboard players reset rpgloot.spawn_chance
scoreboard players reset rpgloot
scoreboard players set mob_setting mobset 1
scoreboard players set rpgloot boss_chance 100
scoreboard players set rpgloot bosslimitset 30
scoreboard players set rpgloot eventset 1
scoreboard players set rpgloot eventchance 5
scoreboard players set brutal_nights broot 0
scoreboard players set pillager_settlements pilset 0
scoreboard players set rpgloot glowset 0
