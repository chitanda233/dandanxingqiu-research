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
