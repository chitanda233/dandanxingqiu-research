# 战斗功能、操作与数值边界

## 战斗对象与生命周期

入场数据建立玩法、地图、阵营和单位；单位含实例标识、位置、基础属性、技能列表、被动、Buff、角色/宠物信息和托管状态。客户端依赖服务器的行动列表确定当前单位及回合时钟。`object_id`、角色 ID、宠物实例 ID、技能配置 ID 不可混用。

典型链条为：建立战斗 → 分配行动 → 可操作检查 → 移动/技能/蓄力发炮 → 收到分批行为节点 → 播放弹体及效果 → 更新属性与 Buff → 当前行动结束 → 下一行动或胜负回包 → 结果页 → 各业务模块更新奖励。战斗结果展示、背包奖励和杯数变化是不同更新链。[回合流程](evidence:game.module.fight.manager.base.fighting.round.core) [节点接收](evidence:game.module.fight.manager.base.fighting.cmd.network)

## 行为节点不是一次点击的一条伤害

服务端节点可包含弹体、技能、属性处理、Buff、被动提示、分裂与连发。同一发炮可能生成多批 `node_list`。全部批次到齐后才能完成该段表现；第一个命中动画结束不代表整个行动已结束。反过来，本地尚有动画也不能推翻服务端已明确返回的胜负。[表现执行](evidence:game.module.fight.manager.base.fighting.round.perform)

缓存中还存在预览/演示战斗记录，它们有 `battle_enter_s2c`、`battle_next_round_s2c`、`battle_seq_cmd_s2c`、`battle_round_finish_s2c` 等字段样本。这些演示样本用于分析字段结构；概率与伤害结算需要相应执行器。

## 操作资格与资源

移动、普通发炮、手动技能、跳过、超时处理和自动战斗具有不同入口。技能还检查使用次数、CD、资源、Buff/特殊状态、重复行动限制和当前模式。资源包括 strength、energy、anger、wakan；有些仅特定玩法使用。托管不是在普通操作之外再并行触发一次手动操作。

比赛配置的 `use_skill`、`auto_battle`、`can_adjust_play_speed`、`guaranteed_fire`、`intelligent_force`、`soul` 等开关不同。排位 102 自动战斗为 0，3V3 排位 103 保证发炮为 1，自由竞技 501 自动为 1；模式开关决定各入口的操作集合。[模式对照](config:gameplay.gameplay)

## 蓄力换算：经过原函数验证的公式

在对应实现中，输入蓄力百分值 P、瞄准因子 A、环境加成 E、Buff 加成 B 时：

```text
S = (1000 / 5500) × (1 − A) × (P / 100)
    × (1 + E / 10000) × (1 + B / 10000)
上传值 = round(S × 10000)
```

| P | A | E | B | S | 上传值 |
| ---: | ---: | ---: | ---: | ---: | ---: |
| 100 | 0 | 0 | 0 | 0.181818… | 1818 |
| 100 | 0.2 | 0 | 0 | 0.145454… | 1455 |
| 100 | 0 | 18000 | 0 | 0.509090… | 5091 |
| 100 | 0 | 0 | 2000 | 0.218181… | 2182 |

环境 18000 对应乘 **2.8**，Buff 2000 对应乘 1.2；两项同时存在时为 2.8×1.2=3.36 倍。四组蓄力输入已执行原函数验证。S 是内部返回量，UI 的实际时间尺度取决于力度控件更新。[操作原指令](evidence:game.module.fight.manager.base.fighting.ui.core)

## 三种位移实现必须分开

标准抛物线先累加 `fly_time`，再计算 `floor(from + v0×t + 0.5×a×t²)`；负坐标也向下取整，例如 −0.1 得到 −1。逐步阻力积分使用 `R3` 保留三位精度，先位置、再速度、最后加速度：

```text
x = R3(x + vx × dt)       y = R3(y + vy × dt)
vx = R3(vx + ax × dt)     vy = R3(vy + ay × dt)
ax = R3((wind − resistance × vx) / mass)
ay = R3((g_resistance − resistance × vy) / mass)
```

直线只更新 `R3(position + velocity×dt)`。各分支按自己的积分与取整顺序推进。原函数算例：初速 (10,20)、初始加速度 (2,−10)、mass=2、resistance=1、wind=6、g_resistance=−20，dt=1；阻力积分第一步位置 (10,20)、速度 (12,10)、加速度 (−3,−15)，第二步位置 (22,30)。标准抛物线相同初速与初始加速度在 t=1 得到 (11,15)。[轨迹原函数](evidence:game.module.fight.manager.base.fighting.trajectory#move_target_along_parabola)

这是客户端运动/预测的已证实行为。引擎碰撞、地形变形和服务器命中裁定仍不能由这些公式单独还原。

## 生命与资源的更新契约

| 函数 | 原规则 | 验证例 |
| --- | --- | --- |
| `add_unit_hp` | `min(max_hp, hp+delta)` | 90+30→100；10+(−30)→−20 |
| `dec_unit_hp` | `max(0, hp−delta)` | 10−30→0；90−(−30)→120 |
| `update_unit_hp` | 直接赋值后更新表现 | 传 120 得 120；传 −20 得 −20 |
| 最大生命更新 | 当前 HP 与新上限取 min | 不构成通用伤害公式 |
| strength / energy 更新 | 上下限均钳制 | −10→0，120→100（上限 100） |

负输入案例用于确认契约，不表示线上服务器会发送这些值。生命显示、伤害数字和护盾数字也可能来自同一节点的不同字段，不应把显示层钳制当最终数值结算。[属性原函数](evidence:game.module.fight.manager.base.fighting.unit.attrs#update_unit_hp)

## 伤害与异常的证据边界

客户端存在攻击、防御、暴击、范围衰减、盾、伤害类型等字段，但没有足够证据闭合服务端最终乘区、取整、减伤叠加、随机种子和盾优先级。这些字段属于伤害输入与同步结果，完整执行顺序以服务器为依据。

## 发炮快照、辅助瞄准与风

发炮请求包含 round、angle、force、pos、from_pos、direction、force_type、land_angle、fire_buff_pos 与 force_aim_type。开始蓄力的 force_speed 表示增长速度，最终发炮的 force 表示提交力度；round 关联当前行动。位置、朝向与角度联合确定输入语义。[发炮消息](evidence:game.module.fight.manager.base.fighting.cmd.network)

快捷角度提供 20／30／50／65° 的样本，偏风提示包含 30°±风、50／65°±2×风。推荐力度在 0～100 区间模拟落点并二分缩界，目标、武器、风和传送门进入求解。合法解、落点预测与服务器命中分别属于不同结果。[力度求解](evidence:game.module.fight.manager.base.fighting.recommand_force)

风回包先乘 0.1 得 cur_wind，再乘 wind_power_factor 和 weather_factor 得 wind_factor。例如 wind=10、两因子为 240 和 1，结果为 1 与 240。轨迹还处理质量和阻力，因此该中间风因子与最终横向加速度不同。

## 战斗系统结论

战斗分为输入、预测、节点、表现和属性更新五层。位置、角度、力度和技能决定操作输入；环境与 Buff 改变蓄力；轨迹类型决定位置更新；服务器节点驱动结果。多弹体、重复行动与召唤增加表现顺序的复杂度。已确定的客户端公式覆盖输入与运动，伤害和碰撞以权威执行链为依据。
