# 局外经济与留存：任务、抽取、通行证

本页按玩家一天的资源路径还原配置：**进入游戏 → 做任务与竞技 → 领取活跃奖励 → 投入养成/抽取 → 周期性重置**。这是版本 242 的策划结构推断，不代表当前服所有活动同时开放。原始数值均可从 [配置来源清单](../analysis/data/manifest.json)追到字节码。

## 每日任务如何组织资源回流

任务表按服务器分片 `_0/_543` 各 80 行，字段包括 `sub_task_tp`、`target_num`、`open_func`、`condition_args`、`jump_id`、`task_award` 和 `liveness`。因此一条任务同时定义**玩家要做什么、功能开放条件、跳转入口、直接奖励和活跃度**，不是纯文案列表。例：任务 `1031012` 需目标数 4，关联功能 26，跳转 `MoonBoxMainView`；`1031013` 目标数 1、功能 6、`cid=401`，跳转公会副本组队入口。[基础分片任务表](../analysis/data/tasks_tasks_0.json) 任务文案在语言表，实际完成进度由服务器维护。

活跃度宝箱为 20/40/60/80/100 五档。[活跃度表](../analysis/data/task_liveness_task_liveness.json) 其中 20 档按类型 1/2 分别给货币 `1001010001` 数量 5,000,000 / 500,000；40 档两种类型均给 `1402010001×2000`；60 档给 `1205010001×20`；80 档两类奖励不同；100 档给 `1001010004×100`。**设计解释**：把玩家从一次性任务推进到多任务累积，最后一档给稀缺货币。类型 1/2 的具体人群/服别须从服务器选择规则确认，不能只抄较高值当每日保底。

七日签到在 `_0` 和 `_543` 分片的第 3–7 天奖励不同。基础分片第 5 天为 `1605010040×1 + 1001010004×100`，543 分片为 `1150012016×1 + 1019010001×100`；第 7 天也有不同的核心物品。[基础分片](../analysis/data/seven_sign_seven_sign_0.json)、[543 分片](../analysis/data/seven_sign_seven_sign_543.json) 前两天不在这两份分片中，不能误写成活动只有五天。**设计解释**：同一留存框架按服务器单独投放养成资源。

## 抽取：付费点、保底和愿望

装备扭蛋分片 `_0` 的 ID 102 配置 `cost_item_list=[[1405030001,1]]`，池 `[102]`，开放条件 `[[2,17,999]]`，同时给若干抽取入口/次数配置 `act_type=[[1,1],[1,10],[4,20],[6,50]]`。[扭蛋入口](../analysis/data/gacha_gacha_0.json) 这些数组的业务枚举须在调用处分解，不能直接说 20 抽价格 4 元等。

[保底表](../analysis/data/gacha_guarantee_gacha_guarantee.json)将保证层叠起来：

| 保底类型 / ID | 周期 `loop_num` | 目标品质 / 文案 |
| --- | ---: | --- |
| 类型 1 / 1 | 10 | 紫色及以上组件，`quality=4` |
| 类型 1 / 2 | 80 | 橙色及以上组件，`quality=5` |
| 类型 3 / 4–6 | 每 3 次 | 池等级 1–5 保 3 品质、6–10 保 4、11–999 保 5 |
| 类型 1 / 7、9 | 200 | 神器之心，`quality=6`，解锁条件不同 |
| 类型 1 / 8、10 | 60 / 40 | 红武，`quality=5`，解锁条件不同 |

这些是**分类型保底规则**，不能叠成“每 10 抽必紫、每 40 抽必红”的全局规则；对应卡池、解锁、计数继承仍需跟服务器抽取回包核对。`gacha_wish` 的愿望配置还包括品质 5 行 `wish_up_percent=10000`、品质 6 行 `5000` 等，可能用于定向提升，但不能把 `5000` 直接宣布为 50%出货率。[愿望表](../analysis/data/gacha_wish_gacha_wish.json)

`gacha_misc` 给首次/第二/第三次成本 `1001010001×1/2/3`、刷新成本 `1001010001×100`、切换 UP 消耗 `1001010003×200`、广告刷新次数 2、`auto_refresh=18400`。[抽取杂项](../analysis/data/gacha_misc_gacha_misc.json) 这里的成本很可能属于某个预抽或刷新子玩法，不能直接套到装备扭蛋 ID 102；报告保留为独立经济节点。

