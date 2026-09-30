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

[`gameplay` 配置](../reverse/lua-decompiled/auto_gen.package_include.config.gameplay.gameplay.lua#L24)可辨认 `partner_num`、`single_player`、`can_adjust_play_speed`、`time_limit`、`guaranteed_fire`、`use_skill`、`show_mvp`、`intelligent_force` 等字段。该表有默认值和多行玩法记录，现已展开元表继承，70行有效矩阵见下方；不能把某一行的开关写成全模式规则。例如默认区块 `guaranteed_fire=0`，而战斗回合代码明确在特定模式 `guaranteed_fire==1` 时才尝试超时自动发射。因此局内“能否使用技能”“超时怎么办”“是否显示 MVP”“是否可调速”应按具体玩法读取。

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

本次已还原客户端普通抛物线与逐帧物理轨迹、默认行动时长配置和多个玩法覆盖项，详见[局内计算](combat-math.md)；服务端最终伤害、命中和胜负阈值仍未闭合。反编译部分函数有未定义临时变量，不将客户端预览公式当作权威判定。

> 本版按Lua元表展开有效默认值，并用原指令/受控执行复核关键分支。详细规则和全量明细在下方；当前服开放与服务器最终裁定不由静态表替代。
<!-- DESIGN_DETAIL_BEGIN -->

## 一局的执行设计：状态与可操作权限

### 战斗对象的输入与生命周期

进入数据包含room_id、play_type、cfg_battle_id、玩法/关卡/环境配置、行动时长与客户端类型。room_id标识本次战斗，cfg_battle_id标识规则模板；同模板重复打不能复用上一局round/技能计数。进入时创建定时器、场景根、物理/表现时间线、网络并切loading；收到battle_enter后切fighting。fighting内部还区分预览、attack等状态，与外围队伍的fighting枚举是不同对象。

服务端在加载期就回结果时，客户端保留结果并延后stop_fight；结束不能抢在加载状态初始化前执行。重连走独立恢复模块而非假设第一回合，恢复时需使用已有回合与战斗快照。退出要拆UI、触摸、网络监听和定时器，不能只换场景。[原始基类指令](../reverse/lua-disassembled/game.module.fight.manager.base.core.txt)、[重连](../reverse/lua-disassembled/game.module.fight.manager.base.reconnect.txt)

### 回合开始的输入与重置

`battle_next_round_s2c` 包含turn、round、round_stime、wind、action_list。turn/round分别保存，action_list决定可行动单位；客户端不能自行按阵营轮换。单位进入自己的行动回合后重置round_fired、发射信息、回合技能次数及普通技能CD；单局all_count保留。`round_stime` 与服务器时间用于时钟，倒计时不是从UI出现起另计15秒。

默认行动参数15只是兜底；自由房可选10/15/20，战斗记录还可用act_time覆盖。示例battle102010001的act_time是30000、angle65、quit_type2、env_filter[8]，说明新手特例可以和普通默认不同。act_time在此保留原字段，不与time_limit3600混成一个倒计时。[回合](../reverse/lua-disassembled/game.module.fight.manager.base.fighting.round.core.txt)、[战斗表](../analysis/data/battle_battle.json)

## 发炮操作设计：开始、取消、提交、失败恢复

### 开始蓄力的六类检查

`can_req_fire_start`依次检查当前行动者、非自动战斗、fight_state=attack、非下落，以及forbid_round_action_buff_states逐项禁止状态。通过后开始蓄力：停移动、round.oped=true、holding=true；请求带round、force_speed和is_cancel=false。取消蓄力走同一ready消息，is_cancel=true。[允许蓄力原指令](../reverse/lua-disassembled/game.module.fight.manager.base.fighting.fire.core.txt#L780)

“非下落”使单位落点/位置稳定成为输入前置；“当前行动者”和“attack阶段”区分了旁观与本回合操作。开始蓄力检查并不是所有发炮判定的全集：正式提交还要走其可发射检查和位置同步。

### 发炮提交的本地状态

正式req_fire先同步控制单位位置，触发before_send_fire_cmd效果和声波输入，再发指令；本地round_fired=true，保存fire_angle/fire_direction，将all_fire_msg_received设false。这里标记的是已提交等待结果，不是已命中。保持holding、停止移动与实际发炮是三个动作，不能把开始蓄力当一次攻击计数。[发射原指令](../reverse/lua-disassembled/game.module.fight.manager.base.fighting.fire.core.txt)

### 请求失败要撤销哪些状态

失败恢复按固定顺序：round.oped=false→round_fired=false→清fire_angle和fire_direction→引导has_on_fired=false→取消holding动作→重新启动等待攻击计时器→发送ready取消，携当前round及重新计算的force_speed。

示例：玩家在本回合提交了70力度/50°后请求失败，UI不应该永久锁在“已发炮”。客户端会清待攻击信息、恢复等待，但是否还剩行动时间仍由回合时间决定；失败恢复并没有重开一个完整回合。此分支也没有在本地伪造伤害或额外奖励。[完整失败恢复](../reverse/lua-disassembled/game.module.fight.manager.base.fighting.fire.core.txt#L455)

## 一次行动如何变成表现队列

指令s2c可以拆成batch_index/batch_total；客户端合并node_list，等全部批次收齐才解析。type1普通发炮、type2技能、type3特殊弹体、type100/101其他弹体事件进入不同处理器。弹体节点按bullet_fly_time和_order排序，再交给回合表现。

这决定了“收到第一包”“看到子弹出膛”“命中动画”“生命同步”“当前行动结束”不能视为同一时间。分裂、连发、召唤和回弹可能形成多个节点，而不是点击一次只减一次HP。少一批时不能提前认为行动完整；最后一次爆炸动画结束也不能自行判胜。[命令原指令](../reverse/lua-disassembled/game.module.fight.manager.base.fighting.cmd.network.txt)、[回合表现](../reverse/lua-disassembled/game.module.fight.manager.base.fighting.round.perform.txt)

## 超时设计：保底发炮、跳过与自动战斗

普通手动操作者才显示行动倒计时；自动/挂机条件另判。超时保底要求guaranteed_fire=1、开放功能满足、单位可发炮、不在抛物线发射态、没有holding或已有fire_angle。候选过滤死亡、隐藏、宠物、同阵营、隐身单位，再尝试推荐力度。没有合法候选/解时不能写成“自动必命中”。排位102保底0，103和锦标赛502保底1；这是明确模式差异。

跳过使用unit_can_pass_round与req_pass_unit_round独立请求；自动战斗则用其状态/执行链。三者分别是主动放弃、超时补救、托管操作。不能让开启自动战斗后又允许普通手动技能重复抢操作。[超时与跳过](../reverse/lua-disassembled/game.module.fight.manager.base.fighting.round.core.txt)、[技能手动限制](skills.md)

## 结束设计：胜负、MVP、奖励与返回

结果回包写fight_result_msg，停止战斗并切ending；胜负比较win_camp_id与self_camp。show_mvp、结果面板类型、show_result_delay与结束动作由play_type决定。排位102的result_board_type[7,8]、show_result_delay500、show_mvp1是有效继承值，不能因为行内未写就说不存在。

MVP/结果页属于表现，金币、任务进度、宠物或杯数另等对应系统的更新。两个阵营都还有单位或本地HP暂未刷完时，也不能用画面抢先推翻已回的胜负。无法从客户端复原的仍是服务端最终结束条件和碰撞/伤害裁定；现有页把客户端完整生命周期与这些边界分开。

## 可查的配置明细

### 全部 70 个玩法的操作规则矩阵

[有效配置原表](../analysis/data/gameplay_gameplay.json)。已展开元表默认值；“未配置”仅表示有效行仍无该字段。

| 玩法 | 名称 | 伙伴数 | 技能 | 自动 | 保底发炮 | 调速 | 总时限原值 | MVP |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 101 | pvp测试 | 0 | 1 | 1 | 1 | 0 | 36000 | 1 |
| 102 | 排位赛 | 0 | 1 | 0 | 0 | 0 | 3600 | 1 |
| 103 | 3V3排位赛 | 0 | 1 | 0 | 1 | 0 | 3600 | 1 |
| 104 | 巅峰对决 | 0 | 1 | 0 | 0 | 1 | 3600 | 0 |
| 105 | 地狱足球 | 0 | 1 | 0 | 0 | 0 | 3600 | 1 |
| 106 | 公会讨伐-积分抢夺 | 0 | 1 | 0 | 0 | 1 | 7200 | 0 |
| 107 | 气球竞赛 | 0 | 1 | 0 | 0 | 0 | 3600 | 1 |
| 108 | 3V3排位赛-冠军赛 | 0 | 1 | 0 | 1 | 0 | 540 | 1 |
| 109 | 农场驱逐 | 0 | 1 | 0 | 0 | 1 | 3600 | 0 |
| 110 | 切磋 | 0 | 1 | 0 | 0 | 0 | 3600 | 0 |
| 111 | 矿场争夺 | 0 | 1 | 0 | 0 | 1 | 3600 | 0 |
| 112 | 常规锦标赛 | 0 | 1 | 0 | 1 | 0 | 360 | 1 |
| 113 | 公会争霸赛 | 0 | 1 | 0 | 1 | 0 | 3600 | 1 |
| 114 | 自定义战斗试玩 | 0 | 1 | 1 | 1 | 0 | 36000 | 1 |
| 115 | 变身大作战 | 0 | 1 | 0 | 1 | 0 | 3600 | 1 |
| 116 | 三角战线 | 0 | 1 | 0 | 1 | 0 | 3600 | 1 |
| 117 | 真假童话 | 0 | 1 | 0 | 1 | 0 | 3600 | 1 |
| 118 | 公会锦标赛单人对决 | 0 | 1 | 1 | 0 | 1 | 600 | 0 |
| 119 | 冰火战歌 | 0 | 1 | 0 | 1 | 0 | 3600 | 1 |
| 201 | pve测试 | 2 | 1 | 1 | 0 | 0 | 3600 | 0 |
| 202 | 主线副本 | 2 | 1 | 0 | 0 | 0 | 3600 | 0 |
| 203 | 冒险车站 | 0 | 1 | 1 | 0 | 1 | 3600 | 0 |
| 204 | 训练副本 | 2 | 1 | 0 | 0 | 0 | 3600 | 0 |
| 205 | 幻梦塔 | 2 | 1 | 1 | 0 | 1 | 3600 | 0 |
| 206 | 三测新手主线 | 0 | 0 | 1 | 0 | 0 | 3600 | 0 |
| 207 | 寻星奇遇 | 0 | 1 | 1 | 0 | 1 | 3600 | 0 |
| 208 | 疯狂厨房 | 0 | 1 | 1 | 0 | 0 | 3600 | 0 |
| 209 | 攻塔弹队 | 2 | 1 | 1 | 0 | 1 | 3600 | 0 |
| 210 | 弹弹大闯关 | 2 | 1 | 1 | 0 | 1 | 3600 | 0 |
| 211 | 金币副本 | 0 | 1 | 1 | 0 | 0 | 3600 | 0 |
| 212 | 年兽大作战 | 2 | 1 | 1 | 0 | 0 | 3600 | 0 |
| 213 | 四测新手战斗 | 0 | 0 | 1 | 0 | 1 | 3600 | 0 |
| 214 | 四测主线副本(数值玩法） | 2 | 0 | 1 | 0 | 1 | 3600 | 0 |
| 215 | 四测主线副本(技巧玩法） | 2 | 0 | 0 | 0 | 1 | 3600 | 0 |
| 216 | 武器试用 | 2 | 0 | 0 | 0 | 1 | 3600 | 0 |
| 217 | 2V2考核赛 | 0 | 0 | 1 | 0 | 1 | 7200 | 0 |
| 218 | 木桩副本 | 0 | 0 | 1 | 0 | 1 | 7200 | 0 |
| 219 | 英雄材料副本 | 0 | 0 | 1 | 0 | 1 | 3600 | 0 |
| 220 | 头衔晋升副本 | 0 | 0 | 0 | 0 | 1 | 3600 | 0 |
| 221 | 愤怒小鸟副本 | 0 | 0 | 0 | 0 | 1 | 3600 | 0 |
| 222 | 多人小鸟 | 0 | 1 | 0 | 0 | 1 | 3600 | 0 |
| 223 | 肉鸽玩法 | 0 | 0 | 1 | 0 | 1 | 7200 | 0 |
| 224 | 机器人塔 | 0 | 0 | 1 | 0 | 1 | 7200 | 0 |
| 225 | 雪球响叮当 | 0 | 1 | 0 | 0 | 1 | 3600 | 0 |
| 301 | 公会锦标赛 | 未配置 | 1 | 1 | 0 | 0 | 7200 | 0 |
| 302 | 空中派对 | 未配置 | 1 | 0 | 0 | 0 | 3600 | 0 |
| 401 | 梦魇讨伐 | 0 | 1 | 1 | 0 | 1 | 7200 | 0 |
| 402 | 公会讨伐 | 0 | 1 | 1 | 0 | 0 | 7200 | 0 |
| 403 | 啵啵入侵 | 0 | 1 | 1 | 0 | 0 | 7200 | 0 |
| 404 | 黄金矿工(小游戏) | 0 | 0 | 0 | 0 | 0 | 120 | 0 |
| 405 | 公会紧急征召 | 0 | 1 | 1 | 0 | 0 | 7200 | 0 |
| 406 | 飞行竞赛 | 0 | 1 | 0 | 0 | 0 | 7200 | 0 |
| 407 | 公会讨伐-怪物讨伐 | 0 | 1 | 1 | 0 | 0 | 86400 | 0 |
| 408 | 机关逃亡 | 0 | 1 | 0 | 0 | 0 | 7200 | 0 |
| 409 | 普通材料副本 | 0 | 0 | 1 | 0 | 1 | 3600 | 0 |
| 410 | 飞行小游戏 | 0 | 1 | 0 | 0 | 0 | 7200 | 0 |
| 411 | 飞行小游戏新手 | 0 | 1 | 0 | 0 | 0 | 7200 | 0 |
| 412 | 飞行小游戏联机 | 0 | 1 | 0 | 0 | 0 | 7200 | 0 |
| 413 | 比武招亲 | 0 | 1 | 0 | 0 | 1 | 3600 | 0 |
| 414 | 虹猫蓝兔剧情挑战 | 0 | 1 | 0 | 0 | 1 | 3600 | 0 |
| 415 | 公会试炼 | 0 | 1 | 1 | 0 | 1 | 3600 | 0 |
| 416 | 轻功大赛 | 0 | 1 | 0 | 0 | 0 | 3600 | 0 |
| 417 | 岁岁相牵 | 0 | 0 | 0 | 0 | 0 | 120 | 0 |
| 501 | 自由竞技 | 0 | 1 | 1 | 0 | 0 | 7200 | 0 |
| 502 | 全国锦标赛-海选赛 | 0 | 1 | 0 | 1 | 0 | 3600 | 1 |
| 503 | 全国锦标赛-淘汰赛 | 0 | 1 | 0 | 1 | 0 | 600 | 1 |
| 504 | 全国锦标赛-巅峰赛 | 0 | 1 | 0 | 1 | 0 | 600 | 1 |
| 601 | S3联赛-海选赛 | 0 | 1 | 0 | 1 | 0 | 3600 | 1 |
| 602 | S3联赛-淘汰赛 | 0 | 1 | 0 | 1 | 0 | 600 | 1 |
| 603 | S3联赛-巅峰赛 | 0 | 1 | 0 | 1 | 0 | 600 | 1 |
