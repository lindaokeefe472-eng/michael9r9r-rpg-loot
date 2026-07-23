tag @s add rpgloot_welcomed

# Automatically give the RPG Guide Book to all players on join / load
execute as @a run function rpgloot:give_book

tellraw @a ["",{"text":"═══════════════════════════════════════════════════════════════\n","color":"gold","bold":true},{"text":"  ⚔️ RPG Loot 数据包已就绪！\n","color":"yellow","bold":true},{"text":"  📖 《RPG Loot 玩家指南书》已自动放入你的背包！\n\n","color":"green","bold":true},{"text":"  快捷功能（在聊天栏点击即可使用）：\n","color":"gray"},{"text":"  ▶ ","color":"gold"},{"text":"[⚙️ 打开设置菜单]","color":"light_purple","click_event":{"action":"run_command","command":"/trigger rpgloot_opt set 0"},"hover_event":{"action":"show_text","value":"点击调节刷新率、Boss上限与特效"}},{"text":"  ▶ ","color":"gold"},{"text":"[📊 查看角色面板]","color":"gold","click_event":{"action":"run_command","command":"/trigger rpgloot_opt set 12"},"hover_event":{"action":"show_text","value":"查看当前的生命、攻击力、护甲与攻速"}},{"text":"  ▶ ","color":"gold"},{"text":"[🏰 生成随机地牢]","color":"red","click_event":{"action":"run_command","command":"/trigger rpgloot_opt set 13"},"hover_event":{"action":"show_text","value":"在当前位置生成副本/遗迹建筑"}},{"text":"\n═══════════════════════════════════════════════════════════════","color":"gold","bold":true}]
