# 外围系统：入口、任务与资源回流

**长期养成的细表：**[角色、宠物、武器、宝石与排位公平值](growth-numbers.md)；[技能与被动触发](skills.md)。这些数据来自原始字节码重新导出的 JSON。

**策划规则复原：**[逆向策划设计案](design-spec.md)给出玩家主循环、日/周节奏和各系统的前后依赖；[经济与留存](economy.md)细拆任务、活跃度、抽取保底和通行证。

> 范围：本页研究玩家离开战斗后的“看见入口 → 解锁 → 做任务/领取 → 购买或抽取 → 回到养成与战斗”。所有开放等级是缓存版本的客户端提示；当前服状态由服务端与角色数据决定。

## 结论与主循环

游戏外围并非一张功能菜单，而是三层：主界面把武器、技能、玩法入口和队伍放在底部；日常、商店、福利放在右上；`open_func` 决定入口能否显示/点击，并持续刷新红点。任务、赛季、商店和扭蛋将战斗产出及领取行为引回角色与武器养成。这个路径可由[底部配置](../reverse/lua-decompiled/game.module.main_view.manager.config.bottom_btn_config.lua#L79)、[右上配置](../reverse/lua-decompiled/game.module.main_view.manager.config.right_up_config.lua#L34)、[功能常量](../reverse/lua-decompiled/game.module.open_func.manager.const.lua#L5)及[任务网络](../reverse/lua-decompiled/game.module.task.manager.network.network.lua#L15)交叉确认。

```text
主界面入口与开放检查 → 玩法/队伍/战斗 → 服务端结果
                         ↓                ↓
                    主线、日常、赛季 ← 任务进度与结算
                         ↓
                 活跃度、段位、商店、扭蛋
                         ↓
                   等级/武器/技能/宠物培养
```

## 入口层：哪些操作通向哪里

| 位置与模块 | 客户端可确认的行为 | 证据 |
| --- | --- | --- |
| 底部 `weapon` | 打开武器子面板，带对应红点；新手特定流程会挡住入口。 | [底部配置 79–101](../reverse/lua-decompiled/game.module.main_view.manager.config.bottom_btn_config.lua#L79) |
| 底部 `skill` | 打开技能子面板；入口有独立红点。 | [底部配置 128–151](../reverse/lua-decompiled/game.module.main_view.manager.config.bottom_btn_config.lua#L128) |
| 底部 `entrance` | 打开玩法集合面板。 | [底部配置 152–177](../reverse/lua-decompiled/game.module.main_view.manager.config.bottom_btn_config.lua#L152) |
| 底部 `team` | 读取当前目标、是否组队和队员人数，进入/退出队伍子场景。 | [底部配置 177 起](../reverse/lua-decompiled/game.module.main_view.manager.config.bottom_btn_config.lua#L177) |
| 右上 `daily` | 跳转 `TaskDailyView`，检查日常功能 ID，绑定日常任务红点。 | [右上配置 34–55](../reverse/lua-decompiled/game.module.main_view.manager.config.right_up_config.lua#L34) |
| 右上 `shop` | 打开 `ShopView`，检查商店功能 ID，接入商店红点。 | [右上配置 56–78](../reverse/lua-decompiled/game.module.main_view.manager.config.right_up_config.lua#L56) |
| 右上 `welfare` | 打开 `WelfareMainView`，开放判断交由福利模块。 | [右上配置 79–108](../reverse/lua-decompiled/game.module.main_view.manager.config.right_up_config.lua#L79) |

公会、好友、家园、装扮和称号可从[功能 ID 表](../reverse/lua-decompiled/game.module.open_func.manager.const.lua#L5)及 `reverse/lua-bytecode/manifest.json` 的独立模块名确认“客户端包含入口/代码”。本次未逐个追到领取规则，因此不把它们写成已完成的资源闭环，更不据此断定当前服全部开放。

## 功能开放：配置提示和实时状态是两层

[`open_func` 管理器](../reverse/lua-decompiled/game.module.open_func.manager.core.lua#L148)的 `is_open` 返回客户端当前掌握的开放布尔值；`is_server_day_open` 显式比较开服天数。主界面按钮自身仍会调用开放检查并显示未开放提示。功能表既有等级条件，也有开服日、头衔/分支和服务端开关字段；只按等级画一条解锁线会误导。

| 功能 ID | 客户端提示/条件 | 解释 |
| --- | --- | --- |
| `3601` 扭蛋 | 角色 2 级 | 早期开启的获取入口。 |
| `2235` 武器升星 | 角色 6 级 | 武器升星比更多后期系统更早出现。 |
| `23` 日常任务、`1901` 排行榜 | 角色 10 级 | 日常和排行都被放在早期中段。 |
| `5901` 战令 | 角色 18 级 | 任务/赛季之外再提供一条奖励进度。 |
| `1801` 宠物 | 开服第 2 天且角色 25 级 | 同时具有时间和角色条件，不能只看等级。 |
| `2208` 武器强化 | “士兵Ⅲ”头衔 | 头衔条件不是简单等级值。 |

以上 ID 的名称来自[功能常量](../reverse/lua-decompiled/game.module.open_func.manager.const.lua#L5)，提示与条件来自[开放配置](../reverse/lua-decompiled/auto_gen.package_include.config.open_func.open_func.lua)及分片配置。配置的部分嵌套表因反编译失真，不进一步宣称多条件的精确优先级。客户端存在服务端开放回包与角色级功能状态，因此本表是“提示样本”，不是当前账号开放列表。

## 任务：主线、日常和活跃度分开运行

[任务枚举](../reverse/lua-decompiled/game.module.task.manager.const.lua#L8)区分主线 `main=102`、支线 `zhixian=2`、日常 `daily=3`、公会日常 `alliance_daily=104`、战令 `battle_pass=21` 等任务类型。任务状态区分可接、已接、可领、失败、完成；奖励状态另分未领、可领、已领。日常任务配置中普通日常上限值为 5，公会日常为 3；这是客户端配置项，不能推定每天一定刷新相同任务数。

任务初始化会请求主线、支线、主线阶段信息；达到相应开放条件后再请求战令、活跃度和其他活动任务。见[任务管理器初始化请求](../reverse/lua-decompiled/game.module.task.manager.core.lua#L100)。协议把 `task_info_c2s`、提交 `task_commit_c2s`、日常活跃度信息/奖励、周奖励和主线阶段奖励分开，回包更新任务数据和红点，见[任务网络](../reverse/lua-decompiled/game.module.task.manager.network.network.lua#L76)。因此玩家做完一个行为后，可能先得到任务状态更新，再出现手动领取入口；“达成”和“入账”不是同一客户端状态。

[`task_liveness`](../analysis/data/task_liveness_task_liveness.json)有 20、40、60、80、100 五档活跃度门槛，奖励嵌套数组已从原始字节码直接导出。`task_daily_liveness_reward_c2s` 与 `task_daily_week_reward_c2s` 分别指向日/周领取链，见[任务网络](../reverse/lua-decompiled/game.module.task.manager.network.network.lua#L88)。

## 商店、扭蛋与赛季怎样接上循环

| 系统 | 可确认的客户端闭环 | 仍需核对 |
| --- | --- | --- |
| 商店 | 拉取店铺信息、购买/批量购买、物品数量回包、订阅/店铺更新；购买成功后本地状态和红点可更新。见[商店网络](../reverse/lua-decompiled/game.module.shop.manager.network.network.lua#L8)。 | 实际商品、价格、支付与限购由服务器和活动状态决定。 |
| 扭蛋 | 先请求信息/心愿/预览，再发 `gacha_spin_c2s`，收 `gacha_spin_s2c`；还有预览刷新与抽取。见[扭蛋网络](../reverse/lua-decompiled/game.module.gacha.manager.network.network.lua#L16)。 | 配置中 `pre_gacha_num=3`、`forgive_gacha_num=2` 等字段不能单凭名称写成公开概率或保底次数。 |
| 赛季 | 请求赛季信息和个人信息、领取段位/赛季杯数奖励、处理战斗结果；回包驱动数据和红点。见[赛季网络](../reverse/lua-decompiled/game.module.season.manager.network.network.lua#L20)。 | 赛程、当前赛季、奖励到账及结算由服务器确认。 |

扭蛋[静态配置](../reverse/lua-decompiled/auto_gen.package_include.config.gacha_misc.gacha_misc.lua#L5)还出现预览刷新、广告刷新和资源消耗字段。它说明此系统存在多种操作入口，但只靠本缓存不能核定实时抽取概率。战令[配置](../reverse/lua-decompiled/auto_gen.package_include.config.battlepass_misc.battlepass_misc.lua#L4)有经验、购买 ID、周期和周经验上限字段；应与赛季、日常任务视为不同进度线。

## 玩家可见流程与研究边界

玩家大概率经历“主界面提示未开/开放 → 选择玩法或养成入口 → 战斗/任务状态更新 → 红点提示可领取 → 领取或消费 → 数值再成长”。这个闭环是从入口、任务协议和养成协议串出的**结构性推断**，不是对某个账号的实测路径。当前版本具体按钮顺序、首次弹窗、任务刷新时间、全部奖励组成仍待服务器回包或录像验证。

## 模块策划案：主城入口与开放判定

**设计目标。** 主城承担“本次能做什么、完成后去哪里投入资源”的分发作用。底部把武器、技能、玩法和队伍作为常驻入口，右上把日常、商店、福利作为周期入口。按钮配置同时指定点击去向、开放 ID 和红点来源，所以同一个入口应区分 `隐藏/未开放可预览/可进入/有可领取内容` 四种展示状态，而不能只存一个是否开启的布尔值。这是依据[按钮配置](../reverse/lua-decompiled/game.module.main_view.manager.config.bottom_btn_config.lua)与[开放管理器](../reverse/lua-decompiled/game.module.open_func.manager.core.lua)整理的客户端设计状态；具体隐藏策略仍逐按钮决定。

**输入与流程。** 进入主城后读取角色等级、开服日、分服功能配置、功能状态和红点数据；点击入口时再次做开放检查。通过则进入对应面板，失败则按 `noOpenTips` 提示条件。`open_func` 的 `unlock_and`、`open_days`、`unlock_branch`、`is_open` 分别是不同维度，不应把其中一个字段单独解释成最终可进入。客户端收到开放状态变化后，入口及任务跳转都要重新计算。[基础分片](../analysis/data/open_func_open_func_0.json)和[543 分片](../analysis/data/open_func_open_func_543.json)各导出 21 条覆写记录；它们只覆盖部分功能，不是全量开放表。

**阶段实例：星图挑战中心。** 功能 560201 的文案是“开服第 2 天且达到 25 级”，560202 是第 3 天/30 级，560203 是第 4 天/35 级，560204 是第 5 天/38 级。若玩家第 3 天达到 30 级，客户端可把前两段当作满足静态门槛，后两段仍提示未来条件；最终进入还要看服务端开放状态和前置分支。543 分片为星图总入口 5601 额外配置预览奖励 `1001010004×20` 和 `ispreview=1`，说明同一系统在不同服可能出现不同预览层。[两份开放覆写](../analysis/data/open_func_open_func_0.json)、[543 分片](../analysis/data/open_func_open_func_543.json)

## 模块策划案：任务追踪与领取

**状态模型。** 每条任务至少区分条件进度、任务可提交状态和奖励领取状态。配置字段 `target_num` 决定本地展示的目标量，`open_func` 决定是否出现/可跳转，`jump_id` 决定“前往”按钮的目标，`task_award` 是静态奖励候选，服务器任务信息才是当前进度真值。完成一次玩法后应先由任务回包更新进度，达到目标显示可提交/可领，再由 `task_commit_c2s` 或对应奖励请求使道具入账。[任务表 80 行](../analysis/data/tasks_tasks_0.json)、[任务状态枚举](../reverse/lua-decompiled/game.module.task.manager.const.lua)、[任务协议](../reverse/lua-decompiled/game.module.task.manager.network.network.lua)

**具体实例。** 任务 1031012 的 `target_num=4`、`open_func=26`、`jump_id=MoonBoxMainView`：前往按钮引到月亮宝箱，重复计数达到 4 后再按任务状态领取。任务 1031013 的 `target_num=1`、`open_func=6`、`cid=401`，目标是公会副本组队入口。这里 `cid=401` 是条件参数，不可自动当成完成一次副本的要求；精确计数事件由任务类型处理器/服务端决定。关闭入口或跳转失败时保留任务进度，不应把前往失败解释为任务失败。

**活跃度二级奖励。** 活跃度不是任务直接奖励的同义词：任务配置累计 `liveness`，随后跨越 20/40/60/80/100 五个阈值，玩家再单独领取宝箱。导出的[活跃度表](../analysis/data/task_liveness_task_liveness.json)显示 20 档类型 1/2 分别是 `1001010001×5,000,000/500,000`，40 档均为 `1402010001×2,000`，60 档均为 `1205010001×20`，80 档分别为 `1405020001×5/1413010001×5`，100 档均为 `1001010004×100`。类型 1/2 的选择条件没有从客户端闭合，因此 UI 只能依据服务器给出的当前档奖励展示，不能把两类相加。

## 模块策划案：外围回流与异常分支

**消费承接。** 完成日常、活跃度或对局后，货币/材料变更驱动武器、宠物、技能等可升级红点；玩家进入商店购买、扭蛋抽取或养成面板时，每条写操作都要等对应 `s2c` 成功回包，再更新背包、次数、红点。购买失败、抽取失败、任务重复领取和功能临时关闭都保留上一次有效状态，具体错误码由服务器控制。[商店网络](../reverse/lua-decompiled/game.module.shop.manager.network.network.lua)、[扭蛋网络](../reverse/lua-decompiled/game.module.gacha.manager.network.network.lua)

**日会话脚本。** 一次可复原的标准会话是“进主城看开放入口 → 从日常任务跳玩法 → 对局完成触发任务回包 → 提交任务 → 活跃度跨档 → 领取档位奖励 → 投入技能/武器升级 → 再选择 PvP 或副本”。其中哪项任务先出现、是否自动提交、何时跨日刷新，均属于服务端日历与账号状态，不用静态表伪造固定时刻。
