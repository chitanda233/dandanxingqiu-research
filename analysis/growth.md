# 成长系统：角色、武器、技能与赛季

**具体数值请读：**[局外成长数值表](growth-numbers.md)列 133 级角色、100 级宠物、武器阶级和宝石成本的节点；[技能与数值](skills.md)列效果、CD、限次及说明冲突。两页均直接引用由字节码导出的配置 JSON。

> 范围：拆开“账号长期成长”“上阵构筑”“排位进度”三条线。客户端有大量预埋配置；本页只列在当前缓存可核对的字段与消息。

## 成长结构总览

| 进度线 | 主要变量 | 进入战斗/外围的作用 |
| --- | --- | --- |
| 角色等级和属性点 | `level`、`exp`、`base_attrs`、`attr_points` | 提供基础属性与功能开放门槛。 |
| 武器与装备 | 拥有、穿戴槽位、强化、升星、技能、评分 | 决定构筑和武器相关能力。 |
| 技能与宠物 | 技能等级/消耗、宠物经验/属性 | 扩展局内行动或属性；具体模式可限制。 |
| 段位、杯数和赛季 | 段位节点、星级、杯数、赛季继承 | 竞技目标和奖励进度，与角色等级并行。 |
| 战令/任务 | 战令经验、任务状态、活跃度 | 形成周期性奖励回流。 |

这些线不是一个“战力值”的不同名称。武器数据模块存在评分计算，但客户端同样保存穿戴状态与技能；赛季模块则单独保存 `rank`、`cup` 和赛季信息。见[武器数据](../reverse/lua-decompiled/game.module.main_weapon_develop.manager.data.data.lua)、[赛季数据](../reverse/lua-decompiled/game.module.season.manager.data.data.lua)。

## 角色等级：经验、属性与开放门槛

