## 数值口径修正：有效行包含默认继承

此次执行配置时还原Lua行元表的`__index`默认字段。旧版导出仅枚举行内键，导致60级经验、40级技能费用、武器5/6品质等被误写为缺失；现已重导并纠正。相同字段连续多级重复可能正是配置设计，不能自行插值。成本行还要沿实际培养函数确定是“从当前级升级”还是“升到目标级”，本页只对已经追完的技能给精确消费方向。

## 技能升级预算：单次与累计分别算

技能1001每次培养查**当前lvl**行，下一行仅用于判断还能继续。0→1用解锁书1402020003×1，1→2用技能知识25/金币1000，10→11用400/10000，20→21用4000/90000，40→41用7500/150000。角色22级/开服1天是初级行门槛；40级行是角色40级/开服5天。技能页逐行列出了全部路径和到达当前级累计支出，累计不把当前行提前花掉。[成本与累计表](skills.md)

要给玩家算“今天能升几级”，应先检查当前步骤门槛，再逐步扣该行资源并移到下一行；遇到前置技能数量、任务、角色级或开服日停止。不能只拿金币除高级行成本，也不能只把所有资源总量平均分配。原始函数验证了20→21材料3999不够、4000够；40→41角色39级或开服4天失败。[原始字节码验证](../analysis/data/client_rule_probes.json)

## 宠物数值：点数转换与等级差衰减

### 点数转换的完整客户端公式

对每个点属性p及其目标属性a，point2attr遍历两类转换，累加到结果：

```text
base = 宠物attr_list中69号值/10000；没有69号时为1
factor[a] = 1 + 对应add_value项合计/10000 − 对应reduce_value项合计/10000
fixed[a] += point[p] × trans_values[p,a] × base × factor[a]
scaled[a] += point[p] × get_level_trans_values(curve_id,pet.level) × base × factor[a]
返回属性 = fixed + scaled
```

固定值和等级曲线两者都执行，不能二选一。`attr_rules`决定某attr_list项对应哪个目标属性的加/减；69号是全局点转换倍率。原函数在这一段没有额外取整，因此不要擅自把每一项先floor。

普通attr_trans中81→生命5、82→攻击1。示例100点81、69号11000、对应生命加成1000，且无等级转换时，贡献为100×5×1.1×1.1=605生命；这是该公式的算例，尚未叠宠物模板、天赋、继承、装备或PVP替换。模板表的生命338不是整只50级宠物最终HP。[转换原指令](../reverse/lua-disassembled/game.module.pet.manager.core.txt#L1969)、[固定转换表](../analysis/data/attr_trans_attr_trans.json)、[属性规则](../analysis/data/attr_rules_attr_rules.json)

### 等级差衰减率

`get_pet_weaken_rate`准确返回：

```text
若pet.level==100：0
否则max(1−(pet.level+50)/(player.level+player.pause_level+54),0)
```

| 宠物级 | 角色级 | pause_level | 返回衰减率 |
| ---: | ---: | ---: | ---: |
| 30 | 30 | 0 | 4.7619% |
| 30 | 50 | 0 | 23.0769% |
| 30 | 50 | 10 | 29.8246% |
| 100 | 133 | 0 | 0% |

四例均直接执行原字节码。分母还有54偏移量，并非简单宠物级/角色级；pause_level增加会提高相同宠物的返回衰减。函数返回一个比例，但服务端最终在哪些属性/伤害阶段应用它仍待闭合，不能把该结果直接当最终伤害削弱百分比。[原指令](../reverse/lua-disassembled/game.module.pet.manager.data.data.txt#L5882)、[执行证据](../analysis/data/client_rule_probes.json)

### 天赋与随机范围

宠物天赋188行；例c_id10010的生命天赋区间820–970，低档权重区间[820,865]/[865,895]/[895,940]/[940,970]对应5500/2000/1500/1000，高档[910,970]权重10000。这里可以读区间和权重，不应把820直译成最终820生命。不同天赋attr_id_list与同一宠物继承系数分别存储，先明确天赋语义再乘入最终属性。[天赋原表](../analysis/data/pet_talent_pet_talent.json)

## 武器、宝石和装备：独立成本轴

武器阶级5/6有效quality均5，lv95/105、开服248/310天、score19500/24500；quality不能从class直接一一对应。六阶全部strengthen_max15，而weapon_strength另有30个强化门槛，两套对象的等级含义需保持区分。放大系统120级还有module_limit、block_level_limit与分服开服门槛；20级_0第7天、543第6天，同属性不同投放日。

宝石quality＋lv联合索引130行，五种品质各有独立行段；品质5等级25角色门槛35、消耗宝石材料45/金币45000、attr_num1、passive_per1000。合成quality5一行num4/week_count20/open_func2302。装备强化的success_max/luck_max与luck_display_conversion是进度/显示参数，不能把success_max900当90%概率；part_id1有strengthen_info2，其他部位可能是另一结构，不能按一条全装备曲线读取。[宝石](../analysis/data/gem_level_gem_level.json)、[装备强化](../analysis/data/equip_strengthen_lv.json)

## 模式平衡：替换、加成与转换分开列

288条ranked_match_balance按level/faction/open_day区分候选行，字段包括attr_replace、attr_add、pet_attr_replace、pet_balance_ps_skill、trans_values_pvp和attr_extra。第一行level1/faction0/open_day0把角色生命/攻/防替换1568/570/335，宠物297/614/346；角色暴伤15000、暴伤减免2500亦明确配置。不是只有三个基础值。

普通体质转换生命28，而首行PVP体质61→生命5/防御.3/速度.3，力量62→攻击1、耐力64→生命2/防御.7。需要先选择正确平衡行，再讨论点数转换和继承；不能把普通养成面板每一项都原封保留，也不能宣称公平模式删除技能、宠物与构筑机制。[完整平衡表](../analysis/data/ranked_match_balance_ranked_match_balance.json)

下方完整133级角色、100级宠物、六阶武器、30强化门槛、130宝石行可直接核算。它们是客户端快照，当前账号采用哪行和最终资源变动以服务器回包为准。
