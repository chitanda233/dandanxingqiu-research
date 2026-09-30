# 局内流程：回合、弹射指令与结算

**本专题补充的深挖页：**[具体发炮字段、弹道和天气数值](combat-math.md)；[主动/被动技能与实测边界](skills.md)。战斗配置现由原始 Lua 字节码重新导出，[可直接检查全部 4,652 行战斗表](../analysis/data/battle_battle.json)。

> 范围：依据客户端状态机、战斗消息和战斗配置解释一局从载入到离开的过程。弹体命中与胜负结果以服务端消息为准；不同玩法复用基类但可以覆盖参数和入口。

## 一局的状态机

```text
匹配/关卡入口提供战斗参数
        ↓
enter → init_data → loading
        ↓ battle_enter_s2c
fighting（预览、回合、瞄准/蓄力、技能、发射、节点播放）
        ↓ battle_result_s2c / custom_result
ending（胜负、结果展示、MVP、退出）
```

[`base.enter`](../reverse/lua-decompiled/game.module.fight.manager.base.core.lua#L35)初始化定时器、场景根、数据、物理/时间线和网络，再切到 `loading`。[`init_data`](../reverse/lua-decompiled/game.module.fight.manager.base.core.lua#L137)接收 `room_id`、`play_type`、`cfg_battle_id`、玩法配置、战斗环境、行动时长和客户端类型等。服务端[`battle_enter_s2c`](../reverse/lua-decompiled/game.module.fight.manager.base.network.lua#L305)后进入 `fighting`；这个状态会安装触控、切预览态并准备战斗 UI，见[战斗基类 653 起](../reverse/lua-decompiled/game.module.fight.manager.base.core.lua#L653)。战斗结果进入 `ending`，见[结算模块](../reverse/lua-decompiled/game.module.fight.manager.base.ending.core.lua#L71)。断线恢复存在独立[重连模块](../reverse/lua-decompiled/game.module.fight.manager.base.reconnect.lua)，故正常初次进入与重连不能视为完全同一路径。

## 玩法配置控制同一套基础流程

[`gameplay` 配置](../reverse/lua-decompiled/auto_gen.package_include.config.gameplay.gameplay.lua#L24)可辨认 `partner_num`、`single_player`、`can_adjust_play_speed`、`time_limit`、`guaranteed_fire`、`use_skill`、`show_mvp`、`intelligent_force` 等字段。该表有默认值和多行玩法记录；不能把某一行的开关写成全模式规则。例如默认区块 `guaranteed_fire=0`，而战斗回合代码明确在特定模式 `guaranteed_fire==1` 时才尝试超时自动发射。因此局内“能否使用技能”“超时怎么办”“是否显示 MVP”“是否可调速”应按具体玩法读取。

## 新回合由服务器给出行动主体与时间

[`enter_new_round`](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.round.core.lua#L186)读取回包中的 `turn`、`round`、`round_stime`、`wind`、`action_list`。客户端保存回合号、起始时间和当前攻击者列表，处理上一回合清理、时间同步；对可行动单位重置 `round_fired`、发射信息和技能消耗状态。`action_list` 被断言存在，说明谁在本回合行动来自消息而非客户端随意挑选。[战斗网络](../reverse/lua-decompiled/game.module.fight.manager.base.network.lua#L317)有 `battle_next_round_s2c` 接收链。

风力处理不是简单读一个 UI 数字。[`raw_set_round_wind`](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.round.core.lua#L384)先把回包风值乘 `0.1` 存为 `cur_wind`，再乘战斗表的 `wind_power_factor` 与 `weather_factor` 形成 `wind_factor`。因此风力提示和实际弹道因子之间有配置换算，不能直接把回包整数当物理风速。

## 玩家行动：瞄准、蓄力、技能和发射

| 环节 | 客户端行为 | 证据 |
| --- | --- | --- |
| 发射前 | `can_req_fire_start` 检查是否可开火；开始蓄力会停移动、标记本回合已操作，并带回合号与 `force_speed` 请求；取消蓄力单独发 `is_cancel=true`。 | [发射模块 77–113](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.fire.core.lua#L77) |
| 角度和力度 | 模块持有武器角度限制、推荐角度、发射角度和力度变换逻辑；最终发射前同步单位位置并触发发射前效果。 | [发射模块 954–1182](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.fire.core.lua#L954)、[请求发射 160](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.fire.core.lua#L160) |
| 技能前置 | 检查技能是否存在/禁用、CD、互斥和消耗；局内还可按回合刷新消耗/CD。 | [技能模块 170–335](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.skill.core.lua#L170)、[回合刷新 841](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.skill.core.lua#L841) |
| 发送指令 | 发射指令带 `round`、`type=1`、`angle`、`force`、位置/方向；技能指令带 `round`、`type=2`、`cf_skill_id`。 | [指令网络 18–63](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.cmd.network.lua#L18) |

发射请求[`req_fire`](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.fire.core.lua#L160)在控制单位存在且可发射时才继续，之后标记 `round_fired`、记录发射角度与方向；这只说明客户端已提交动作，命中与伤害仍待服务器节点。技能不是单一按钮，部分技能会互斥/禁用其他技能；具体技能效果需继续拆技能原型表，不在本专题凭函数名推定。

## 服务器节点怎样驱动弹体与回合表现

[`battle_seq_cmd_s2c`](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.cmd.network.lua#L64)收到批次结果时会拼接 `node_list`；只有所有批次到齐才继续解析。随后按指令类型分流：`1` 发射、`2` 技能、`3` 特殊弹体、`100/101` 其他/移除类指令，见[分流逻辑](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.cmd.network.lua#L115)。发射解析会收集弹体节点、换算节点力度，并把处理节点加入回合队列，见[发射解析](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.cmd.network.lua#L196)。弹体飞行与命中表现另由[弹体模块](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.bullet.core.lua)和[回合表现模块](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.round.perform.lua)处理。这里能确定“客户端提交动作 → 服务端回节点 → 客户端按序表现”的结构；具体伤害公式、碰撞权威和反作弊策略不能从这些消息分支完全还原。

## 倒计时、超时与跳过

客户端仅在当前控制单位是本回合攻击者，且未挂机/自动战斗时显示行动倒计时，见[`is_show_round_count_down`](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.round.core.lua#L941)。超时尝试保底发射的前提更严格：当前不是抛物线发射状态、玩法配置 `guaranteed_fire==1`、功能开放、单位可发射、没有正在蓄力/已有发射角度；之后筛掉死亡、隐藏、宠物、同阵营、隐身目标，再寻找推荐力度并发射。见[`try_to_ensatory_fire_on_round_time_out`](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.round.core.lua#L961)。如果不满足条件，另有[`unit_can_pass_round`/`req_pass_unit_round`](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.round.core.lua#L850)的跳过回合请求链。不能把所有超时概括为“自动开枪”。

## 结算与退出

服务端 `battle_result_s2c` 或自定义结果回包写入 `fight_result_msg` 并调用 `stop_fight`；若此时仍在 loading，会延后停止，否则切入 ending。见[结算模块 71–94](../reverse/lua-decompiled/game.module.fight.manager.base.ending.core.lua#L71)。`is_win` 对比 `fight_result_msg.win_camp_id` 与 `self_camp`，这证明胜负不是客户端自己由当前画面血量重算，见[结算模块 516](../reverse/lua-decompiled/game.module.fight.manager.base.ending.core.lua#L516)。ending 中再按玩法选择结束动作，可能有结果面板、MVP 动画、等待与退出，见[结束动作](../reverse/lua-decompiled/game.module.fight.manager.base.ending.core.lua#L146)。最终奖励发放和排位增减由服务器结算/外围赛季回包决定；客户端的结果面板配置只是展示。

## 仍未还原的部分

本次没有完整还原所有战斗配置、弹体技能原型和服务器战斗实现；一些反编译函数内部有未定义临时变量。故本页不宣称准确的弹道公式、操作时限常数、伤害结算公式、回合胜负触发阈值或各模式完整战斗差异。可确定的是状态切换、关键消息字段、可发射与可用技能校验、服务器节点驱动表现、超时分支的条件和服务端胜负回包。
