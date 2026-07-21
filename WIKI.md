# 📚 RPG Loot 终极百科全书与全数据库指南 (RPG Loot Complete Wiki)

欢迎查阅 **michael9r9r's RPG Loot** 全网最完整的官方数据库指南！本百科全书包含数据包中的**全部 24 种 BOSS 与怪物属性、全 10 大地下城副本分布与宝箱掉落池、全战利品表权重与品质区间、50+ 专属神器效果、药水配方与全仪式机制**。

---

## 目录
- [第一章：怪物体系与全生物图鉴 (Bestiary)](#第一章怪物体系与全生物图鉴-bestiary)
- [第二章：副本地下城与自然结构大全 (Dungeons & Structures)](#第二章副本地下城与自然结构大全-dungeons--structures)
- [第三章：战利品表分类与全装备道具图鉴 (Loot Tables & Items)](#第三章战利品表分类与全装备道具图鉴-loot-tables--items)
- [第四章：铁砧改名与全仪式全合成配方 (Rituals & Recipes)](#第四章铁砧改名与全仪式全合成配方-rituals--recipes)
- [第五章：玩家属性面板与指令选项 (Commands & Systems)](#第五章玩家属性面板与指令选项-commands--systems)

---

## 第一章：怪物体系与全生物图鉴 (Bestiary)

在 RPG Loot 数据包中，怪物分为 **普通怪物强化阶级 (Mob Tiers)**、**副本小怪 (Dungeon Minions)** 以及 **BOSS 与独特性怪物 (Bosses & Unique Mobs)**。

### 1.1 普通怪物强化阶级 (Mob Tiers)
野外生成的普通敌对生物（僵尸、骨骷、蜘蛛、苦力怕、安德、女巫、尸壳、流浪者、骑手、凋灵骷髅、凋灵射手、烈焰人、铁傀儡、守卫者、恶魂）在生成时会自动根据概率强化：

| 强化阶级 | 属性加成倍率 | 外观特效 | 专属掉落战利品表 |
| :--- | :--- | :--- | :--- |
| 🛡️ **资深 (Veteran)** | 生命值 +50%, 攻击力 +30% | 无 | `rpgloot:veteran_loot` |
| ⚡ **精英 (Elite)** | 生命值 +100%, 护甲 +10, 攻击力 +50% | 发光/粒子 | `rpgloot:elite_loot` |
| 🌟 **传奇 (Legendary)** | 生命值 +200%, 护甲 +20, 攻击力 +100% | 强光/火焰 | `rpgloot:legendary_loot` / `legendary_loot_plus1` |
| 👻 **幽灵 (Spectre)** | 生命值 +50%, 获得隐身与极高移速 | 幽灵效果 | `rpgloot:spectre_loot` (独占 `Shadowsabre`) |
| 🏆 **冠军 (Champion)** | 生命值 +300%, 全属性翻倍 | 金色高亮 | 高阶传说武器 |

---

### 1.2 全 24 种 BOSS 与独特性怪物数据库

#### 1. 毒害虫尊 (Vermivorous)
- **生境/来源**: 高级毒素与虫群副本 BOSS。
- **生命值**: 200.0 HP | **护甲值**: 15.0
- **技能**: 施加高阶毒素光环，造成减速与持续中毒。
- **战利品表 (`rpgloot:vermivorous_loot`)**:
  - 🔥 **Flame of the Firehawk (烈焰鹰之火)** [*铁胸铠*] — **掉落概率: 33%**
    - *效果*: **烈焰光环**（使半径 5 格内所有敌对怪物持续着火 50 刻） + **永久抗火 (Fire Resistance)**。
  - 🐝 **The Bee (蜂王胸铠)** [*皮革胸铠*] — **掉落概率: 33%**
    - *效果*: 高额护甲与敏捷加成。
  - 🏹 **Lyuda (流星三连发弩)** [*弩*] — **掉落概率: 33%**
    - *效果*: 附带 `Quick Charge IV` + `Multishot`，中间箭矢自带烈焰与飘浮轨迹。

#### 2. 幽灵尊者 (Wraith)
- **召唤方式**: 铁砧中将 **钻石块 (Diamond Block)** 改名为 `Offering` 丢在地上。
- **生命值**: 300.0 HP | **护甲值**: 20.0
- **技能**: 高速移动、潜行隐身、雷电击打。
- **战利品表 (`rpgloot:wraith_loot`)**:
  - 🦅 **Aspect of Terror (恐怖面具)** [*鞘翅 (Elytra)*] — **掉落概率: 33%**
    - *效果*: 装备时赋予常驻 **迅捷 I (Speed I)** 移动速度加成。
  - 👁️ **Nightmare (噩梦头盔)** [*皮革头盔*] — **掉落概率: 33%**
    - *效果*: 赋予常驻 **夜视 (Night Vision)**。
  - ⏳ **Eye of Chronos (克洛诺斯之眼)** [*时钟*] — **掉落概率: 33%**
    - *效果*: 命运掌控道具，高额幸运。

#### 3. 典狱长 (Jailer)
- **生境/来源**: 地下墓穴 (Catacombs) 副本终极 BOSS。
- **生命值**: 250.0 HP | **护甲值**: 25.0
- **战利品表 (`rpgloot:jailer_loot`)**:
  - 🗡️ **Vampiric Cutlass (吸血弯刀)** [*下界合金剑*] — **掉落概率: 33%**
    - *效果*: **Life Steal (生命偷取)**！攻击命中敌人时将造成伤害转化为玩家生命值。
  - 🪖 **Warden's Barbute (典狱长面甲)** [*下界合金头盔*] — **掉落概率: 33%**
  - ⛏️ **Cudgel of Discipline (惩戒之棍)** [*下界合金锹*] — **掉落概率: 33%**

#### 4. 玛夫姆斯魔导师 (Mavmus)
- **生境/来源**: 失落图书馆与法术副本 BOSS。
- **生命值**: 180.0 HP | **技能**: 远程击飞、法术护盾、药水轰炸。
- **战利品表 (`rpgloot:mavmus_loot`)**:
  - 📜 **Tome of Chaos (混沌魔典)** [*书*] — **掉落概率: 33%**
    - *效果*: **每 10 秒从 11 种 Buff 中随机抽取 1 项**（力量、抗性、速度、急迫、海豚恩惠、水下呼吸、缓降、跳跃提升、伤害吸收等）施加给玩家，持续 11 秒！
  - 🏹 **Longbow of the Cleric (牧师长弓)** [*弓*] — **掉落概率: 33%**
    - *效果*: **治愈箭矢**！射出的箭矢附带 **生命恢复 II (Regeneration II)**，可远程治疗队友。
  - 🧪 **Elixir of the Illusioner (幻术师秘药)** [*药水*] — **掉落概率: 33%**

#### 5. 痛苦元素 (Pain Elemental)
- **召唤方式**: 铁砧中将 **煤炭块 (Coal Block)** 改名为 `Infernal Fuel` 丢在地上。
- **生命值**: 400.0 HP | **技能**: 高频地形破坏、召唤恶魂、烈焰轰炸。
- **战利品表 (`rpgloot:pain_elemental_loot`)**:
  - 🗡️ **Crucible (灭世裁决之剑)** [*下界合金剑*] — **掉落概率: 50%**
    - *效果*: Doom 纪念剑，全包最高单发面板伤害。
  - 🏹 **Odysseys End (奥德赛之终)** [*弓*] — **掉落概率: 50%**
    - *效果*: **力量战歌光环**！手持时赋予周围 12 格内所有玩家 **力量 I (Strength I)**。

#### 6. 卡洛斯狂暴傀儡 (Carlos)
- **召唤方式**: 铁砧中将 **史莱姆方块 (Slime Block)** 改名为 `Friend Cube` 丢在地上。
- **生命值**: 500.0 HP | **技能**: 高额回复、狂暴冲锋。
- **战利品表 (`rpgloot:carlos_loot`)**:
  - 🥄 **Comically Large Spoon (滑稽巨勺)** [*木铲/铁铲*] — **掉落概率: 100%**
    - *效果*: 面板伤害 12.0~16.0，附带极大搞笑击退。

#### 7. 杀手兔 (Killer Rabbit)
- **生境/来源**: 野外罕见生成，拥有极高移速。
- **战利品表 (`rpgloot:killer_rabbit_loot`)**:
  - 🐇 **Foot of the Killer Rabbit (杀手兔脚)** [*兔脚*] — **掉落概率: 50%**
    - *效果*: 放在**副手 (Offhand)** 即可获得常驻 **跳跃提升 II (Jump Boost II)**。
  - 🗡️ **Excalibur (石中剑/王者之剑)** [*金剑*] — **掉落概率: 50%**

#### 8. 凡塔幽灵 (Vanta)
- **生境/来源**: 干旱陵墓与阴暗地底生成。
- **战利品表 (`rpgloot:vanta_loot`)**:
  - 💀 **Lucidity (清明之冠)** [*凋灵骷髅头颅*] — **掉落概率: 50%**
    - *效果*: **凋零免疫**！佩戴时瞬间清除并免疫 `minecraft:wither` 减益。
  - 🏹 **Assassin (刺客之弓)** [*弓*] — **掉落概率: 50%**
    - *效果*: 手持赋予玩家 **迅捷 (Speed)**，箭矢自带飘浮轨迹。

#### 9. 海神家臣 (Vassal of Poseidon)
- **召唤方式**: 铁砧中将 **金块 (Gold Block)** 改名为 `Phat Loot` 丢在地上触发 RAID 战斗！
- **战利品表 (`rpgloot:vassal_loot`)**:
  - 🔱 **Wrath of the Gods (天神之怒)** [*三叉戟*] — **掉落概率: 33%**
  - 🛡️ **Ηγεthία (英雄胸铠)** [*钻石胸铠*] — **掉落概率: 33%**
    - *效果*: **生命回复光环**！赋予周围 8 格内所有队友 **生命恢复 I (Regeneration I)**。
  - 🪖 **Krános tis thálassas (海神骑士面甲)** [*锁子甲头盔*] — **掉落概率: 33%**
    - *效果*: 赋予常驻 **水下呼吸 (Water Breathing)**。

#### 10. 北境维京领主 (Hordir)
- **生境/来源**: 寒带与极地遗迹 BOSS。
- **战利品表 (`rpgloot:hordir_loot`)**:
  - 🪓 **Blóðörn (血鹰之斧)** [*钻石斧*] — **掉落概率: 25%**
    - *效果*: 高额单发斩杀伤害 (16.0 ~ 20.0)。
  - 🛡️ **Hauberk of Beowulf (贝奥武夫锁子甲)** [*锁子甲胸铠*] — **掉落概率: 25%**
    - *效果*: 赋予常驻 **海豚恩惠 (Dolphin's Grace)**。
  - 🗡️ **Sverði Víkinga (维京之剑)** [*铁剑*] — **掉落概率: 25%**
  - 🛡️ **Skjöldr af Mætti (力量之盾)** [*盾牌*] — **掉落概率: 25%**

#### 11. 无头骑士 (Headless Horseman)
- **召唤方式**: 铁砧中将 **远古残骸 (Ancient Debris)** 改名为 `Sacrifice` 丢在地上。
- **战利品表 (`rpgloot:headless_loot`)**:
  - 🪓 **Death's Axe (死亡之斧)** [*下界合金斧*] — **掉落概率: 33%**
  - 🎃 **Haunted Pumpkin (诅咒南瓜)** [*雕刻过的南瓜*] — **掉落概率: 33%**
  - 🔥 **Eternal Flame (永恒烈焰)** [*打火石*] — **掉落概率: 33%**

#### 12. 深渊监视者 (Abyss Watcher)
- **战利品表 (`rpgloot:abyss_watcher_loot`)**: 掉落 *Abyssal Blade* (深渊之刃) 与 *Curse of the Deep* (深渊诅咒)。

#### 13. 屠夫 (Butcher)
- **战利品表 (`rpgloot:butcher_loot`)**: 掉落 *Cleaver* (切肉大刀，伤害 20-25) 与 *Butcher's Apron*。

#### 14. 耀斑 (Flare)
- **战利品表 (`rpgloot:flare_loot`)**: 掉落 *Aegis of Flame* (烈焰盾牌) 与 *Radiance* (耀光之斧)。

#### 15. 神射手 (Sharpshooter)
- **战利品表 (`rpgloot:sharpshooter_loot`)**: 掉落 *Sharpshooter's Crossbow* (神射手弩) 与 *Pants of Haste* (急速裤)。

#### 16. 孢子怪物 (Spore)
- **战利品表 (`rpgloot:spore_loot`)**: 掉落 *Stalker Carapace* (潜行者甲壳) 与 *Defender of the Grove* (活木之斧，伤害 10-14)。

#### 17. 瘟疫虫群 (Swarm)
- **战利品表 (`rpgloot:swarm_loot`)**: 掉落 *Home Run* (全垒打木棒，击退 10)、*Nárazu* (冲击靴) 与 *Plague Sore* (瘟疫之伤)。

#### 18. 远游者 (Farlander)
- **战利品表 (`rpgloot:farlander_loot`)**: 掉落 *Forgotten Blade* (遗忘之刃)。

#### 19. 崇高者 (Exalted One)
- **生境/来源**: 神圣圣殿 (Divine Sanctum) 终极 BOSS。
- **战利品表 (`rpgloot:exaltedone_loot`)**: 掉落 *Exalted Cuirass* (崇高胸铠) 与 *Windshredder* (风之切)。

#### 20. 死亡行者 (Deathstrider)
- **战利品表 (`rpgloot:deathstrider_loot`)**: 掉落 *Deathstrider Boots* (死亡行者之靴)。

#### 21. 掠夺者首领 (Pillager Chieftain)
- **生境/来源**: 掠夺者村落/聚落。
- **战利品表 (`rpgloot:chieftain_loot`)**: 掉落 *Chieftain's Banner* 与高阶村落战利品。

#### 22. 幽灵怪 (Spectre)
- **战利品表 (`rpgloot:spectre_loot`)**: 独占掉落 **Shadowsabre (影之圣剑)**。

#### 23. 末影龙 (Ender Dragon)
- **战利品表 (`data/minecraft/loot_tables/entities/ender_dragon.json`)**:
  - 🕊️ **Final Flight (终极之翼)** [*胸铠*]：赋予常驻 **力量 II (Strength II)**。
  - 🏆 **Trophy of the End (终末奖杯)** [*道具*]：攻击伤害 10-15。
  - 爪 **Dragon's Talon (龙之爪)** [*武器*]：攻击伤害 10-14。

#### 24. 凋灵 (Wither)
- **战利品表 (`data/minecraft/loot_tables/entities/wither.json`)**:
  - 💀 **Ribcage of Hades (冥王胸铠)** [*胸铠*]：**死灵光环**（半径 8 格内敌对怪物施加持续凋零）。
  - 🦴 **Wither Bone (凋灵之骨)** [*材料*]。

---

## 第二章：副本地下城与自然结构大全 (Dungeons & Structures)

### 2.1 主世界自然生成结构 (Natural Generation)
数据包会在主世界特定生物群系中自然生成 4 种结构：

| 结构名称 (Structure) | 生成生物群系 (Biomes) | 结构特征 | 特色宝箱池 |
| :--- | :--- | :--- | :--- |
| 🪦 **Graveyard (墓地)** | 平原/森林/黑森林 | 地表墓碑与死灵刷怪笼 | 墓地地下宝箱 |
| 🏰 **Alpha Castle (阿尔法城堡)** | 平原/山地 | 庞大城堡，内含守卫刷怪笼 | **Alpha (阿尔法传说古剑)** 独占宝箱 |
| 🗼 **Capped Tower (顶封塔)** | 森林/高山 | 高耸防御塔 | 塔顶高阶战利品箱 |
| 🏚️ **Collapsed Ruins (坍塌废墟)** | 各种温带生物群系 | 地表破损建筑与地下隐藏室 | 废墟宝箱 + 隐藏墙秘宝 |

---

### 2.2 镐子铁砧改名召唤副本 (Anvil Pickaxe Dungeons)

在铁砧中给镐子改名为 `Ancient Excavator`（资源包显示为 `远古挖掘者`）并按 `Q` 丢在地上，将在玩家脚下生成副本：

#### 🔹 钻石镐召唤 (Tier 1 ~ Tier 2 副本)

1. 🌿 **Overgrown Armory (藤蔓军械库)** [生成几率: 15%]
   - *特征*: 充满植物与藤蔓的古老军械库。
   - *宝箱*: 军械库箱 * 3，隐藏秘宝箱 * 1。
   - *怪物*: 军械库守卫 (Armory Guards)、僵尸。

2. 📚 **Library (失落图书馆)** [生成几率: 15%]
   - *特征*: 多层书架与魔法迷宫。
   - *宝箱*: 图书馆书架箱 * 4，酿造桶箱 * 2。
   - *BOSS/小怪*: 玛夫姆斯 (Mavmus)、抄写员 (Scriber)。

3. 🌊 **Sunken Ruins (沉没废墟)** [生成几率: 10%]
   - *特征*: 水下与湿润的远古废墟。
   - *宝箱*: 水下废墟箱 * 3，沉没秘宝箱 * 2。
   - *掉落*: 三叉戟、水下装备、*Krános tis thálassas*。

4. 💎 **Jeweled Caverns (宝石洞窟)** [生成几率: 15%]
   - *特征*: 矿脉密集与宝石结晶洞窟。
   - *宝箱*: 宝石矿箱 * 4。
   - *BOSS*: 瘟疫虫群 (Swarm) — 掉落 *Home Run (全垒打木棒)*。

5. 🌋 **Magma Manufactory (熔岩工坊)** [生成几率: 15%]
   - *特征*: 充斥熔岩与黑曜石的铸造厂。
   - *宝箱*: 铸造厂箱 * 3，酿造桶箱 * 2。
   - *掉落*: 抗火装备、黑曜石皮肤药水。

6. 💀 **Catacombs (地下墓穴)** [生成几率: 15%]
   - *特征*: 深层地下墓穴与迷宫死灵。
   - *宝箱*: 墓穴宝箱 * 5，隐藏秘宝箱 * 2。
   - *BOSS*: 典狱长 (Jailer) — 掉落 *Vampiric Cutlass (吸血弯刀)*。

7. 🏜️ **Arid Tomb (干旱陵墓)** [生成几率: 15%]
   - *特征*: 沙漠风陵墓。
   - *宝箱*: 陵墓宝箱 * 4。
   - *BOSS*: 凡塔幽灵 (Vanta) — 掉落 *Lucidity (清明之冠)*。

#### 🔹 下界合金镐召唤 (Tier 3 终极副本)

1. 🏰 **Buried Fortress (深埋堡垒)** [生成几率: 33%]
   - *特征*: 32x32 极限跨度庞大地下堡垒！
   - *宝箱*: 堡垒主箱 * 6，隐藏秘宝箱 * 4。

2. 🌋 **Brimstone Bastion (硫磺堡垒)** [生成几率: 33%]
   - *特征*: 下界岩与硫磺组成的死灵堡垒。
   - *宝箱*: 硫磺战利品箱 * 5。

3. 🏛️ **Divine Sanctum (神圣圣殿)** [生成几率: 34%]
   - *特征*: 终极高难殿堂。
   - *BOSS*: 崇高者 (Exalted One) — 掉落 *Exalted Cuirass* 与 *Windshredder (风之切)*。

---

## 第三章：战利品表分类与全装备道具图鉴 (Loot Tables & Items)

### 3.1 装备品质阶级与属性区间

数据包随机生成的装备分为 4 个品质阶级，属性加成区间如下：

| 品质阶级 (Rarity) | 攻击力加成 (Damage) | 护甲加成 (Armor) | 击退抗性 (Knockback Resist) | 幸运值 (Luck) |
| :--- | :--- | :--- | :--- | :--- |
| 🟩 **优秀 (Uncommon)** | +1.0 ~ +3.0 | +1.0 ~ +3.0 | +0.05 ~ +0.10 | +0.2 ~ +0.5 |
| 🟦 **稀有 (Rare)** | +3.0 ~ +6.0 | +3.0 ~ +6.0 | +0.10 ~ +0.20 | +0.5 ~ +1.0 |
| 🟪 **史诗 (Very Rare)** | +6.0 ~ +10.0 | +6.0 ~ +10.0 | +0.20 ~ +0.35 | +1.0 ~ +1.5 |
| 🟧 **传说 (Legendary)** | +10.0 ~ +18.0+ | +10.0 ~ +18.0+ | +0.35 ~ +0.50+ | +1.0 ~ +2.0 |

---

### 3.2 药水图鉴 (Custom Potions Dictionary)

- 🛡️ **Obsidian Skin Potion (黑曜石皮肤药水)**：替代原版熔岩潜行药水，提供更长时间的抗性 (Resistance) 效果。
- ⚡ **Potion of Haste (急迫药水)**：提供挖掘加速与攻击速度提升。
- 💪 **Potion of Strength (力量药水)**：高阶力量加成。
- 💖 **Potion of Regeneration (生命恢复药水)**：高频生命回复。
- 🧪 **Elixir of the Illusioner (幻术师秘药)**：掉落自 Mavmus，提供魔法吸收护盾。

---

## 第四章：铁砧改名与全仪式全合成配方 (Rituals & Recipes)

### 4.1 铁砧改名丢物召唤仪式汇总

在铁砧中给对应物品改名后，**按 Q 键丢在地上** 即可触发仪式：

```text
钻石镐   改名 "Ancient Excavator" -> 随机生成 T1/T2 级地下城副本
下界合金镐 改名 "Ancient Excavator" -> 随机生成 T3 级终极高阶副本
史莱姆块 改名 "Friend Cube"       -> 降下天雷，召唤 RAID BOSS Carlos (卡洛斯)
钻石块   改名 "Offering"          -> 降下闪电，召唤 BOSS Wraith (幽灵尊者)
金块     改名 "Phat Loot"         -> 触发神圣军队试炼与战利品
粗铁块   改名 "Magic Beans"       -> 触发魔豆仪式与植物生成
哭泣黑曜石 改名 "Sacrifice"        -> 召唤 资深怪物试炼
远古残骸 改名 "Unique Sacrifice" -> 召唤 隐藏独特 BOSS 战 (无头骑士等)
煤炭块   改名 "Infernal Fuel"     -> 召唤 BOSS Pain Elemental (痛苦元素)
烈焰棒   改名 "Rod of Banishment" -> [保命神器] 瞬间杀死并放逐附近所有 RAID BOSS
```

---

### 4.2 特殊配方 (Custom Crafting Recipes)

- **附魔金苹果 (Enchanted Golden Apple)**：
  - 数据包恢复了经典附魔金苹果合成配方！
  - 配方：中间放 1 个金苹果 (`golden_apple`)，周围环绕 8 个金块 (`gold_block`)。

---

## 第五章：玩家属性面板与指令选项 (Commands & Systems)

- **`/function rpgloot:stats`**：在聊天框打印玩家当前总 RPG 属性（护甲、护甲韧性、攻击力、攻击击退、攻击速度、DPS、生命值上限、移动速度、击退抗性、幸运值）。
- **`/function rpgloot:give_book`**：给予玩家/管理员包含交互点击事件的官方 RPG 手册指南书。
- **`/function rpgloot:options`**：打开系统配置菜单（可调整 BOSS 生成开关、怪物上限数量 0-100、发光怪物显示、掠夺者村落生成等）。
- **`/function rpgloot:uninstall`**：安全卸载数据包并清理所有计分板变量。
