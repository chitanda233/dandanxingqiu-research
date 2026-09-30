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
