## 成长对象设计：账号、物品、实例与战斗输入

| 对象 | 持久状态 | 升级或切换入口 | 进入战斗的方式 |
| --- | --- | --- | --- |
| 角色 | level、经验、基础属性、点数方案 | 经验回包/加点 | 基础模板＋配点；模式可替换 |
| 武器 | 所有权、位置、星级、强化、计划 | wear/remove/strengthen/star_up | 武器技能、属性、被动及当前计划 |
| 通用技能 | 基础ID等级、计划槽位 | up/wear/onekey_up | 转具体cf_skill_id，检查持有 |
| 宠物 | pet_id、c_id、level、进化、天赋、技能、配点 | up_level/break_through/roll等 | 实例属性＋模式继承/平衡 |
| 宝石/装备 | 品质、级、词条、部位、强化状态 | 升级、合成、镶嵌/穿戴 | 属性、被动、套装机制 |
| 竞技 | cup、rank、star、score、赛季ID | 对局结算/领奖 | 入场模式规则，非永久角色等级 |

同一词“升级”背后是不同索引和请求，不能用一条通用培养按钮逻辑复刻。宠物pet_id是实例，c_id是品种配置；武器item_cid是配置对象，pos是穿戴位置；技能基础ID不是具体战斗技能ID。

## 角色成长：总点数、单项上限与模板

exp.player给133级完整行，attr_points=等级×5，五项基础上限=等级×3，额外点字段50在有效行继承存在；不能说只在50级发一次，也不能说每级再发50。基础生命在1/30/50/60级为40/120/120/280，60级之后多个字段沿用默认值而点数继续增长，故不是“每级基础生命线性增加”。exp字段60/100/133级均4,104,920，旧报告缺字段已纠正。它是查表值；最终经验来源、上限和暂停等级以服务器数据为准。[完整数值页](growth-numbers.md)

配点的策划作用是总预算与单项上限同时约束。例如50级250点，单项上限150，不可能把全部250点只投一个属性；已经分配、未分配与额外来源仍由实例余额决定。普通属性转换表体质61可转换生命28/防御0.3/速度0.3，力量62转攻击1；排位平衡表又有独立trans_values_pvp，不能直接把普通换算用于竞技。[普通转换](../analysis/data/attr_trans_attr_trans.json)、[排位平衡](../analysis/data/ranked_match_balance_ranked_match_balance.json)

## 武器培养：穿戴、强化、升星与计划

### 获取/穿戴与强化并行

weapon_pos_info回包初始化位置列表、解锁/开放、评分与可升星字典，并刷新默认计划、热门/推荐计划；weapon_wear发送list，weapon_remove发送pos。换上新武器后默认计划也随位置数据更新；当前计划和推荐计划不是凭UI排序自动生效。[武器网络](../reverse/lua-luadec/game.module.main_weapon_develop.manager.network.network.lua)

强化请求weapon_strengthen携items/is_use/use_type，回包使用return_num和result更新强化状态并广播结果；不能由按钮点击自加一级。强化材料投入、结果、返还以及可强化红点分别维护。失败码返回提示且不进入成功状态。30级强化门槛还受其他部位与open_func控制，门槛表见数值页。

### 升星改变技能，不仅是评分

weapon_star_up请求item_cid/up_num，成功后更新星级、解锁、评分、可升星缓存并广播旧星/新星。3664行按武器与星给cost_shards、cost、attrs、skill、init_skill、init_ps和characteristic，属性和机制可以一起变。例1101011011在star0与1两行均配碎片10/金币5000；star1属性攻击2/防御1，skill2101011、init_skill3334011。必须按这把武器的确切阶段查，不把任意行的碎片数当所有武器统一升星成本。

精通由weapon_master_info/master回包的lv单独维护，羁绊由bond_id请求单独激活。它们与武器星级共同影响面板，却不是同一个“总强化等级”。武器class_up目前6条示例开服99999/角色999，是明显不可达门槛；存在表不意味着这6种转换在线开放。[升星](../analysis/data/weapon_star_weapon_star.json)、[精通](../analysis/data/weapon_master_weapon_master.json)、[转换门槛](../analysis/data/weapon_class_up_weapon_class_up.json)

## 宠物培养：经验、突破、洗练、技能与方案

### 等级与突破交替推进

up_level与break_through是不同请求，均带pet_id。pet_level是100级经验/属性模板，pet_evo按c_id＋times提供level_limit、role_level_limit、break_through_list、主动/被动技能。示例c_id10010的times0上限20，times1上限25、加生命13/防御8/攻击12；不能仅备好升级经验就无视当前突破上限。解散resolve提交实例list，进化表另给resolve_item_list，不把喂经验与分解返还混用。

### 洗练和学技能是两段操作

pet_roll请求产生候选，pet_confirm_roll再携pet_id/is_cancel接受或取消。学习技能请求pet_id/skill_id/flag，独立pet_confirm_skill_learn携op确认。装备洗练也有roll/confirm_roll、extra_roll/confirm_extra_roll、amulet相关成对接口。因此“预览出新词条”与“实例已换词条”必须分状态保留；随机覆盖概率仍在服务端，不能据有确认按钮就认定100%保留旧技能。[宠物网络](../reverse/lua-luadec/game.module.pet.manager.network.network.lua)

五个学习槽要求等级10/20/30/40/50，解锁材料1618010001分别1/2/3/4/5。这两道门槛分别是等级资格与槽解锁，不是达到50级就免费五槽全开。pet_skill_learn169条定义书ID、技能、品质和互斥类型；同名低/高级技能用确切ID比较。

### 加点方案与战斗属性

请求支持add_point、unlock/set/change/reset_point_plan与rename；方案属于该宠物的可切换构筑。point2attr将点数乘固定转换值，叠加等级曲线转换，再乘69号属性倍率和目标属性增减倍率；详细公式与算例在数值页。普通继承与attr_base_Inherit_pvp分开配置，例如三月兔10121普通生命/攻/防系数800/7500/7500，PVP5000/10000/10000；不能只看面板继承得出排位宠物属性。

## 赛季成长：杯、星、评分、首达与重置

season_cup53节点保存基础真人/机器人杯分、弱队修正、日失败保护、首达奖励和inherit_id；season_rank27节点另保存星、score_max、score_cost、相邻节点、win_star/lose_star和对局玩法池。ELO16档又有elo_K与season_reset。三表同时存在，不等于当前每种赛季都叠算三套分；要按实际赛季入口读取对应数据。

低档1100/1700配置lose_cup0、lose_add_cup100、lose_protect_daily6，体现失败也可能推进的配置；高档如4400是真人胜15/负10、人机胜8/负6、无日保护，inherit_id3500。首达奖励只按已领取状态发放，不把每次回到同一档都算首达。重置还对指定物品配置transform_item/transform_prop/reset_item_max_count，不仅改杯数。下方给所有杯节点与ELO档，具体弱队结算函数仍缺服务器证据。
