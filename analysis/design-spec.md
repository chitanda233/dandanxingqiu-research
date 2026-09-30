# 《弹弹星球》逆向策划设计案（版本 242）

> 本文是**从客户端代码与静态配置反推的现有游戏设计**，不是改版提案。标记为【实现】的是可追到函数/消息的行为，【配置】是缓存中的数值，【推断】是对策划目的的解释，【待证】需服务器逻辑或真实对局验证。相关细表和代码统一在页末索引。这样读者既能理解玩法设计，也能知道哪些结论能复核。

## 1. 产品体验与主循环

**核心体验命题【推断】**：在回合制弹射战斗里，把“角度＋力度＋地形/风”形成的操作差异，与技能、武器、宠物构筑形成的长期选择叠加；PVP 用赛季杯分作为长期验证场，PVE/任务/签到/通行证持续供给养成材料。该解释来自战斗输入、技能表、玩法目标、赛季和资源配置的交叉关系，并非官方文案。[战斗命令](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.cmd.network.lua)、[玩法目标](../analysis/data/team_target_main.json)、[赛季配置](../analysis/data/season_misc_season_misc.json)

```text
新手任务/签到 → 进入 PVE 或 PVP → 战斗获得进度和资源
        ↓                           ↓
解锁武器/宠物/技能 ← 活跃宝箱/赛季奖励/通行证
        ↓
升级、升星、配装、被动选择 → 再进高难 PVE / 排位
```

这一循环有两个节奏：**单局**每回合做命中与资源决策；**局外**每天做任务、领取阶段奖励，再把资源投入构筑。可见的留存刻度是活跃度 20/40/60/80/100、PVP 每日奖励次数 3、通行证 21 天周期与每周经验上限 10000。[活跃度](../analysis/data/task_liveness_task_liveness.json)、[通行证](../analysis/data/battlepass_misc_battlepass_misc.json)

## 2. 单局设计：状态、操作、反馈

### 2.1 回合状态机

【实现】服务器给出回合、行动对象与战斗节点；客户端进入 `attack` 状态，控制单位还须 `round_status.action` 才能主动使用技能。发炮请求含 `round,angle,force,pos,from_pos,direction,force_type,land_angle` 等。服务端回包的节点驱动弹体、技能、伤害/状态和回合表现；客户端按批次合并、再按飞行时间排序。[发炮与节点](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.cmd.network.lua)、[技能检查](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.skill.core.lua)

**玩家决策顺序【设计归纳】**：识别地形与风 → 选择目标与弹道 → 决定移动/传送/蓄力 → 选技能或普攻 → 发炮 → 读取落点与伤害反馈 → 下回合重估。技能前置限制会阻止“先射再无限补技能”：当前行动者、禁用、定身、次数、CD、费用都由客户端检查；最终仍由服务器确认。默认行动时间配置 15，具体场景和服务器可覆盖。[战斗常量](../analysis/data/fight_misc_attr_const.json)

### 2.2 操作空间与可计算的弹道