## 商店是按货币与开放功能分层

[商店分类](../analysis/data/shop_class_shop_class.json)共 46 行。首个大类 `type=1` 的子页货币组合包括 `1001010003/0004/0001`、单独 `1001010005` 等，开放功能分别列 `4601`、`4609`、`4607` 等；`type=2` 则使用 `1001010013/0014`。从结构可还原“先由系统开放决定入口，再按货币用途拆商品池”。[商品分片 `_0`](../analysis/data/shop_shop_0.json) 23 行、[`_543`](../analysis/data/shop_shop_543.json) 28 行，存在 `price`、`original_price`、`discount`、`before_id` 链和 `get_item` 多物品礼包。不能因为客户端字段叫 `discount` 就直接按数字展示真实折扣，需核对 UI 格式与服务器商品状态。

## 通行证与赛季节奏

通行证配置 `battlepass_exp=1000`、`battlepass_week_exp_limit=10000`、`battlepass_fix_days=21`、`battlepass_lv_price=100`、付费提示时间 `6`。[通行证杂项](../analysis/data/battlepass_misc_battlepass_misc.json) 通行证入口 17 行，既有免费/付费解锁类型，也有 `pay_id` 或货币 `price`；例如类型 3 价格 `1001010004×980`。[通行证入口表](../analysis/data/battlepass_common_battlepass_common.json) **设计解释**：21 天周期叠每周经验上限，鼓励连续多周完成任务，付费线和等级购买提供补齐路径。具体“1000 经验升 1 级”需验证通行证等级表，这里不能由字段名直接定论。

赛季侧另有 `pvp_reward_times_daily=3`、`initial_elo=1000`、`initial_cup=1000`、`init_cup=800`、`partitioned_star=25` 等多条参数。[赛季杂项](../analysis/data/season_misc_season_misc.json) 其中同时存在 `initial_cup` 与 `init_cup`，意味着不同规则/阶段或旧新配置并存，报告不能任意选一个作为“初始杯分”。赛季奖杯、ELO、继承分别见[奖杯阶梯](../analysis/data/season_cup_season_cup.json)、[ELO 阶梯](../analysis/data/season_pvp_elo_pvp_elo.json)；前 1000/2000/3200 分档 ELO K 系数为 50/20/10，赛季重置值为 1000/1500/2100。

## 资源环路的策划意图推断

1. **首周**：七日签到按天投放明确目标；新手任务引导跳转指定系统；前期对局通过机器人相关配置降低进入 PVP 的等待与挫败。[匹配与机器人](robots.md)
2. **每天**：任务给进度和活跃度，20→100 五档宝箱拉长会话；PVP 每日领奖次数限制把竞技与日常留存绑定。
3. **每周/每周期**：通行证 10000 周经验上限与 21 天固定周期限制一次性刷完；赛季奖杯/ELO 重置推动再次爬升。
4. **长期**：资源进入角色等级、宠物、武器、宝石和配装，而 PVP 平衡表对部分属性另行替换，形成“养成驱动选择与构筑，公平值约束纯面板差距”的结构。后半句是多张表组合的设计推断，具体模式的替换比例由服务端决定。[成长数值](growth-numbers.md)

## 模块策划案：每日任务与活跃宝箱

**资源入账时点。** 玩家先领取任务直接奖励，再由任务 `liveness` 累计日活跃度，跨 20/40/60/80/100 阈值后再领取五个宝箱。这是两次独立写操作：任务完成不应直接视为宝箱到账。每档的类型 1/2 奖励见[活跃度原表](../analysis/data/task_liveness_task_liveness.json)；20 档两类货币数量差 10 倍、80 档给不同物品，说明类型选择是重要运营条件。策划验证应以服务器当前类型为准，防止 UI 展示一种、领取另一种。[任务网络](../reverse/lua-decompiled/game.module.task.manager.network.network.lua)

**可计算但有限的预算。** 若类型 1 且五档全领，仅从宝箱可得 `1001010001×5,000,000`、`1402010001×2,000`、`1205010001×20`、`1405020001×5`、`1001010004×100`；类型 2 把第一项改为 500,000、第四项改为 `1413010001×5`。这不含任务直接奖、战斗奖、签到和活动奖，也不代表任何玩家每天必能达到 100 活跃。任务 1031012 需计数 4、任务 1031013 需计数 1，前者把玩家带去月亮宝箱，后者带去公会副本组队；任务的 `open_func` 与 `jump_id` 决定其和其他系统的承接。[任务表](../analysis/data/tasks_tasks_0.json)

