# 📚 RPG Loot 权威百科全书与全数据库指南 (RPG Loot Complete Wiki)

欢迎查阅 **michael9r9r's RPG Loot** 官方权威百科全书！本指南包含数据包中的**全部生命值上限加成装备、副手专属装备机制、三类副本地下城（自然生成 / 道具召唤 / 指令专属）、全 24 种 BOSS 机制与掉落表、战利品表品质区间及全仪式配方**。

---

## 目录
- [第一章：生命值加成与副手专属装备机制](#第一章生命值加成与副手专属装备机制)
- [第二章：副本地下城三大分类与召唤生成指南](#第二章副本地下城三大分类与召唤生成指南)
- [第三章：全 24 种 BOSS 与独特性怪物数据库](#第三章全-24-种-boss-与独特性怪物数据库)
- [第四章：战利品表分类与品质属性区间](#第四章战利品表分类与品质属性区间)
- [第五章：铁砧改名与全仪式全合成配方](#第五章铁砧改名与全仪式全合成配方)
- [第六章：管理员指令与系统配置说明](#第六章管理员指令与系统配置说明)

---

## 第一章：生命值加成与副手专属装备机制

### 1.1 ❤️ 生命值上限加成装备 (Max Health Bonus Items)

在原版 Minecraft 中，防具通常只提供护甲值。RPG Loot 数据包引入了**增加最大生命值 (Max Health)** 的专属装备体系：

1. **锁子甲防具 (Chainmail Armor 系列)**：
   - *机制*: 自 `Uncommon (优秀)` 品质起，所有生成的锁子甲防具（头盔、胸铠、护腿、靴子）均独特附带 **`max_health` (最大生命值上限)** 加成！
   - *数值区间*: 优秀品质 (+1.0 ~ +2.0 HP) -> 传说品质 (最高可达 +10.0 HP / +5 颗心)。
2. **专属生命胸铠**:
   - 🛡️ **Ηγεthία (英雄胸铠)**：面板基础生命值上限 +4.0 ~ +8.0 HP，同时附带半径 8 格队友生命恢复 I 光环。
   - 🛡️ **Hauberk of Beowulf (贝奥武夫锁子甲)**：生命值上限 +4.0 HP + 常驻海豚恩惠。
   - 🛡️ **Flame of the Firehawk (烈焰鹰之火)**：生命值上限加成 + 烈焰光环 + 永久抗火。
   - 🛡️ **Ribcage of Hades (冥王胸铠)**：生命值上限加成 + 死灵凋零光环。
   - 🛡️ **Stalker Carapace (潜行者甲壳)**：生命值上限加成 + 爆炸抗性。

---

### 1.2 🛡️ 副手放置生效装备 (Offhand Exclusive Items)

数据包支持检测玩家 **副手栏位 (`Slot:-106b`)**，以下装备放在副手可激活强力被动效果：

| 装备/物品名称 | 部位 | 放置副手触发的特殊效果 / 技能机制 |
| :--- | :--- | :--- |
| 💎 **钻石 (Diamond)** | **副手 (`Slot:-106b`)** | 放在副手时自动激活**防御阵**: 额外提供护甲值 (Armor)、护甲韧性 (Armor Toughness) 与击退抗性防护。 |
| 🐢 **海龟壳 (Turtle Shell)** | **副手或头部** | 放在副手时提供高额**击退抗性 (Knockback Resistance)**，且不会降低玩家移动速度。 |
| 🐇 **杀手兔脚 (Killer Rabbit's Foot)** | **副手 (`Slot:-106b`)** | 放在副手时自动赋予玩家常驻 **跳跃提升 II (Jump Boost II)** 与额外幸运值加成。 |
| 💖 **治愈光环 (Regeneration Aura)** | **副手 (`Slot:-106b`)** | 放在副手时持续放射**治愈阵**，赋予周围 8 格内所有队友 **生命恢复 I (Regeneration I)**。 |
| 📜 **混沌魔典 (Tome of Chaos)** | **副手 (`Slot:-106b`)** | 放在副手时，**每 10 秒自动触发一次随机魔法**，从 11 种 Buff 中随机获得 1 项，持续 11 秒！ |

---

## 第二章：副本地下城三大分类与召唤生成指南

数据包中的地下城与结构按照生成方式分为 **自然生成副本**、**道具/改名召唤副本** 与 **指令专属召唤副本** 三大类：

---

### 2.1 🌿 1. 自然生成副本 (Naturally Spawns in Overworld)
无需任何指令或道具，在探索主世界特定生物群系时会自然刷出：

1. 🪦 **Graveyard (墓地)**：
   - *生成群系*: 平原、森林、黑森林 (Plains, Forest, Dark Forest)。
   - *特征*: 地表遗留墓碑与死灵刷怪笼，墓穴地下藏有墓地宝箱。
2. 🏰 **Alpha Castle (阿尔法城堡)**：
   - *生成群系*: 平原、山地 (Plains, Mountains)。
   - *特征*: 庞大的坚固城堡，内含守卫刷怪笼，主宝箱概率独占掉落 **Alpha (阿尔法传说古剑)**。
3. 🗼 **Capped Tower (顶封塔)**：
   - *生成群系*: 森林、高山 (Forest, Mountains)。
   - *特征*: 高耸的砖石防御塔，塔顶藏有高阶战利品宝箱。
4. 🏚️ **Collapsed Ruins (坍塌废墟)**：
   - *生成群系*: 主世界温带生物群系。
   - *特征*: 地表破损古建筑，隐藏地砖下藏有秘宝箱。
5. 🏜️ **Arid Tomb (干旱陵墓)**：
   - *生成群系*: 沙漠生物群系 (Deserts) [自然生成几率较稀有]。
   - *BOSS*: 凡塔幽灵 (Vanta) — 掉落 *Lucidity (清明之冠)*。

---

### 2.2 ⛏️ 2. 道具/镐子改名召唤副本 (Item & Pickaxe Summoned Dungeons)

#### 🔹 钻石镐改名 `Ancient Excavator` (远古挖掘者) 丢地召唤 [T1/T2 副本]
将 **钻石镐** 在铁砧中改名为 `Ancient Excavator` 并按 `Q` 键丢在地上，将在脚下随机生成以下 7 种副本之一：
1. 🌿 **Overgrown Armory (藤蔓军械库)** [15% 几率] — 军械库箱 * 3 + 隐藏秘宝箱 * 1。
2. 📚 **Library (失落图书馆)** [15% 几率] — 图书馆箱 * 4 + 酿造桶箱 * 2 (BOSS: Mavmus)。
3. 🌊 **Sunken Ruins (沉没废墟)** [10% 几率] — 水下废墟箱 * 3 + 沉没秘宝箱 * 2。
4. 💎 **Jeweled Caverns (宝石洞窟)** [15% 几率] — 宝石矿箱 * 4 (BOSS: Swarm)。
5. 🌋 **Magma Manufactory (熔岩工坊)** [15% 几率] — 铸造厂箱 * 3 + 酿造桶箱 * 2。
6. 💀 **Catacombs (地下墓穴)** [15% 几率] — 墓穴箱 * 5 + 隐藏秘宝箱 * 2 (BOSS: Jailer)。
7. 🏜️ **Arid Tomb (干旱陵墓)** [15% 几率] — 陵墓箱 * 4 (BOSS: Vanta)。

#### 🔹 下界合金镐改名 `Ancient Excavator` 丢地召唤 [T3 终极副本]
将 **下界合金镐** 在铁砧中改名为 `Ancient Excavator` 并按 `Q` 键丢在地上，生成 3 种高阶副本：
1. 🏰 **Buried Fortress (深埋堡垒)** [33% 几率] — 32x32 庞大堡垒，主箱 * 6 + 隐藏秘宝箱 * 4。
2. 🌋 **Brimstone Bastion (硫磺堡垒)** [33% 几率] — 硫磺战利品箱 * 5。
3. 🏛️ **Divine Sanctum (神圣圣殿)** [34% 几率] — 终极高难殿堂 (BOSS: Exalted One)。

#### 🔹 掠夺者聚落 (Pillager Settlements)
- 需要在配置菜单启用，或使用指令 `/function rpgloot:settlements/summon_heightdetector` 自动检测高度生成掠夺者村落、黑匠铺与粮仓。

---

### 2.3 💻 3. 指令专属召唤副本与管理员测试指令 (Command-only Generators)

管理员或服主可以使用以下指令在当前玩家位置直接强行生成副本：

- 🎲 **`/function rpgloot:generate_structure`**：
  - *功能*: 随机生成 1 个 T1/T2 级地下城副本（随机抽取藤蔓军械库、图书馆、沉没废墟、宝石洞窟、熔岩工坊、地下墓穴、干旱陵墓）。
- 👑 **`/function rpgloot:generate_structure_netherite`**：
  - *功能*: 随机生成 1 个 T3 终极副本（随机抽取深埋堡垒、硫磺堡垒、神圣圣殿）。
- 🛠️ **`/function rpgloot:random_structure`**：
  - *功能*: 供服务器管理员快速在地图各处填充生成随机结构。
- 🏘️ **`/function rpgloot:settlements/create_settlement`**：
  - *功能*: 在当前执行坐标强制创建一个掠夺者聚落。
- ⚡ **`/function rpgloot:admin/tier3`**：
  - *功能*: 管理员测试指令，无视消耗直接生成 T3 级深埋堡垒与圣殿。

---

## 第三章：全 24 种 BOSS 与独特性怪物数据库

### 3.1 毒害虫尊 (Vermivorous)
- **生命值**: 200.0 HP | **护甲值**: 15.0 | **技能**: 毒素光环、高阶中毒与减速。
- **战利品表 (`rpgloot:vermivorous_loot`)**:
  - 🔥 **Flame of the Firehawk (烈焰鹰之火)** [*铁胸铠*] — **掉落概率: 33%**
    - *机制*: **烈焰光环**（使半径 5 格内所有敌对怪物持续着火 50 刻） + **永久抗火 (Fire Resistance)**。
  - 🐝 **The Bee (蜂王胸铠)** [*皮革胸铠*] — **掉落概率: 33%**
  - 🏹 **Lyuda (流星三连发弩)** [*弩*] — **掉落概率: 33%** (附带 `Quick Charge IV` + `Multishot`，中间箭矢自带烈焰与飘浮轨迹)。

### 3.2 幽灵尊者 (Wraith)
- **召唤方式**: 铁砧中将 **钻石块 (Diamond Block)** 改名为 `Offering` 丢在地上。
- **生命值**: 300.0 HP | **护甲值**: 20.0 | **技能**: 高速隐身、雷电打击。
- **战利品表 (`rpgloot:wraith_loot`)**:
  - 🦅 **Aspect of Terror (恐怖面具)** [*鞘翅 (Elytra)*] — **掉落概率: 33%** (**常驻迅捷 I**)。
  - 👁️ **Nightmare (噩梦头盔)** [*皮革头盔*] — **掉落概率: 33%** (**常驻夜视**)。
  - ⏳ **Eye of Chronos (克洛诺斯之眼)** [*时钟*] — **掉落概率: 33%**。

### 3.3 典狱长 (Jailer)
- **生境**: 地下墓穴 (Catacombs) 副本终极 BOSS。
- **生命值**: 250.0 HP | **护甲值**: 25.0
- **战利品表 (`rpgloot:jailer_loot`)**:
  - 🗡️ **Vampiric Cutlass (吸血弯刀)** [*下界合金剑*] — **掉落概率: 33%** (**生命偷取 Life Steal**)。
  - 🪖 **Warden's Barbute (典狱长面甲)** [*下界合金头盔*] — **掉落概率: 33%**。
  - ⛏️ **Cudgel of Discipline (惩戒之棍)** [*下界合金锹*] — **掉落概率: 33%**。

### 3.4 玛夫姆斯魔导师 (Mavmus)
- **生境**: 失落图书馆与法术副本 BOSS。
- **生命值**: 180.0 HP | **技能**: 远程击飞、法术护盾、药水轰炸。
- **战利品表 (`rpgloot:mavmus_loot`)**:
  - 📜 **Tome of Chaos (混沌魔典)** [*书*] — **掉落概率: 33%** (**每 10 秒随机获得 11 种 Buff 之一**)。
  - 🏹 **Longbow of the Cleric (牧师长弓)** [*弓*] — **掉落概率: 33%** (**治愈箭矢，赋予目标生命恢复 II**)。

### 3.5 痛苦元素 (Pain Elemental)
- **召唤方式**: 铁砧中将 **煤炭块 (Coal Block)** 改名为 `Infernal Fuel` 丢在地上。
- **生命值**: 400.0 HP | **技能**: 地形破坏、召唤恶魂、烈焰轰炸。
- **战利品表 (`rpgloot:pain_elemental_loot`)**:
  - 🗡️ **Crucible (灭世裁决之剑)** [*下界合金剑*] — **掉落概率: 50%**。
  - 🏹 **Odysseys End (奥德赛之终)** [*弓*] — **掉落概率: 50%** (**力量战歌光环，周围 12 格队友力量 I**)。

### 3.6 卡洛斯狂暴傀儡 (Carlos)
- **召唤方式**: 铁砧中将 **史莱姆方块 (Slime Block)** 改名为 `Friend Cube` 丢在地上。
- **生命值**: 500.0 HP | **战利品表 (`rpgloot:carlos_loot`)**:
  - 🥄 **Comically Large Spoon (滑稽巨勺)** [*铲*] — **掉落概率: 100%** (伤害 12.0~16.0，巨额击退)。

### 3.7 杀手兔 (Killer Rabbit)
- **战利品表 (`rpgloot:killer_rabbit_loot`)**:
  - 🐇 **Foot of the Killer Rabbit (杀手兔脚)** [*兔脚*] — **掉落概率: 50%** (**副手佩戴获得跳跃提升 II**)。
  - 🗡️ **Excalibur (石中剑/王者之剑)** [*金剑*] — **掉落概率: 50%**。

### 3.8 凡塔幽灵 (Vanta)
- **战利品表 (`rpgloot:vanta_loot`)**:
  - 💀 **Lucidity (清明之冠)** [*凋灵骷髅头颅*] — **掉落概率: 50%** (**免疫并瞬间清除凋零减益**)。
  - 🏹 **Assassin (刺客之弓)** [*弓*] — **掉落概率: 50%** (手持赋予 **迅捷**)。

### 3.9 海神家臣 (Vassal of Poseidon)
- **召唤方式**: 铁砧中将 **金块 (Gold Block)** 改名为 `Phat Loot` 丢在地上。
- **战利品表 (`rpgloot:vassal_loot`)**:
  - 🔱 **Wrath of the Gods (天神之怒)** [*三叉戟*] — **掉落概率: 33%**。
  - 🛡️ **Ηγεthία (英雄胸铠)** [*钻石胸铠*] — **掉落概率: 33%** (**半径 8 格队友生命恢复 I**)。
  - 🪖 **Krános tis thálassas (海神面甲)** [*锁子甲头盔*] — **掉落概率: 33%** (**常驻水下呼吸**)。

### 3.10 北境维京领主 (Hordir)
- **战利品表 (`rpgloot:hordir_loot`)**:
  - 🪓 **Blóðörn (血鹰之斧)** [*钻石斧*] — **掉落概率: 25%** (斩杀伤害 16.0 ~ 20.0)。
  - 🛡️ **Hauberk of Beowulf (贝奥武夫锁子甲)** [*锁子甲胸铠*] — **掉落概率: 25%** (**常驻海豚恩惠**)。

### 3.11 无头骑士 (Headless Horseman)
- **召唤方式**: 铁砧中将 **远古残骸 (Ancient Debris)** 改名为 `Sacrifice` 丢在地上。
- **战利品表 (`rpgloot:headless_loot`)**:
  - 🪓 **Death's Axe (死亡之斧)** [*下界合金斧*] — **掉落概率: 33%**。
  - 🎃 **Haunted Pumpkin (诅咒南瓜)** [*南瓜*] — **掉落概率: 33%**。
  - 🔥 **Eternal Flame (永恒烈焰)** [*打火石*] — **掉落概率: 33%**。

### 3.12 末影龙 (Ender Dragon)
- **战利品表 (`data/minecraft/loot_tables/entities/ender_dragon.json`)**:
  - 🕊️ **Final Flight (终极之翼)** [*胸铠*]：赋予常驻 **力量 II (Strength II)**。
  - 🏆 **Trophy of the End (终末奖杯)** [*道具*]：攻击伤害 10-15。
  - 爪 **Dragon's Talon (龙之爪)** [*武器*]：攻击伤害 10-14。

### 3.13 凋灵 (Wither)
- **战利品表 (`data/minecraft/loot_tables/entities/wither.json`)**:
  - 💀 **Ribcage of Hades (冥王胸铠)** [*胸铠*]：**死灵光环**（半径 8 格内敌对怪物施加持续凋零）。

---

## 第四章：战利品表分类与品质属性区间

| 品质阶级 (Rarity) | 攻击力加成 (Damage) | 护甲加成 (Armor) | 击退抗性 (Knockback Resist) | 幸运值 (Luck) |
| :--- | :--- | :--- | :--- | :--- |
| 🟩 **优秀 (Uncommon)** | +1.0 ~ +3.0 | +1.0 ~ +3.0 | +0.05 ~ +0.10 | +0.2 ~ +0.5 |
| 🟦 **稀有 (Rare)** | +3.0 ~ +6.0 | +3.0 ~ +6.0 | +0.10 ~ +0.20 | +0.5 ~ +1.0 |
| 🟪 **史诗 (Very Rare)** | +6.0 ~ +10.0 | +6.0 ~ +10.0 | +0.20 ~ +0.35 | +1.0 ~ +1.5 |
| 🟧 **传说 (Legendary)** | +10.0 ~ +18.0+ | +10.0 ~ +18.0+ | +0.35 ~ +0.50+ | +1.0 ~ +2.0 |

---

## 第五章：铁砧改名与全仪式全合成配方

```text
钻石镐   改名 "Ancient Excavator" -> 随机生成 T1/T2 级地下城副本
下界合金镐 改名 "Ancient Excavator" -> 随机生成 T3 级终极高阶副本
史莱姆块 改名 "Friend Cube"       -> 降下天雷，召唤 RAID BOSS Carlos (卡洛斯)
钻石块   改名 "Offering"          -> 降下闪电，召唤 BOSS Wraith (幽灵尊者)
金块     改名 "Phat Loot"         -> 触发神圣军队试炼与战利品
粗铁块   改名 "Magic Beans"       -> 触发魔豆试炼
黑曜石   改名 "Sacrifice"        -> 召唤 资深怪物试炼
远古残骸 改名 "Unique Sacrifice" -> 召唤 隐藏独特 BOSS 战 (无头骑士等)
煤炭块   改名 "Infernal Fuel"     -> 召唤 BOSS Pain Elemental (痛苦元素)
烈焰棒   改名 "Rod of Banishment" -> [保命神器] 瞬间杀死并放逐附近所有 RAID BOSS
```

- **附魔金苹果配方**: 中间 1 个金苹果 (`golden_apple`) + 周围 8 个金块 (`gold_block`)。

---

## 第六章：管理员指令与系统配置说明

- **`/function rpgloot:stats`**：打印玩家当前总 RPG 属性面板。
- **`/function rpgloot:give_book`**：给予玩家/管理员官方 RPG 指南书。
- **`/function rpgloot:options`**：打开系统配置菜单。
- **`/function rpgloot:generate_structure`**：管理员随机生成 T1/T2 级地下城副本。
- **`/function rpgloot:generate_structure_netherite`**：管理员随机生成 T3 级终极副本。
- **`/function rpgloot:uninstall`**：安全卸载数据包并清理记分板。
