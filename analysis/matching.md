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

## 模块策划案：玩法目标与准入

**目标数据模型。** 一次匹配选择保存 `type/target/arg`，先由 `team_target.main` 的主类、子目标决定入口与模式，再映射 `play_type` 去读 `gameplay`。目标行还含 `min_count/max_count`、`need_apply`、`open_func` 和展示字段。以主类 PvP 的子目标 2 为例，映射 `play_type=102`，人数为 1–2，配置 `need_apply=1`；这说明该入口支持单人或双人发起，但是否要等另一人、是否可补位仍看队伍和服务器规则。[目标表](../analysis/data/team_target_main.json)、[玩法表](../analysis/data/gameplay_gameplay.json)

**玩家流程。** 选目标时先做开放及人数校验；单人可直接进入正式匹配链，组队则先建队/入队、修改目标、邀请或招募、队员准备，再由队长开排。队伍处于 `recruiting` 时展示找人状态，`matching` 时展示排队并允许符合规则的取消，`fighting` 时转局内。身份 `captain` 与 `teammate` 要显示不同操作；队员“准备”只说明其个人状态，不能当作整个队伍匹配成功。队员退出、目标变更、队长转移都应使准备校验重新执行；具体强制取消结果由服务端回包确认。[队伍状态枚举](../reverse/lua-decompiled/game.module.team.manager.const.lua)、[队伍网络](../reverse/lua-decompiled/game.module.team.manager.network.network.lua)

## 模块策划案：两条队列和结果处理

**队友补齐。** `team_auto_match_c2s` 带目标和 `extend_type`，作用于当前队伍的补人过程；它可以和招募/申请并行，但回包仅能说明自动找队友的状态。`team_match_stat_c2s` 是人数/容量统计查询，不是加入队列操作。正式对战由 `team_open_match_c2s` 发起，并由停止请求、取消通知或成功回包结束。[自动补人](../reverse/lua-decompiled/game.module.team.manager.network.network.lua#L529)、[人数统计](../reverse/lua-decompiled/game.module.team.manager.network.network.lua#L741)

**成功路径。** 玩家点击开始 → 客户端发送目标三元组 → 队伍状态变为匹配中 → `season_match_succ_s2c` 打开匹配成功视图 → 战斗载入。成功前的重复点击应由本地状态防抖，成功后的载入失败/重连需交给战斗模块恢复，不能自行视作获胜或扣除对局次数。取消回包区分队长或队员取消并通知相应 UI。[赛季成功回包](../reverse/lua-decompiled/game.module.season.manager.network.network.lua#L174)、[取消处理](../reverse/lua-decompiled/game.module.team.manager.network.network.lua#L1194)

## 模块策划案：排位、自由竞技与机器人入口

| 场景 | 配置能直接说明 | 匹配设计含义与缺口 |
| --- | --- | --- |
| 排位 `play_type=102` | `guaranteed_fire=0`，其余多数字段缺省 | 不能从缺省字段认定不允许技能或自动战斗；实际规则必须和模式继承及服务端比对。 |
| 3V3 排位 `103` | `guaranteed_fire=1` | 此模式配置了保证发炮，需在局内超时分支解释；不能推出机器人补位。 |
| 自由竞技 `501` | `time_limit=7200`、技能和自动战斗均为 1、不可调速 | 与排位分属不同队列/房间玩法，战斗自动化不等于匹配自动补人。 |
| 锦标赛海选 `502` | `time_limit=3600`、技能 1、自动战斗 0、保证发炮 1 | 赛事入口有更严格的自动战斗/超时设置；报名、轮次由赛事服务端决定。 |

[完整玩法配置](../analysis/data/gameplay_gameplay.json)的缺省字段不能统一补 0。`season_misc` 的 `the_first_X_ai_pvp=5`、`newbie_match_time=[2500,5000]`、`pvp_match_fail_ai_time=180` 说明赛季另有新手 AI 和等待兜底参数，但缺少选择/计时执行器，无法形成“等 N 秒填机器人”的已验证规则。[赛季参数](../analysis/data/season_misc_season_misc.json)

## 可复核的验收场景

1. 选择 102 单人/双人入口，核对 `type/target/arg` 和人数上下限；未开放或人数超限时不能发正式开排请求。
2. 队员未准备、队长取消、队员离队、目标变更，分别记录本地状态与 `s2c` 后的状态；不能靠按钮动画判定排队结果。
3. 实测首次 5 场与普通场的成功回包、等待时间和结算对象，才能确认 AI 参数是否在当前服启用；杯数必须区分机器人与真人专用字段。[机器人专题](robots.md)
