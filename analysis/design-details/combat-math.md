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

原函数验证确认：`add_unit_hp`只钳上限，`dec_unit_hp`只钳下限，`update_unit_hp`直接赋值；不存在统一0～max_hp双边钳制。负输入是离线边界测试，不证明线上可利用问题。阻力轨迹为先位置、再速度、最后加速度的逐步积分；另有标准抛物线和直线，共三类。完整复查见 [新版战斗报告](../review/reports/02-combat.md)。
