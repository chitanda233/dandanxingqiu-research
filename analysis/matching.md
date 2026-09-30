# 匹配系统：目标、组队与成功回包

**机器人专题：**[机器人与 AI](robots.md)按 `need_robot` 逐模式列出补位字段，并拆开自由对战 18 行陪练、91 行配装和 23 行 AI 模板。静态配置不能替代服务器排位队列规则。

> 范围：研究客户端从选择目标到进入战斗前的请求与状态。匹配池、段位差扩圈和机器人填充属于服务端决策，不能从客户端常量推导出实战算法。

## 先分清三个“匹配”

代码里的“自动匹配”至少有三件不同的事：`team_auto_match_c2s` 用来寻找队伍/补人；`team_open_match_c2s` 是带 PvP 玩法目标的正式匹配请求；`team_match_stat_c2s` 请求某玩法的人数/容量统计。它们参数、回包和目标不同，不能合并成一条“点匹配”逻辑。见[队伍网络](../reverse/lua-decompiled/game.module.team.manager.network.network.lua#L211)、[自动匹配请求](../reverse/lua-decompiled/game.module.team.manager.network.network.lua#L529)、[匹配统计](../reverse/lua-decompiled/game.module.team.manager.network.network.lua#L741)。

```text
选择目标(type/target/arg)
    ├─ 单人：保存所选目标 → 正式 PvP/玩法匹配请求
    └─ 组队：创建/加入队伍 → 邀请或招募/自动补人
                   → 队员准备、队长发起 → 正式匹配请求
正式请求 → matching 状态 → 成功/取消回包 → 战斗加载
```

## 玩法目标是多级结构

[队伍枚举](../reverse/lua-decompiled/game.module.team.manager.const.lua#L30)将玩法主类 `target_main_type` 与具体 `target` 分开：有 PvP、PvE、赛季 2v2/3v3、自由房、塔、防守/副本和活动等枚举；PvP 目标类型又有 `match=2`、`pvp_2v2=3`、`pvp_3v3=4`。`team_create_c2s` 会构造 `type`、`target`、`arg`，同时带队伍条件与选项，见[创建队伍](../reverse/lua-decompiled/game.module.team.manager.network.network.lua#L286)。`team_update_target_c2s` 在已组队时向服务端发变更请求，单人时则保存所选目标并广播界面更新，见[更新目标](../reverse/lua-decompiled/game.module.team.manager.network.network.lua#L455)。

目标枚举不是开放清单。[`is_team_target_open`](../reverse/lua-decompiled/game.module.team.manager.data.data.lua#L1979)和 [`team_target`](../reverse/lua-decompiled/auto_gen.package_include.config.team_target.main.lua)显示客户端还检查目标条件；`team_misc` 另有 `team_target_open_3V3` 字段。当前服是否开放 3v3 或某活动仍需服务器状态。

## 队伍状态、队员状态及房间条件

| 维度 | 客户端枚举/状态 | 用途与注意 |
| --- | --- | --- |
| 本人身份 `role_status` | `normal=0`、`teammate=1`、`captain=2`、`matching=3` | 单人、队员、队长和匹配中不是同一种状态。 |
| 队伍 `team_status` | `normal=0`、`recruiting=1`、`matching=2`、`fighting=3` | 招募、正式匹配和战斗期分离。 |
| 队员 `teammate_status` | `none=0`、`ready=1`、`in_fight=2` | “准备”是队员状态，可与队伍是否招募/匹配并存。 |
| 组队条件 | 职业、段位、杯数、密码；另有同职业人数限制常量 | 这些是队伍入队条件/房间设置，不等于服务器匹配池过滤公式。 |
| 自由房 | 开放/密码、平衡与否、地图、环境、行动时间等设置枚举 | 自定义房间是另一种建房模型，不能与排位匹配规则混淆。 |

上述值来自[队伍常量](../reverse/lua-decompiled/game.module.team.manager.const.lua#L3)及[队伍数据](../reverse/lua-decompiled/game.module.team.manager.data.data.lua#L1657)。队伍数据还提供“所有成员已准备”“成员上限”“是否满员”“当前是否招募/匹配/战斗”的独立查询，说明客户端在发起前确实要区分队伍人数与准备情况，但具体是否允许未满员起排、谁能强制开排，仍应看对应模式和服务器回包。

## 从建队到正式匹配的消息链

| 阶段 | 请求/回包 | 能确认的载荷或后续动作 |
| --- | --- | --- |
| 同步队伍 | `team_info_c2s` / `team_info_s2c` | 刷新队伍主体与角色信息。 |
| 建队/变更 | `team_create_c2s`、`team_update_target_c2s` | 请求有目标三元组；建队还可带 `condition`、`options`。 |
| 邀请/申请 | `team_invite_c2s`、`team_apply_c2s`、对应处理回包 | 邀请与申请各有列表、处理和通知链。 |
| 招募/自动补人 | `team_open_recruit_c2s`、`team_auto_match_c2s`，可分别停止 | 自动补人请求目标包含 `type`、`target`、`arg`、`extend_type`；成功回包改本地自动匹配状态。 |
| 准备 | `team_ready_c2s`、`team_cancel_ready_c2s` | 队员准备与取消有独立请求；部分赛事房间有准备前校验。 |
| 正式开排 | `team_open_match_c2s`、`team_stop_match_c2s` | PvP 请求设置玩法 `type`、`target`、`arg`；服务端队伍状态可进入 matching。 |
| 结果/取消 | `season_match_succ_s2c`、`team_cancel_match_s2c` 等 | 赛季成功回包打开 `MatchSuccessView` 并广播成功；取消回包可提示队长或队员取消。 |

建队、邀请、招募和匹配请求在[队伍网络 280–544](../reverse/lua-decompiled/game.module.team.manager.network.network.lua#L280)；准备/开排在[同文件 181–225](../reverse/lua-decompiled/game.module.team.manager.network.network.lua#L181)；成功视图在[赛季网络 174](../reverse/lua-decompiled/game.module.season.manager.network.network.lua#L174)；取消提示在[队伍网络 1194](../reverse/lua-decompiled/game.module.team.manager.network.network.lua#L1194)。反编译的部分发送函数变量名损坏，但消息名称和参数结构可以交叉核对。

## 配置值：记录存在，含义有限

[`team_misc`](../reverse/lua-decompiled/auto_gen.package_include.config.team_misc.team_misc.lua#L5)含 `team_recruit_amount=6`、`team_recruit_refresh_cd=10`、`team_match_life=300`、`team_match_auto_note=15`、`team_match_cd=1`、`match_diff=2`、`max_apply_amount=30`、`apply_life=60`、`recruit_life=300`。这些字段说明招募、申请、匹配存在计数/寿命/冷却参数，但没有服务器对应实现时，不能把 `team_match_life=300` 直接写成“每次最长等待 300 秒”，也不能把 `match_diff=2` 写成“最多跨两个段位”。

[`ranked_match_misc`](../reverse/lua-decompiled/auto_gen.package_include.config.ranked_match_misc.ranked_match_misc.lua#L12)还含 2v2 跨服天数、3v3 目标开放、平衡属性等字段。它们可能影响模式入口或数值处理，但仍不能解释实际匹配池分层。排位 2v2/3v3 的队伍容量、跨服条件和当前开放日期都应在动态服务端数据里确认。

## 机器人与匹配算法的证据边界

客户端确实存在 `team_add_bot_c2s`、机器人识别查询、[`free_battle_robot` 配置](../reverse/lua-decompiled/auto_gen.package_include.config.free_battle_robot.free_battle_robot.lua#L4)，但这组证据只能说明自定义/自由战斗等场景支持机器人对象。**不能据此断言排位等待到某秒就填机器人**。隐藏分、实力加权、扩圈半径、胜率控制、跨服池规则、是否允许人机混排均无可复原的服务端算法。能明确描述的仅是客户端“提交目标 → 状态/统计更新 → 成功或取消回包 → 载入战斗”的链路。

> 本版按Lua元表展开有效默认值，并用原指令/受控执行复核关键分支。详细规则和全量明细在下方；当前服开放与服务器最终裁定不由静态表替代。
<!-- DESIGN_DETAIL_BEGIN -->

## 匹配准入设计：开放、时间、养成与队伍

### 目标对象与人数

队伍主类 `pvp=1/pve=2/season_2v2=10/season_3v3=13/custom=14`；主类和子目标必须联合解释。例如 `[type=1,target=2,arg=0]` 是普通 PvP 匹配目标，主类2的 target2不能据同一个数字解释成相同玩法。单人选择保存在本地目标；已组队变更发送 `team_update_target_c2s`。发起匹配、找队友和查询人数分别是三个请求。数据对象至少包括目标、本人身份、队伍状态、成员列表、准备状态、队伍条件和房间选项。[队伍常量原指令](../reverse/lua-disassembled/game.module.team.manager.const.txt)

### 排位时间限制不是一条统一禁排时段

原代码有两个独立检查：

1. `check_match_time_before_match`：完成新手配置最大场次后，在服务器时间 **00:00–06:30（含端点）** 返回提醒标记。外层 `_check_start_match` 收到该标记会广播在线人数较少提示，随后继续养成检查；它本身没有禁止请求。
2. `check_need_time_limit` 联合杯数和场次决定是否适用闭排；`check_is_in_time_limit` 再比较 **04:30–05:30（含端点）**。配置杯数阈值1600，单人需 `cup>1600` 且 `fight_num≥新手最大场次`。组队逐成员读取资料，任一成员同时满足杯数和场次条件时即可适用。新服豁免比较的是“当天04:30−24小时”与服务器开服时间，不是随意按当前开服天数取整。

示例：普通分片最大新手场次11，杯数1600的玩家不满足严格大于门槛；1601杯且fight_num11的老玩家可能适用凌晨闭排。00:30会进入低人数提醒，但不在04:30–05:30闭排区间。提醒与禁止必须在界面和请求流程中区分。[提醒原指令](../reverse/lua-disassembled/game.module.team.manager.target.pvp.txt#L838)、[闭排资格原指令](../reverse/lua-disassembled/game.module.team.manager.target.pvp.txt#L361)、[时段配置](../analysis/data/rank_define_normal.json)

### 养成落后弹窗是可继续的软检查

`char_rating_check` 未开放，或正在使用演示构筑时，直接通过。其余遍历21条 `character_rating` 中 `is_pvp_suggest=1` 的条目；条件类型2传入功能ID调用 `is_server_day_open`，不是把第二项直接当“第几天”。取得当前评分及比较评分，type2还改用推荐评分接口。评分0进入“未激活养成”列表；非零但小于比较评分10%进入“大幅落后”列表。存在未激活项时优先展示它们，列表按sequence排序，弹窗有“继续”和“今日不再提示”，继续回调再发匹配请求。

所以“某模块不足推荐值10%”不是强制匹配门槛，也不证明服务器隐藏分直接使用该评分。客户端的文案指向无法使用系统独有机制，解释了为什么即使存在公平属性，仍会提示补养成。[实际判定](../reverse/lua-disassembled/game.module.team.manager.target.pvp.txt#L932)、[养成检查配置](../analysis/data/character_rating_character_rating.json)

## 新手匹配设计：场次、预设与奖励展示

客户端初始化队伍数据时取 `season_newbie` 所有有效行 `max` 的最大值，缓存为最大新手场数。普通分片11，543分片8；543另4条事件行的min/max均0，不会增加这个上限。

下一场奖励显示使用 `fight_num+1` 和角色等级查新手行；查到就按 `preset_id` 读取 `preset_rank_battle.reward` 并追加经验资源，查不到则展示普通排位每日奖励。普通配置第8场是preset109、第9场是108，不能按行号直接拼preset编号；543的第1–8场是301–308，事件条目311–314分别关联1004/1002/1015/1016。下方列全场次、战斗组引用和资源名称。[最大场次计算](../reverse/lua-disassembled/game.module.team.manager.data.data.txt#L898)、[排位奖励选择](../reverse/lua-disassembled/game.module.team.manager.target.pvp.txt)、[57条预设战斗](../analysis/data/preset_rank_battle_preset_rank_battle.json)

确定的是**客户端有逐场预设与展示规则**；不能据奖励显示函数认定新手11场全部是机器人，是否强制选预设、敌方身份和最终奖励仍由开排/战斗回包决定。旧 `the_first_X_ai_pvp=5` 是另一组参数，不应该覆盖这套实际被客户端调用的场次表。

## 两条队列的操作与状态契约

| 玩家操作 | 请求含义 | 状态结束点 |
| --- | --- | --- |
| 自动找队友 | `team_auto_match_c2s` 携目标与extend_type | 自动找人回包/停止自动找人 |
| 正式开始比赛 | `team_open_match_c2s` 携目标三元组 | 成功、取消或失败通知 |
| 查询队伍量 | `team_match_stat_c2s` | 仅更新统计展示 |
| 队员准备 | `team_ready_c2s` | 个人ready字段更新 |
| 队长取消 | `team_stop_match_c2s` | 队伍matching退出的回包 |
| 新手强开 | `req_team_force_open_match_c2s` | 特殊强开请求；客户端调用明确传`type=2,target=2,arg=0` |

新手强开是特殊接口；不能因为type2就把它和普通PvE目标处理合并。正式成功 `season_match_succ_s2c` 打开成功视图，局内开始另等战斗进入消息。取消动画、成员ready、队伍matching和场景已载入都不是同一状态。[新手强开](../reverse/lua-disassembled/game.module.season.manager.core.txt#L4235)、[网络处理](../reverse/lua-luadec/game.module.team.manager.network.network.lua)

## 模式参数对匹配后体验的约束

排位102的有效配置为技能1、自动战斗0、调速0、总时限3600、伙伴数0、MVP1、保证发炮0、quick_angle1、intelligent_force1；frame_rate60、show_result_delay500。此前“排位很多字段缺省”已被默认继承还原纠正。103保证发炮1，501自由竞技技能/自动1且时限7200，502海选技能1/自动0/保证发炮1。它们改变战斗操作与结束表现，不能直接推出服务端队列的扩圈算法。[有效玩法表](../analysis/data/gameplay_gameplay.json)

## 服务端尚缺的设计部分

该缓存没有匹配池执行器，无法给出隐藏分权重、段位扩圈半径、排队每秒增量、连胜连败控制或机器人兜底命中率。本页已复原客户端具体准入、提示、场次查表和消息流程；原始等待参数放在机器人页，不用单位未闭合的180强写“180秒必补机器人”。

## 可查的配置明细

### 新手场次与预设奖励：分片 0

[有效配置原表](../analysis/data/season_newbie_season_newbie_0.json)。已展开元表默认值；“未配置”仅表示有效行仍无该字段。

| 行 | 已配置场次范围 | 角色等级 | 预设 | 弹弓预设 | 玩法/战斗组/权重 | 经验字段 | 普通预设奖励 | 事件条件 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 1–1 | 1–50 | 101 | 201 | [[102,10210,10000]] | 100 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 2 | 2–2 | 1–50 | 102 | 202 | [[102,10211,10000]] | 200 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 3 | 3–3 | 1–50 | 103 | 203 | [[102,10212,10000]] | 200 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 4 | 4–4 | 1–50 | 104 | 204 | [[102,10213,10000]] | 1000 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 5 | 5–5 | 1–50 | 105 | 205 | [[102,10214,10000]] | 1000 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 6 | 6–6 | 1–50 | 106 | 206 | [[102,10215,10000]] | 1000 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 7 | 7–7 | 1–50 | 107 | 207 | [[406,40603,10000]] | 1000 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 8 | 8–8 | 1–50 | 109 | 209 | [[102,10217,10000]] | 1000 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 9 | 9–9 | 1–50 | 108 | 208 | [[102,10216,10000]] | 1000 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 10 | 10–10 | 1–50 | 110 | 210 | [[102,10218,10000]] | 1000 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 11 | 11–11 | 1–50 | 111 | 211 | [[406,40604,10000]] | 1000 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |


### 新手场次与预设奖励：分片 543

[有效配置原表](../analysis/data/season_newbie_season_newbie_543.json)。已展开元表默认值；“未配置”仅表示有效行仍无该字段。

| 行 | 已配置场次范围 | 角色等级 | 预设 | 弹弓预设 | 玩法/战斗组/权重 | 经验字段 | 普通预设奖励 | 事件条件 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 1–1 | 1–50 | 301 | 401 | [[102,31001,10000]] | 100 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 2 | 2–2 | 1–50 | 302 | 402 | [[102,31002,10000]] | 200 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 3 | 3–3 | 1–50 | 303 | 403 | [[102,31003,10000]] | 300 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 4 | 4–4 | 1–50 | 304 | 404 | [[102,31004,10000]] | 500 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 5 | 5–5 | 1–50 | 305 | 405 | [[102,31005,10000]] | 1000 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 6 | 6–6 | 1–50 | 306 | 406 | [[102,31006,10000]] | 1000 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 7 | 7–7 | 1–50 | 307 | 407 | [[102,31007,10000]] | 1000 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 8 | 8–8 | 1–50 | 308 | 408 | [[102,31008,10000]] | 1000 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | {} |
| 9 | 0–0 | 1–50 | 311 | 409 | [[102,31011,10000]] | 1500 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | [[1,1004]] |
| 10 | 0–0 | 1–50 | 312 | 410 | [[102,31012,10000]] | 1500 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | [[1,1002]] |
| 11 | 0–0 | 1–50 | 313 | 411 | [[102,31013,10000]] | 1500 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | [[1,1015]] |
| 12 | 0–0 | 1–50 | 314 | 412 | [[102,31014,10000]] | 1500 | 武器扭蛋币（1405020001）×1；弹弹积分（1010010001）×50 | [[1,1016]] |


`gameplay_list` 第二项是战斗组引用；本表没有把它冒充 `battle.id`。弹弓预设奖励应再按其独立 preset ID 读取。关联表：[有效配置原表](../analysis/data/preset_rank_battle_preset_rank_battle.json)。