【实现】普通轨迹以 `x=x0+v0x·t+0.5·ax·t²`、`y=y0+v0y·t+0.5·ay·t²` 更新；物理环境另用速度/加速度逐帧积分，并有直线、贝塞尔、自由落体分支。[轨迹模块](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.trajectory.lua) 【配置】力度上限 100，推荐角度 20/30/50/65° 均有 20 个力度样本；30°快捷提示使用 `30±wind`，50/65°使用 `±2×wind`。这些是辅助瞄准，不是自动命中。[力度表](../analysis/data/fight_misc_attr_const.json) 推荐力度代码另在 0–100 区间内模拟落点并二分搜索，而不是照抄预设表；风或传送口会进入该搜索的不同参数路径。[计算段](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.recommand_force.lua#L1188)

【设计意图推断】推荐线解决新玩家“完全打不中”的首局门槛；风、重力、环境和地形仍让熟练度有收益。环境 ID 1 设磁暴弹道/速度参数，ID 2 设普通与狂风区间，ID 8/12/16/17 各挂被动技能，使同一武器在不同战场出现不同最优解。[环境表](../analysis/data/battle_env_battle_env.json)

### 2.3 技能是回合资源与构筑资源

【配置】技能一行同时含 `cost,init_cd,turn_cd,turn_max,match_max,effect`，部分有 `pve_*` 覆盖。例：`减伤 1011010` 花费 `[1,10000]`，CD 4，单局最多 2 次；升级变体 `1011030/1011050` 的文本减伤从 5.5% 升到 7.5%/9.5%，CD 降至 3/2。`传送 110001` 发炮后到落点且 CD 2；`群疗 1007040` 是队伍恢复、CD 3、单局 2 次。[技能表](../analysis/data/skill_skill.json) 【设计意图推断】把直接伤害、位置、保护和团队恢复放进同一回合窗口，使出手时机比单纯“数值最大的一炮”重要。

【风险与校验】`治疗 1006999` 的文字写单局 5 次，而配置 `match_max=1`；这表明文案/配置可能不同步，实际服务器还可能覆盖。不能用说明文本反推完整规则。[技能专题](skills.md)

### 2.4 伤害拆成哪些层

从属性表可还原候选层：攻击/防御、技能比例与固定项、伤害增加/减免、物理/法术分流、暴击/抗暴、护盾、随机波动、PVP 平衡属性。[属性定义](../analysis/data/attr_attr.json)、[伤害常量](../analysis/data/fight_misc_attr_const.json) 客户端常量包含 `dmg_random_r=0.02`、暴击伤害系数上下界 1.25/2、最低伤害系数 0.1。**最终乘法顺序和取整不能从客户端闭合**；本设计案只画出决策影响层，不虚构“最终伤害公式”。[局内计算专题](combat-math.md)

## 3. 局外成长：以构筑拓宽战斗决策

### 3.1 角色：稳定的基础增长

【配置】角色等级表 133 行，属性点以每级 5 点增长：50 级 250、100 级 500、133 级 665；五种基础属性单项上限是等级×3。基础生命在等级 1/50/60 行为 40/120/280，说明成长曲线有阶段跳变，不是线性加生命。[角色等级表](../analysis/data/exp_player.json) 【设计意图推断】属性点提供玩家主动分配，基础模板保障每级底盘；技能的部分高阶效果又检查体质/敏捷等加点条件，把“点数分配”反馈到弹体倍率。[技能专题](skills.md)

### 3.2 武器与宠物：纵向升级＋横向机制

武器按阶级、强化、升星、精通、放大、附魔等多层成长。武器阶级 1–6 的等级门槛为 1/60/75/85/95/105，开服天数门槛为 1/62/124/186/248/310；强度 7/15/30 还分别要求其他部位达到 4/20/82。[阶级](../analysis/data/weapon_class_weapon_class.json)、[强化门槛](../analysis/data/weapon_strength_weapon_strength.json) 【设计意图推断】等级和开服天数双锁控制长期消耗，部位互锁阻止只堆一件。

宠物表 100 级；10/50/100 级模板攻击 64/252/776、生命 67/338/1156。进化、天赋、学习技能另设表；战斗技能与主人技能存在多种联动，因而宠物不是单一“战力加法”。[宠物等级](../analysis/data/pet_level_pet_level.json)、[进化](../analysis/data/pet_evo_pet_evo.json)、[宠物技能](../analysis/data/pet_skill_learn_pet_skill_learn.json)

### 3.3 模式平衡并不抹平所有养成

【配置】排位平衡表有 288 行，首行可替换角色生命/攻击/防御为 1568/570/335，宠物为 297/614/346；后续行随等级或开服日数变化。[平衡表](../analysis/data/ranked_match_balance_ranked_match_balance.json) 赛季另指定部分 `battle_balance_attr_limit` 为 9600，2v2 表为 9500。[赛季杂项](../analysis/data/season_misc_season_misc.json)、[2v2 杂项](../analysis/data/ranked_match_misc_ranked_match_misc.json) 【设计意图推断】PVP 保留配装、技能、操作的差异，同时压制纯面板碾压；哪些属性替换、何时选哪一行由服务器决定，不能声称完全公平化。

## 4. 匹配与机器人：从入口到赛季结果

### 4.1 玩家看到的队伍路径

【实现】玩法目标以 `main/sub_target` 定义人数、模式、开放与 `need_robot`。客户端的组队自动匹配、正式匹配、状态查询和手动加电脑是不同请求；赛季匹配成功由 `season_match_succ_s2c` 触发成功界面。[玩法目标](../analysis/data/team_target_main.json)、[组队网络](../reverse/lua-decompiled/game.module.team.manager.network.network.lua)、[赛季网络原字节码](../reverse/lua-bytecode/lua6_573512/game.module.season.manager.network.network_8258935832480552082.bin)

【配置】PVE 203/207/401/209/409/219 模式的 `need_robot=1`；自由房 501 为 0，但另有手动 `team_add_bot_c2s`；赛季 2v2/3v3 未写 `need_robot` 字段。该字段不是“所有 PVP 只匹真人”的证明；赛季另有自己的 AI 对局参数。[机器人专题](robots.md)

### 4.2 新人对局与机器人兜底

【配置】赛季表同时包含 `the_first_X_ai_pvp=5`、`the_first_X_games_ai=[5,1,1]`、前两场 AI 战斗 ID `[102010001,102010002]`、`pvp_match_fail_ai_time=180`、`newbie_match_time=[2500,5000]` 和 12 个机器人角色 ID。[赛季杂项](../analysis/data/season_misc_season_misc.json) 【设计意图推断】首局保障对局可开始、可学习操作，并有队列等待兜底。**执行条件、计时单位与当前服开关未证实**；不能写成“每个账号前 5 场必定人机，180 秒必补”。

【配置】赛季奖杯给机器人单独的胜负杯分：2600 档人机 25/10 对应普通 50/20；3100 档人机 15/6 对应普通 30/15；4100 档人机 8/6 对应普通 15/10。[奖杯表](../analysis/data/season_cup_season_cup.json) 【设计意图推断】把低摩擦 AI 对局与真实竞技进度区别计价，减少刷人机冲杯分的收益。人机身份判定仍是服务器侧。

### 4.3 AI 的战斗风格如何区分

自由房有 9 个职责×2 档 AI 的 18 行陪练员；机器人计划表有 91 行指定武器、宠物、被动/主动技能候选；AI 模板 23 行给可见/不可见目标下的力度/角度样本、目标策略与位移/闪避参数。`visible_power` 样本首位常合计 10000，可能是权重，但采样算法未在客户端闭合。[自由房机器人](../analysis/data/free_battle_robot_free_battle_robot.json)、[机器人配装](../analysis/data/robot_plan_robot_plan.json)、[AI 参数](../analysis/data/ai_ai.json) 【设计意图推断】先用职责定义可学习的对手类型，再用配装与样本参数产生风格差异；聊天触发另有 210 行，只承担表现层。[聊天触发](../analysis/data/robot_tactic_talk_trigger.json)

## 5. 赛季、任务与商业化回流

赛季有双进度：杯分阶段与 ELO。`season_cup` 给段位、星级、胜负分、弱队修正和人机分；`pvp_elo` 给 16 个分数段的 K 系数与赛季重置值：1000 分 K=50/重置 1000，2000 分 K=20/重置 1500，3200 分 K=10/重置 2100。[杯分](../analysis/data/season_cup_season_cup.json)、[ELO](../analysis/data/season_pvp_elo_pvp_elo.json) 【设计意图推断】杯分负责可见奖励与段位反馈，ELO 调节匹配强度；但具体配对公式与修正顺序在服务器。

日常活跃度奖励 20/40/60/80/100，赛季 PVP 每日奖励次数 3，形成每日参与目标；七日签到分服投放首周资源；通行证 21 天、每周经验上限 10000，形成跨周目标。[外围经济专题](economy.md) 抽取以 10/80 次品质保底和部分 40/60/200 次专项保底提供长期目标，但不同池/解锁互不等同，不能把表中所有保底合为单池承诺。[保底表](../analysis/data/gacha_guarantee_gacha_guarantee.json)

## 6. 一条可复盘的玩家旅程

1. **首日**：任务以 `open_func/jump_id/target_num` 引导开放系统；进入低门槛 PVE 或赛季入口；推荐角度帮助第一次打中目标。赛季 AI 新手参数存在，但是否触发看服务器。
2. **完成一局**：玩家用角度、力度、风和技能做回合选择；服务端回节点与结算；胜负影响杯分/任务进度，奖励类型按玩法与每日次数校验。
3. **回主界面**：任务活跃度累计到宝箱档，拿到货币和材料，投入角色属性、武器、宠物或宝石；配装再改变下一局可用技能和伤害结构。
4. **持续数日**：七日签到、通行证周上限和赛季重置构成不同周期；开服天数和等级门槛把部分武器阶级延后，避免前期内容一次消耗完。

这条旅程的**流程节点**有客户端证据，节点之间“玩家一定先做哪项”和实际奖励触发由服务器与账号数据决定；它是策划结构复原，不是录屏观察记录。

## 7. 实施级规则清单与待证项

| 模块 | 已能写入设计案的规则 | 仍需服务器/回包才能闭合 |
| --- | --- | --- |
| 战斗 | 发炮字段、客户端轨迹分支、技能校验、服务端节点回放 | 最终伤害公式、取整与随机、胜负裁定顺序 |
| 成长 | 等级点数与上限、武器/宠物阶段、技能变体、PVP 平衡候选值 | 资源扣除的权威校验、当前服采用哪份分片 |
| 匹配 | 目标人数、组队请求、AI/机器人配置、赛季人机杯分 | 排队分桶、AI 插入准确阈值、胜率或连败保护 |
| 经济 | 活跃里程碑、任务参数、通行证周期、分类型抽取保底 | 实际卡池概率、计数继承、商品实时上下架与价格 |

任何进一步的“排位机器人概率”“伤害公式精确乘区”“实际卡池出货率”，应通过相应服务端代码或脱敏回包统计验证，再升为确定规则。完整证据分散在[局内计算](combat-math.md)、[技能](skills.md)、[机器人](robots.md)、[成长数值](growth-numbers.md)和[经济](economy.md)五页，原始资源与提取物均保留在仓库。
