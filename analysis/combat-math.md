# 局内计算与操作：输入、弹道、伤害边界

本页从**原始字节码重新执行导出的配置**与战斗 Lua 调用链出发。数值均属于版本 242 的客户端快照。配置常量不能直接冒充服务器的最终伤害公式；下文分别标记“客户端实际运算”“配置参数”“服务端待证”。完整表见 [配置导出清单](../analysis/data/manifest.json)；执行器见 [提取脚本](../tools/extract_config_tables.py)。

## 一次发炮究竟提交什么

`send_fire_cmd` 组装 `battle_seq_cmd_c2s`：`round`、`type=1`、`angle`、`force`、`pos`、`from_pos`、`direction`、`force_type`、`land_angle`、`fire_buff_pos`、`force_aim_type`。独立用技能是 `type=2`、`ask_skill.cf_skill_id`。客户端并非仅上传“命中目标”；方向、力度和起点均进入请求。[发送代码](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.cmd.network.lua#L10)

服务端返回的 `battle_seq_cmd_s2c` 可能分批（`batch_index/batch_total`），客户端合并 `node_list` 后按 `type` 分派：1 发炮、2 技能、3 特殊子弹、100/101 其他弹体事件。弹体节点还按 `bullet_fly_time` 和 `_order` 排序。[回包解析](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.cmd.network.lua#L50) 因此“由客户端计算出命中和伤害”不成立；可确认的是客户端计算预览和本地表现，并执行服务端节点。

## 瞄准与力度参数

| 参数 | 缓存值 | 含义与证据 |
| --- | ---: | --- |
| `round_action_time` | 15 | 默认行动时间配置，不等于所有模式真实回合时长。 |
| `fire_max_force` | 100 | 力度上限常量。 |
| `fire_power_grow_speed` | 5500 | 蓄力增长参数，单位及最终换算须看调用处。 |
| `battle_fire_force_factor` | 20 | 发射力度系数。 |
| `recommend_power_range` / `range2` | 30 / 15 | 推荐力度范围参数。 |
| `max_walk_angle` | 56 | 移动坡角相关阈值。 |
| `bullet_g` / `bullet_r` / `bullet_w` / `bullet_t` | -172 / 0.9 / 5.87 / 0.6 | 弹体常量；不将它们拼成未经验证的全局物理公式。 |

来自 [fight_misc 原表](../analysis/data/fight_misc_attr_const.json)。另有角度快捷提示字符串：20°；30°±风；50°±2×风；65°±2×风。它是**界面辅助表达式**，并非命中保证。[同表](../analysis/data/fight_misc_attr_const.json)

| 角度 | 配置的 20 个力度样本（前 5 / 后 5） |
| --- | --- |
| 20° | 8, 16, 23, 28, 33 / 68, 70, 72, 75, 77 |
| 30° | 8, 15, 21, 26, 30 / 60, 62, 65, 67, 69 |
| 50° | 9, 16, 21, 26, 30 / 60, 62, 64, 66, 68 |
| 65° | 11, 19, 26, 31, 35 / 72, 74, 77, 80, 82 |

推荐线还有 `line_min_power_base=70`、`line_max_power_base=95`、`line_min_power_rate=0.85`、`line_max_power_rate=0.75`、`line_max_fire_range=380`、`parabola_angle_fix_range=10`。这些是 UI/辅助瞄准配置，[原表](../analysis/data/fight_misc_attr_parabola.json)；推荐力度计算模块会检查当前控制单位、回合状态、锁定目标，形成 `recommand_forces`，[调用链](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.recommand_force.lua#L81)。

进一步追到 `raw_recommand_force`：先取候选力度区间 **0–100**，调用落点模拟，再在区间内反复取中值，根据模拟落点缩小上下界，直到宽度小于内部精度阈值。它是**对目标落点的数值搜索**，不是仅查上表的 20 个预设力度；预设角度表用于另一类快捷提示。[二分搜索段](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.recommand_force.lua#L1188) `recommand_force` 计算时还用 `battle.gravity × bullet.gravity_factor × bullet.mass` 形成重力项，并会对传送入口/出口位置重新尝试解力度。[推荐力度入口](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.recommand_force.lua#L1144) 反编译丢失了部分中间变量和闭包名，因此目标判定误差与迭代次数暂不能精确写出。

## 客户端能看到的轨迹计算

普通抛物线在客户端按 `x=floor(x0+v0x·t+0.5·ax·t²)`、`y=floor(y0+v0y·t+0.5·ay·t²)` 更新位置。[轨迹代码](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.trajectory.lua#L52) 物理环境的逐帧轨迹另用 `pos += v·dt`，更新速度 `v += a·dt`，横向加速度取 `(外力−阻力·vx)/质量` 后保留三位小数。[同文件](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.trajectory.lua#L64) 游戏还有直线、贝塞尔与自由落体路径，不能用单一抛物线概括全部武器。

回合代码把风值乘 0.1 成为 `cur_wind`，再乘 `wind_power_factor` 和 `weather_factor` 得 `wind_factor`。[风处理](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.round.core.lua) 战斗表对一些场景给 `gravity=10`、`wind_power_factor=240`、`weather_factor=1`、`air_resistance_factor=1`；这是**该行场景**值，并非全模式通用。[战斗配置](../analysis/data/battle_battle.json)

## 战场环境会改什么

| 环境 ID | 参数 | 可确认范围 |
| --- | --- | --- |
| 1 磁暴 | `parabola_change_rate=2`、`add_speed_rate=18000` | 弹道/速度参数存在；实际应用分支需结合环境实现。 |
| 2 狂风 | `wild_wind_rate=2000`、`wild_wind_round=3`、普通风 `[40,60]`、狂风 `[80,100]` | 配置的天气参数；`2000` 不直接解释成 20% 除非调用处证实。 |
| 8 冰雪 | 被动技能 ID `[393,394,395,396]` | 环境附加技能表。 |
| 12 魔法飞毯 | 被动技能 ID `[617]` | 环境附加技能表。 |
| 16 磁力鞋 | 被动技能 ID `[639]` | 环境附加技能表。 |
| 17 音乐节 | 被动技能 ID `[648,651]` | 环境附加技能表。 |

数据见 [battle_env 原表](../analysis/data/battle_env_battle_env.json)。自由对战可选环境 ID 为 `1–8,11–14,16,17`，另有三组地图池与 `free_battle_time_list=[10,15,20]`。[自由对战配置](../analysis/data/free_battle_misc_free_battle_misc.json)

## 伤害、暴击与生命：哪些公式拿得到

属性表确认 ID 1 攻击、2 防御、11 最大生命、12 伤害、13 减伤、101 暴击率、103 暴击伤害、121 抗暴击、122 暴伤减免、131 伤害提升、134 伤害减免、139 物理增伤、143 法术增伤。[属性定义与中文](../analysis/data/attr_attr.json)、[语言表](../analysis/data/language_define_attr.json)。`fight_misc` 同时给 `dmg_random_r=0.02`、`crit_dmg_min_k=1.25`、`crit_dmg_max_k=2`、`min_dmg_k=0.1`、`shield_dmg_min_k=0.1`、`break_def_min_par=0.1`。[常量](../analysis/data/fight_misc_attr_const.json)

**不能**把这些常量直接写成“最终伤害 = 攻击×技能倍率×随机×暴击−防御”。缓存里没有足以闭合每一步的权威服务端伤害调用链，具体取整顺序、减伤叠加、护盾优先级和随机种子均未证实。客户端 `unit.attrs` 处理服务端属性更新，并将本地生命增加夹到 `max_hp`、生命减少夹到 0；那是展示状态维护，不是服务器结算公式。[属性模块原字节码](../reverse/lua-bytecode/lua4_573711/game.module.fight.manager.base.fighting.unit.attrs_-6891889581371411036.bin)

## 局内操作状态与失败条件

施法前客户端检查：战斗状态 `attack`、当前行动者、`round_status.action`、自动战斗状态、沉默/禁用、固定与重复回合限制、每回合和每场次数、冷却以及费用。冰冻原型在重复回合被禁止；固定 1005 位移技能在定身时被拒。[技能校验](../reverse/lua-decompiled/game.module.fight.manager.base.fighting.skill.core.lua#L177) 成功请求后仍要等待服务器消息确认并更新费用/CD；本地“按钮可点”不等于服务器接受。