## 模块策划案：商店与抽取

**商店交易链。** 分类表决定货币页、入口开放和商品展示；分服商品表决定 `price/original_price/discount/before_id/get_item`。玩家打开商店需先获取动态店铺信息，选择商品后校验货币、限购与前置，发送购买或批量购买，成功回包再扣货币/加商品/更新限购，失败则保留旧数据。`before_id` 表明有顺序购买候选，但其具体依赖校验仍需服务端确认；`discount` 不可不经格式化直接显示为百分比。[商店分类](../analysis/data/shop_class_shop_class.json)、[分片商品](../analysis/data/shop_shop_0.json)、[商店协议](../reverse/lua-decompiled/game.module.shop.manager.network.network.lua)

**抽取交易链。** 抽取前先读池、预览、心愿和保底状态；扣除本池指定资源并发 `gacha_spin_c2s`，收到 `gacha_spin_s2c` 后再展示结果并同步计数/背包。10 次紫、80 次橙是保底类型 1 的规则行；类型 3 的每 3 次品质线、类型 1 的 200 次神器之心和 60/40 次红武是其他规则行。各保底可能由不同池/解锁条件选用，不可合成一条全局抽卡承诺。`gacha_misc` 的首/次/三次费用和刷新费用属于另一个可见子流程，不能替代入口 102 的 `cost_item_list`。[扭蛋入口](../analysis/data/gacha_gacha_0.json)、[保底](../analysis/data/gacha_guarantee_gacha_guarantee.json)、[抽取杂项](../analysis/data/gacha_misc_gacha_misc.json)

**资源去向实例。** 技能 1001 升 1 级消耗 `1402010001×25 + 1001010001×1,000`，升 10 级对应行消耗 `400 + 10,000`，升 20 级行消耗 `4,000 + 90,000`。活跃 40 档给 `1402010001×2,000`，在物品 ID 相同且类型已确认的前提下，该档可覆盖上述任一单次材料成本，但这不表示可以直接从 1 级跳到 20 级，途中每级另有成本。玩家获取与消耗要按完整等级序列结算。[活跃度](../analysis/data/task_liveness_task_liveness.json)、[技能成本](../analysis/data/skill_base_upgrade_skill_base_upgrade_0.json)

## 模块策划案：签到、通行证和赛季周期

**签到。** 七日签到按日索引与服分片取奖励，基础服与 543 服第 5 天投放不同物品。登录、可领、已领三种状态应分开，跨日后重新计算，而不是把配置天数直接当作已连续签到天数。是否补签、断签重置及广告补领无法由这两张分片表确定。[基础分片](../analysis/data/seven_sign_seven_sign_0.json)、[543 分片](../analysis/data/seven_sign_seven_sign_543.json)

**通行证。** `battlepass_exp=1000`、`battlepass_week_exp_limit=10000`、`battlepass_fix_days=21` 构成周期和周上限参数；免费/付费/货币解锁行分别决定可领奖层。设计上任务发放通行证经验后，服务端核周上限与等级，再把可领奖状态投向 UI；升级、购买等级、购买付费线是不同写操作。`battlepass_lv_price=100` 为表内价格参数，货币/付款 SKU 需查具体入口行；不能把 1000 经验直接说成每级固定需求。[通行证杂项](../analysis/data/battlepass_misc_battlepass_misc.json)、[入口表](../analysis/data/battlepass_common_battlepass_common.json)

**赛季。** 排位每天 `pvp_reward_times_daily=3` 是参与奖励次数参数；赛季杯分、ELO 与段位奖励是独立进度。结算时先识别对手是否机器人、当前杯分档及可能的弱队修正，再由服务端写最终值；客户端只能据回包展示。重置与继承由赛季档期和 `season_reset` 等表控制，不能把配置中的 `initial_cup=1000` 与 `init_cup=800` 任意合并。[赛季参数](../analysis/data/season_misc_season_misc.json)、[杯分表](../analysis/data/season_cup_season_cup.json)