[`exp.player`](../reverse/lua-decompiled/auto_gen.package_include.config.exp.player.lua#L5)按等级列 `exp`、`day_max_exp`、`extra_attr_points`、`base_attrs`、`attr_points`、`attr_limit`。可直接读取的早期行有 1 级 `exp=0`、`attr_points=5`；2 级 `exp=100`、`attr_points=10`；3 级 `exp=200`。这说明角色升级会关联可分配属性点与基础属性，而非只增加显示等级。`day_max_exp` 在早期行可见 45,000，但这只是该表的字段，不推断实际每日经验封顶方式；角色数据仍应看服务端回包。角色字段定义见[`role_property`](../reverse/lua-decompiled/auto_gen.package_include.config.role_property.role_property.lua)。

等级还改变外围入口。扭蛋、武器升星、日常/排行榜、战令和宠物在[外围系统报告](systems.md#功能开放配置提示和实时状态是两层)列出客户端提示；宠物还带开服天数，武器强化提示的是头衔条件。玩家早期成长可概括为“先开放获取与日常，再拓展构筑”，但具体升级速度无法用静态表直接算出，因为经验获得与日上限需要服务器规则。

## 武器：获得、穿戴、强化、升星的分工

[武器数据模块](../reverse/lua-decompiled/game.module.main_weapon_develop.manager.data.data.lua)维护武器拥有情况、穿戴位置、星级、评分和可升星状态。[武器网络](../reverse/lua-decompiled/game.module.main_weapon_develop.manager.network.network.lua#L19)将不同操作拆为独立消息：位置/穿戴 `weapon_pos_info`、`weapon_wear`、`weapon_remove`；强化 `weapon_strengthen`；升星 `weapon_star_up`；另有武器精通和羁绊相关 `weapon_master`、`weapon_bond`。这种分工意味着“拥有武器”和“当前装备它”“把它升星”分别更新不同状态。

| 操作 | 请求字段或回包动作 | 证据 |
| --- | --- | --- |
| 武器穿戴/卸下 | 独立 c2s/s2c，成功后可触发引导/红点更新。 | [武器网络 215–305](../reverse/lua-decompiled/game.module.main_weapon_develop.manager.network.network.lua#L215) |
| 武器强化 | 请求中可辨认 `items`、`is_use`、`use_type`；成功回包提供 `return_num`、`result`，然后广播强化事件。 | [武器网络 305–342](../reverse/lua-decompiled/game.module.main_weapon_develop.manager.network.network.lua#L305) |
| 武器升星 | 请求 `item_cid`、`up_num`；成功回包有 `item_cid`、`star`，客户端刷新解锁、可升星、评分和红点。 | [武器网络 343–390](../reverse/lua-decompiled/game.module.main_weapon_develop.manager.network.network.lua#L343) |
| 其他装备强化 | 独立 `equip_strengthen.lv` 表，而非武器强化同一表。 | [装备强化表](../reverse/lua-decompiled/auto_gen.package_include.config.equip_strengthen.lv.lua) |

[`weapon_strength`](../reverse/lua-decompiled/auto_gen.package_include.config.weapon_strength.weapon_strength.lua#L3)主要能读到强化级对应的功能 ID 和部分其他部位等级限制；不能从这里单独推出完整素材成本。[`weapon_star`](../reverse/lua-decompiled/auto_gen.package_include.config.weapon_star.weapon_star.lua)包含分级素材、货币、属性等多重嵌套数组，但反编译对这些数组的组合关系破坏明显，本页不把零散数字重组成“升星消耗表”。

## 技能与宠物：局外培养怎样受局内约束

[`skill_base_upgrade`](../reverse/lua-decompiled/auto_gen.package_include.config.skill_base_upgrade.skill_base_upgrade.lua)按技能与等级给出升级配置；[`pet_level`](../reverse/lua-decompiled/auto_gen.package_include.config.pet_level.pet_level.lua#L4)包含宠物经验、属性、`score_rate` 等字段。它们足以确认技能/宠物存在长期培养维度，但宠物具体技能能否进入每一种 PvP/PvE 需要按模式配置和单位状态判断。

局内[`unit_can_use_skill`](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.skill.core.lua#L170)并非只看是否拥有技能：它会检查技能原型禁用、CD、禁用类型和互斥技能；[`is_skill_cost_ok`](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.skill.core.lua#L315)另外检查消耗。新回合刷新技能状态，CD 在[`reset_unit_skill_cost_when_turn_round`](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.skill.core.lua#L841)中下降。因而“局外培养让角色具备某技能”不等于“任何回合都能立即使用”。具体数值平衡、禁用清单和各模式是否带入养成，在此快照不能统一断言。

## 竞技进度：段位节点、星级与赛季继承

[`ranked_match_rank`](../reverse/lua-decompiled/auto_gen.package_include.config.ranked_match_rank.ranked_match_rank.lua#L13)是离散段位节点表，不是简单的连续角色等级。可核对的早期路径为 `101 → 102 → 103 → 201 → 202 → 203 → 302 → 303 → 304 → 403 ...`；各行有 `next_id`、`last_id`、`rank_equal_star`，部分行还有 `star`、`rank_id`、`next_season_id`、`lose_protect_daily`。例如节点 101、102、103 的 `rank_equal_star` 为 0、1、2；201 为 3。至 901 行可见 `rank_equal_star=21`。这里使用配置 ID，不把本地化键猜成段位中文名。

赛季模块请求 `season_info_c2s`、`season_role_info_c2s`，个人回包更新玩家进度；领取段位奖励传 `rank_id`，领取赛季杯数奖励传 `cup`。匹配成功另有 `season_match_succ_s2c`。见[赛季网络](../reverse/lua-decompiled/game.module.season.manager.network.network.lua#L59)。[`ranked_match_misc`](../reverse/lua-decompiled/auto_gen.package_include.config.ranked_match_misc.ranked_match_misc.lua#L12)有参与奖励次数 3、胜利奖励次数 2、基础经验字段 343，以及 2v2 平衡属性限制字段。它证明该模式有参与/获胜奖励配置及平衡参数，但不证明当前服的领取次数、属性换算或赛季规则与静态表完全相同。段位奖励表、赛季奖励回包分别见[段位奖励配置](../reverse/lua-decompiled/auto_gen.package_include.config.ranked_match_rank_reward.ranked_match_rank_reward.lua)和[赛季网络](../reverse/lua-decompiled/game.module.season.manager.network.network.lua#L268)。

## 周期性回流与成长节奏

日常活跃度分为 20/40/60/80/100 五档，[任务专题](systems.md#任务主线日常和活跃度分开运行)说明了“任务完成 → 状态更新 → 领取”的分离。战令[`battlepass_misc`](../reverse/lua-decompiled/auto_gen.package_include.config.battlepass_misc.battlepass_misc.lua#L4)中能读到 `battlepass_exp=1000`、`battlepass_week_exp_limit=10000`、`battlepass_fix_days=21`，这些是表内数值，不应直接当作当前档期长度或玩家每周一定拿满的经验。外围经济还含商店/扭蛋，对应购买和抽取均有服务器回包，不能仅由静态成本表推算获取效率。

## 尚不能回答的关键问题

缺少在线玩家状态和完整服务端实现，因此未确认：实际升级所需/获得经验的计量方式、每级属性点在战斗中的系数、武器升星各阶准确消耗、某个 PvP 模式是否全部平衡装备与宠物、赛季重置实际日期和分段保护规则。客户端字段 `next_season_id`、`lose_protect_daily` 是明确存在的，但需要服务器行为才能解释为具体结算规则。

## 模块策划案：角色等级与属性分配

**目标与输入。** 等级提供功能解锁、基础属性模板和可分配属性点，是长期进度的主索引。经验变化来自结算/任务等服务器发放；角色回包确定当前等级与未分配点数。`exp.player` 的 `attr_points` 为该等级对应总量：1 级 5、10 级 50、50 级 250、100 级 500；单一属性上限为等级×3。可把“当前未分配点数”设计为总获得点数减已分配点数，但必须计入重置、活动加点和 50 级行 `extra_attr_points=50` 等例外，不能拿该差值反推真实账号。[133 级配置](../analysis/data/exp_player.json)

**操作与反馈。** 玩家升级时刷新等级、经验进度、基础属性、可用点数和新开放入口；分配属性点时先展示预览，成功回包后扣点并更新角色面板/评分。若单项触达 `attr_limit`，输入应被阻止或提示上限。等级 50 的基础生命与等级 30 同为 120、等级 60 跳到 280，显示基础模板并非每级线性加法；角色最终生命仍需汇入装备和模式平衡。`day_max_exp` 是各级表字段，不能把它当成玩家实际的剩余额度。

## 模块策划案：武器从获得到战斗构筑

**状态和操作顺序。** 武器至少有背包实例、槽位穿戴、星级、强化、阶级、精通、羁绊和评分八个面向。玩家先获得实例，再按槽位穿戴；随后用材料发起强化/升星；每次成功都要重算该实例属性、阵容评分、可升级提示。穿戴和卸下是独立请求；强化提交 `items/is_use/use_type`，升星提交 `item_cid/up_num`，因此不能把“点一次升级”作为所有武器成长的统一 API。[武器网络](../reverse/lua-decompiled/game.module.main_weapon_develop.manager.network.network.lua)、[武器数据](../reverse/lua-decompiled/game.module.main_weapon_develop.manager.data.data.lua)

**前置关系。** `weapon_class` 六阶的等级/开服日双门槛依次为 1/1、60/62、75/124、85/186、95/248、105/310；`weapon_strength` 的 7、15、30 级还检查其他部位分别达到 4、20、82。拿到材料不等于可立即升级：应先显示缺少的等级、开服日、其他部位或素材条件。`weapon_amplification` 20 级在 `_0` 分片要求开服 7 天，在 `_543` 为 6 天，体现按服运营节奏覆写。详细属性节点见[成长数值页](growth-numbers.md)，配置本体见[阶级](../analysis/data/weapon_class_weapon_class.json)、[强化门槛](../analysis/data/weapon_strength_weapon_strength.json)、[放大分片](../analysis/data/weapon_amplification_weapon_amplification_0.json)。

**失败/材料处理。** 强化回包同时含 `return_num/result`，表明结果可能有退回或不同结果分支；客户端不能在请求发出时先扣除材料并宣称成功。`equip_strengthen.lv` 中 `success_max/luck_max` 是进度相关字段，尚不能换算成单次概率。升星回包给出新 `star` 后才刷新解锁、评分与红点。每个操作的素材消耗、失败返还和保底需查具体服务端回包，静态配置只提供输入候选。

## 模块策划案：技能、宠物与配装

**技能培养。** [`skill_base_upgrade` 905 行](../analysis/data/skill_base_upgrade_skill_base_upgrade_0.json)把解锁行和逐级行放在同一表。技能 1001 的解锁行 `1001000` 要求角色 22 级、物品 `1402020003×1`，并记 `is_casual_wear=1`；等级 1 行要 `1402010001×25 + 1001010001×1,000`，等级 10 行要 `400 + 10,000`，等级 20 行要 `4,000 + 90,000`。等级 40 行只有属性没有成本字段，说明缺字段不可当作免费升级。取得、升级、装备/上阵、局内可释放是四个状态；局内还受模式开关、CD、消耗和次数限制。[技能专题](skills.md)

**宠物培养。** 宠物有个体、等级、进化、天赋、技能学习等分线。等级 1/20/50/100 的生命模板为 27/111/338/1,156，等级 20 的进化上限可被下一阶段从 20 提至 25（具体 `pet_evo` 行需按宠物与次数查）。一次培养应先验证宠物实例与目标等级/进化前置，再提交资源消耗，回包后刷新宠物面板与编队。不能把等级模板直接加到所有 PvP 的最终属性；排位可能使用另一张平衡表。[宠物等级](../analysis/data/pet_level_pet_level.json)、[进化](../analysis/data/pet_evo_pet_evo.json)、[排位平衡](../analysis/data/ranked_match_balance_ranked_match_balance.json)

## 模块策划案：竞技成长与重置

**双轨进度。** 段位节点以 `ranked_match_rank.next_id/last_id` 串联；杯数和 ELO 则由 `season_cup` 与 `season_pvp_elo` 各自管理，不可混为同一分数。赛季个人信息回包更新段位/杯数；奖励领取又分段位 ID 与杯数请求。设计上一次竞技结算至少要分别处理胜负结果、杯数变动、ELO/段位状态、每日领奖次数和可领取奖励，不能仅显示“升星+1”。[段位表](../analysis/data/ranked_match_rank_ranked_match_rank.json)、[杯分表](../analysis/data/season_cup_season_cup.json)、[赛季网络](../reverse/lua-decompiled/game.module.season.manager.network.network.lua)

**公平化边界。** `ranked_match_balance` 有 288 行替换属性，第一行角色生命/攻击/防御为 1,568/570/335，宠物为 297/614/346。进入某模式时若服务器选择了平衡行，战斗计算应读取模式化属性而非角色页的原面板；离开战斗后局外实例成长仍保留。确切选行键与替换顺序未闭合，不把第一行当作全服统一公平值。[排位平衡表](../analysis/data/ranked_match_balance_ranked_match_balance.json)
