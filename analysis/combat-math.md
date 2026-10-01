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
| `fire_power_grow_speed` | 5500 | 蓄力公式分母参数，完整公式和上传换算见下方。 |
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

> 本版按Lua元表展开有效默认值，并用原指令/受控执行复核关键分支。详细规则和全量明细在下方；当前服开放与服务器最终裁定不由静态表替代。
<!-- DESIGN_DETAIL_BEGIN -->

## 操作数值设计：蓄力速度公式已闭合

### 原始函数与量纲

`get_unit_power_add_speed` 的原指令给出以下计算，随后ready请求把结果乘10000并round为force_speed。

```text
A = unit.attrs.aim_factor，缺省0
P = 玩家对应蓄力速度设置，缺省setting.const.power_add_speed_min
E = 环境env_arg.add_speed_rate，未配置时无此乘项
B = 单位所有power_add_speed buff效果合计
S = (1000 / fire_power_grow_speed) × (1−A) × (P×0.01)
S = S × (1+E×0.0001) × (1+B×0.0001)
上传force_speed = round(S×10000)
```

fight_misc的fire_power_grow_speed=5500，因此它出现在分母，不能直译“每秒增加5500力度”。PVE/PVP使用不同设置键。这里的S是原函数返回量，时间单位需跟力度控件的update换算一起解释；本页不把S强加成每秒显示力度。[原始公式](../reverse/lua-disassembled/game.module.fight.manager.base.fighting.ui.core.txt#L2258)、[上传换算](../reverse/lua-disassembled/game.module.fight.manager.base.fighting.fire.core.txt#L455)

| 明确输入 | S，原始函数返回 | 上传force_speed | 相对标准 |
| --- | ---: | ---: | ---: |
| P100，A0，环境0，buff0 | 0.181818 | 1818 | 1 |
| 同上，A0.2 | 0.145455 | 1455 | 0.8 |
| 同上，磁暴E18000 | 0.509091 | 5091 | 2.8 |
| 同上，buff2000 | 0.218182 | 2182 | 1.2 |

以上四例已直接执行原始字节码。磁暴字段18000经`1+E/10000`得到2.8倍，不是1.8倍；环境与buff分别相乘，也不是简单把18000和2000相加后一次修正。[可复跑输入](../analysis/data/client_rule_probes.json)

## 弹道预测设计：输入、求解和轨迹类型

### 发炮输入是一个操作快照

客户端提交round、angle、force、pos、from_pos、direction、force_type、land_angle、fire_buff_pos和force_aim_type。round防止把旧回合动作放进新回合；pos与from_pos区分当前位置和起点信息；angle/force与direction联合解释朝向；力度类型/瞄准类型决定输入路径。记录发炮时只留“70力度”无法重现当局操作，至少还要保留位置、朝向、角度、风、弹体、技能与环境。

开始蓄力的force_speed与最终发炮的force是两个字段：前者描述增长速度，后者是提交时力度值。技能请求type2也不能假装是type1附加一个伤害倍数。[命令网络原指令](../reverse/lua-disassembled/game.module.fight.manager.base.fighting.cmd.network.txt)

### 推荐力度与快捷角度是两套辅助

快捷角度表20/30/50/65°各20个样本，偏风提示使用30°±风、50/65°±2×风。推荐求解则以0–100为候选力度区间，模拟落点并二分缩界；目标、武器、风和传送门位置进入求解，不能按样本格直接取“保证命中力度”。候选没有合法解时应保留失败结果，不夹成100强行当推荐。

这两种辅助都只预测落点，不授权本地扣血；跟踪目标后的位置变化、特殊弹体和服务器输入校验可以使预览与最终节点不同。[推荐指令](../reverse/lua-disassembled/game.module.fight.manager.base.fighting.recommand_force.txt)

### 两条已能写公式的轨迹

普通抛物线先按时间计算连续位移，再floor到格点：

```text
x(t)=floor(x0+vx0·t+0.5·ax·t²)
y(t)=floor(y0+vy0·t+0.5·ay·t²)
```

算例x0=100，y0=80，vx0=20，vy0=30，ax=2，ay=−10，t=1，得到x121、y105；t=2得到x144、y120。输入是示例坐标单位，不能据它推游戏米/秒。floor的位置也必须保留，先取整速度再积分会产生不同结果。

逐帧受力分支则先pos+=v·dt，再更新v+=a·dt；横向加速度含`(外力−阻力×vx)/质量`并保留三位小数。它与闭式抛物线不是在任意步长下等价。模块还列直线、贝塞尔、分步自由落体、ground_rolling和ground_paste，最后两类是地面相关移动；特定武器必须先查实际弹体/轨迹类型。[轨迹原指令](../reverse/lua-disassembled/game.module.fight.manager.base.fighting.trajectory.txt)

## 风与天气的计算位置

回包wind先×0.1为cur_wind，再×战斗wind_power_factor×weather_factor为wind_factor。例如wind10、因子240/1得cur_wind1和wind_factor240；它不是未经质量/阻力处理后的最终横向加速度。部分推荐入口重力项使用battle.gravity×bullet.gravity_factor×bullet.mass，应沿具体轨迹分支使用。

磁暴的add_speed_rate已在上述蓄力公式闭合；parabola_change_rate2仍是另一弹道参数。狂风提供普通风40–60、狂风80–100、持续字段3、概率候选2000，这些不能仅凭与万分值相似就认定每回合20%狂风。天气附加被动ID需按被动触发链处理。[环境配置](../analysis/data/battle_env_battle_env.json)

## 伤害与生命的数值契约

技能effect倍率、固定值，单位攻击/防御、暴击/抗暴、物理/法术增伤和模式平衡是输入层。配置给随机扰动.02、暴伤下限1.25/上限2、最低伤害与护盾相关阈值.1；缓存缺服务器函数，不能据此闭合乘区与先后取整。

已经能准确写出的客户端生命维护：加血`min(max_hp,hp+Δ)`，减血`max(0,hp−Δ)`，然后进入update/perform显示链。示例hp90/max100加30显示100，hp10减50显示0。此夹取是同步状态维护，不证明治疗计算已经先乘最大生命，更不证明盾在防御前扣。[生命原指令](../reverse/lua-disassembled/game.module.fight.manager.base.fighting.unit.attrs.txt#L115)

服务端节点分别提供行为和属性结果，多弹体技能不能把文本总倍率相加后只减一次HP。复原数值案目前可执行的是输入换算、蓄力公式、预测轨迹、状态夹取；伤害结算执行器仍应列为独立缺口，不能用常见弹弹类公式补空白。


## 2026-10-01 复查补充

原函数验证确认：`add_unit_hp`只钳上限，`dec_unit_hp`只钳下限，`update_unit_hp`直接赋值；不存在统一0～max_hp双边钳制。负输入是离线边界测试，不证明线上可利用问题。阻力轨迹为先位置、再速度、最后加速度的逐步积分；另有标准抛物线和直线，共三类。完整复查见 [新版战斗报告](review/reports/02-combat.md)。
