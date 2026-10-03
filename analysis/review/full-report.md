# 《弹弹星球》游戏功能与系统设计研究报告

# 研究摘要与核心结论

《弹弹星球》是一款以回合弹射战斗为核心、以多轴养成提供长期目标、以组织关系和生产互动连接日常行为的社交游戏。客户端包含竞技、剧情、副本、爬塔、肉鸽和独立弹球等玩法；武器、技能、宠物与外围培养共同决定构筑；公会、家园、农场和活动将战斗收益接入持续成长。

报告依据 2026-09-30 采集的客户端资料撰写。研究对象 AppID 为 `wx64969d55b91a6963`，缓存目录版本为 242，技术基础为 Unity 与 Lua 5.1。结论由字节码反汇编、反编译调用链、有效配置与原函数受控执行共同支撑。

## 一、六条相互连接的系统循环

| 循环 | 玩家决策 | 状态与收益 | 系统联系 |
| --- | --- | --- | --- |
| 回合操作 | 位置、角度、力度、技能与行动顺序 | 单位状态、胜负 | 读取构筑与模式规则，输出任务和进度 |
| 长期构筑 | 培养对象、技能方案、宠物与属性分配 | 实例等级、属性与能力 | 消耗通用货币和专属材料，影响入场配置 |
| 竞技竞争 | 模式、队伍、匹配与赛季目标 | 杯数、段位、首达与赛季状态 | 使用独立平衡配置和分模式收益 |
| 挑战推进 | 关卡、楼层、节点、局内选择 | 星数、奖励额度、临时构筑 | 提供养成材料和日周目标 |
| 组织与生产 | 公会协作、家园职业、种植与订单 | 权限、关系、魅力与共享进度 | 将个人资源需求连接到成员互动 |
| 运营与消费 | 任务、抽取、兑换、购买和领取 | 库存、保底、期限、经验和奖励 | 横跨养成、效率、外观与周期活动 |

功能依赖显示，操作、成长、关系与周期目标共同组织玩家行为。留存率、付费转化和玩法偏好属于经营数据，本文分析系统提供的机制。

## 二、战斗采用服务器行为节点与客户端表现分工

客户端收集移动、角度、蓄力和技能输入，处理分批节点、轨迹、动画、单位属性和结果页面。一次发炮可以产生多个弹体和多批节点。行动结束受回合及节点状态约束，表现完成与权威结算属于不同阶段。

蓄力换算包含瞄准因子、个人设置、环境与 Buff；环境和 Buff 分别相乘。已确认标准抛物线、逐步阻力积分和直线三种位移实现。HP 函数分别采用加血钳上限、减血钳下限、直接同步赋值。[战斗分析](https://chitanda233.github.io/dandanxingqiu-research/review/02-combat.html)

**结论：操作难度、构筑差异和服务器裁定同时存在。客户端公式解释输入与运动表现，最终伤害和命中以权威执行数据为依据。**

## 三、成长由数值成本和开放条件共同控制

角色等级、武器阶级与星级、宠物突破、技能等级和装备词条各有数据对象与请求。技能培养同时受材料、角色等级、开服天数、任务、其他技能培养和下一等级存在性约束。

冰冻基础技能从 0 到 40 级累计需要知识 153,675、金币 3,223,000 及解锁书；到 80 级累计需要知识 453,675、金币 9,223,000。40→80 的知识和金币分别占全程约 66.1% 和 65.1%，高等级阶段形成持续材料消耗。竞技另有属性替换与转换配置。[技能分析](https://chitanda233.github.io/dandanxingqiu-research/review/03-skills.html) [成长分析](https://chitanda233.github.io/dandanxingqiu-research/review/04-growth.html)

**结论：成长同时依赖资源、账号进度和服务器生命周期；公平模式通过独立属性规则调节竞争条件，构筑选择仍然保留。**

## 四、各类挑战使用独立的推进与奖励模型

剧情以关卡、星数与难度组织推进；塔以楼层、战力、Buff、挂机和速通组织推进；材料本按奖励额度及回合目标分配收益；肉鸽按挑战状态、节点状态和事件选择维护一轮构筑。

独立弹球含 50 关布局。第 1／50 关初始球组分别为 6／18 球，目标分数为 367／2560；达标后可在回合末结束，首次胜利进入相应结果提交路径。曲线在第 13、26、39 关出现分段跃迁。[PVE 分析](https://chitanda233.github.io/dandanxingqiu-research/review/06-pve.html) [肉鸽分析](https://chitanda233.github.io/dandanxingqiu-research/review/07-rogue.html) [弹球分析](https://chitanda233.github.io/dandanxingqiu-research/review/08-pinball.html)

**结论：挑战通过关卡成绩、持续层数、有限奖励、局内选择和空间布局提供不同目标；通关、资格与奖励领取分别保存状态。**

## 五、社交关系直接参与资源和操作资格

公会职位通过 rights 列表分配权限，并关联名额、分红参数和战斗 Buff。家园职业、制造帮助、布局复制和魅力奖励形成生产与表达流程。农场结合成熟状态、归属与互动记录判定操作；共享订单叠加普通订单资格与独立额度。[公会分析](https://chitanda233.github.io/dandanxingqiu-research/review/09-guild.html) [家园分析](https://chitanda233.github.io/dandanxingqiu-research/review/11-home.html) [农场分析](https://chitanda233.github.io/dandanxingqiu-research/review/12-farm.html)

**结论：好友、婚姻、师徒与公会构成资格和协作网络，生产收益和关系行为通过业务状态连接。**

## 六、经济与商业化通过多种账本协同

资源来源包含任务、挑战、生产、活动、抽取与购买；消耗包含培养、制造、兑换、交易与外观。抽取池、保底与愿望分别维护。贸易比例使用万分单位，涨停溢价分支按当前价格乘 1.1 后向下取整。

月卡以服务器到期时间判定激活，广告按额度和冷却返回状态，通行证分别保存等级、购买资格与双轨领取进度。充值订单、平台回调和物品到账也是独立阶段。[经济分析](https://chitanda233.github.io/dandanxingqiu-research/review/13-economy.html) [商业化分析](https://chitanda233.github.io/dandanxingqiu-research/review/14-monetization.html)

**结论：经济结构具有多货币、多额度和多领取状态特征。商业化覆盖资源获得、日常效率、周期奖励与表达内容。**

## 研究资料与覆盖范围

| 资料 | 规模 | 用途 |
| --- | ---: | --- |
| 原始资料 | 26 份，其中 Lua AssetBundle 23 份 | 确认资产来源与完整性 |
| Lua 字节码 | 8,272 份 | 解析函数、常量、指令与调用关系 |
| game.module 命名空间 | 189 个 | 业务模块与基础设施目录 |
| 成功配置导出 | 1,555 份 | 含分片，263,128 条记录 |
| 原指令列表 | 3,088 份 | 保留函数路径、PC、跳转及哈希 |
| 原函数执行场景 | 144 个 | 109 个显式规则断言、35 个行为记录场景 |

配置执行解析真实 import 依赖和元表默认字段，分片独立保存。3 份表含函数标记，7 个候选未返回可导出表。54,065 个中文语言键、17,450 个物品名称用于阅读与查询。配置行数包含等级和分片变体，命名空间包含基础设施。

## 结论适用范围

本文给出版本 242 客户端的功能结构、状态契约、已确认公式与系统设计分析。原函数执行使用明确的账号、Unity、UI、时间和网络替代对象。最终伤害、碰撞、匹配选择器、完整抽取概率与当前服务器开放状态不在该资料的确定范围内。各章的函数和配置链接提供直接证据入口。


---

# 产品结构与玩家循环

## 产品层次与业务对象

客户端同时承载回合弹射、竞技匹配、多种 PVE、肉鸽、独立弹球、多人场景、公会组织、家园生产和活动商业化。它更接近长期运营的社交养成产品，而不是单一战斗小游戏。这是按模块、配置和请求关系得出的产品结构分析。

| 层 | 主要对象 | 玩家操作 | 状态回流 |
| --- | --- | --- | --- |
| 操作战斗 | 角色、宠物、弹体、回合、Buff | 移动、蓄力、发炮、技能、跳过 | 行为节点、属性、胜负 |
| 构筑养成 | 武器、技能、装备、宠物、宝石、卡牌 | 穿戴、培养、确认洗练、切换方案 | 实例属性、解锁、评分 |
| 对抗与挑战 | 排位、组队副本、塔、材料本、肉鸽 | 匹配、组队、挑战、扫荡、领奖 | 杯数、进度、次数、货币 |
| 组织与关系 | 公会、好友、师徒、婚姻 | 申请、审批、协作、聊天、赠送 | 权限、亲密度、任务、组织奖励 |
| 生产和表达 | 家园、农场、装扮、照片 | 布置、制造、种植、帮助、访问 | 魅力、订单、生产物、互动记录 |
| 活动和付费 | 日常、通行证、抽取、商店、月卡 | 任务、兑换、购买、领取 | 库存、奖励、期限、活动积分 |

## 一次正常会话的依赖链

登录平台取得身份 → 请求服务器列表和验证 → 连接游戏服务器 → 登录/创建角色 → 初始化玩家数据和开服时间 → 功能开放与云配置准备 → 拉取已开放模块 → 展示入口、任务和红点。网络断开、维护、封禁、SDK 切换与缓存切换都有独立处理，不能将“打开首页”视作数据已完整初始化。[登录原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.login.manager.core&function=game_login)

选择模式后，队伍目标、玩法参数和构筑方案影响入场；战斗结果又驱动任务、资源、竞技进度及活动积分。养成产生新战斗能力，家园和公会提供另一条资源与关系循环。网站首页的循环图是依赖关系示意，不是逐帧还原游戏真实 UI。

## 功能入口如何开放

`open_func` 有 707 条定义，但有效开放需同时满足服务器下发状态、云开关和平台条件。缓存有定义、模块有 view、首页有按钮，是不同层次的事实。初始化还会等待云数据；不能在云开关未就绪时把所有功能判成永久关闭。[入口规则](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.open_func.manager.core&function=is_open) [功能定义](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=open_func.open_func&q=)

功能可用性由配置、客户端处理链、Unity/SDK 依赖与服务器／账号资格共同决定。弹球的运行时检查、充值审核云开关、区服配置后缀分别处在不同层。

## 时间不是同一把钟

战斗回合时钟、客户端动画时间、服务器 Unix 时间、开服天数、日/周刷新、活动结束时间有不同用途。广告冷却读服务器时间；月卡激活要求到期时间严格大于服务器时间；噩梦塔系数读开服天数；技能 CD 按所属单位行动回合维护。`time_limit=3600`、`open_day=5` 与 `cd=4` 分别保留其调用上下文和时间尺度。

## 请求、回复与成功状态

点击按钮一般只是发送请求。穿戴、升级、购买、领取、领奖通常等待模块回包更新，随后广播事件刷新 UI 和红点。洗练还分“候选产生”和“确认接受/取消”。服务器推送可能先于某页面打开；页面关闭也不代表持久数据撤回。

业务流程按资格检查 → 成本展示 → 请求 → 成功回包 → 结果表现 → 红点更新组织。失败、取消、超时与断线恢复各有处理；余额、星级和领取记录以回复及推送为依据。

## 红点是提醒，不是统一资格判定

很多模块将可领奖、可升级、更高评分物品、未读邀请、一次性查看标志分开为红点或绿点。评分更高不一定适合当前构筑；入口红点消失也不意味着功能永久不可用。公会申请、家园照片、通行证领取进度都有自己的本地查看与服务端状态。

## 资源和关系的闭环

日常任务产生通用资源，副本和活动投放专属材料；培养与兑换消耗这些资源；竞技和组织系统再产生周/赛季目标。家园帮助、公会愿望、共享订单、师徒任务将个人成长接入关系网络。从功能耦合看，留存来自日/周额度、长期构筑、组织协作、活动轮换和外观表达共同作用，不能仅用“体力限制”概括。

当前付费转化率、用户留存、玩法使用频次无法从代码推出。本文讨论的是系统提供的机制及可能作用，不是经营指标测量。


---

# 战斗功能、操作与数值边界

## 战斗对象与生命周期

入场数据建立玩法、地图、阵营和单位；单位含实例标识、位置、基础属性、技能列表、被动、Buff、角色/宠物信息和托管状态。客户端依赖服务器的行动列表确定当前单位及回合时钟。`object_id`、角色 ID、宠物实例 ID、技能配置 ID 不可混用。

典型链条为：建立战斗 → 分配行动 → 可操作检查 → 移动/技能/蓄力发炮 → 收到分批行为节点 → 播放弹体及效果 → 更新属性与 Buff → 当前行动结束 → 下一行动或胜负回包 → 结果页 → 各业务模块更新奖励。战斗结果展示、背包奖励和杯数变化是不同更新链。[回合流程](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.fight.manager.base.fighting.round.core&function=) [节点接收](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.fight.manager.base.fighting.cmd.network&function=)

## 行为节点不是一次点击的一条伤害

服务端节点可包含弹体、技能、属性处理、Buff、被动提示、分裂与连发。同一发炮可能生成多批 `node_list`。全部批次到齐后才能完成该段表现；第一个命中动画结束不代表整个行动已结束。反过来，本地尚有动画也不能推翻服务端已明确返回的胜负。[表现执行](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.fight.manager.base.fighting.round.perform&function=)

缓存中还存在预览/演示战斗记录，它们有 `battle_enter_s2c`、`battle_next_round_s2c`、`battle_seq_cmd_s2c`、`battle_round_finish_s2c` 等字段样本。这些演示样本用于分析字段结构；概率与伤害结算需要相应执行器。

## 操作资格与资源

移动、普通发炮、手动技能、跳过、超时处理和自动战斗具有不同入口。技能还检查使用次数、CD、资源、Buff/特殊状态、重复行动限制和当前模式。资源包括 strength、energy、anger、wakan；有些仅特定玩法使用。托管不是在普通操作之外再并行触发一次手动操作。

比赛配置的 `use_skill`、`auto_battle`、`can_adjust_play_speed`、`guaranteed_fire`、`intelligent_force`、`soul` 等开关不同。排位 102 自动战斗为 0，3V3 排位 103 保证发炮为 1，自由竞技 501 自动为 1；模式开关决定各入口的操作集合。[模式对照](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=gameplay.gameplay&q=)

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

环境 18000 对应乘 **2.8**，Buff 2000 对应乘 1.2；两项同时存在时为 2.8×1.2=3.36 倍。四组蓄力输入已执行原函数验证。S 是内部返回量，UI 的实际时间尺度取决于力度控件更新。[操作原指令](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.fight.manager.base.fighting.ui.core&function=)

## 三种位移实现必须分开

标准抛物线先累加 `fly_time`，再计算 `floor(from + v0×t + 0.5×a×t²)`；负坐标也向下取整，例如 −0.1 得到 −1。逐步阻力积分使用 `R3` 保留三位精度，先位置、再速度、最后加速度：

```text
x = R3(x + vx × dt)       y = R3(y + vy × dt)
vx = R3(vx + ax × dt)     vy = R3(vy + ay × dt)
ax = R3((wind − resistance × vx) / mass)
ay = R3((g_resistance − resistance × vy) / mass)
```

直线只更新 `R3(position + velocity×dt)`。各分支按自己的积分与取整顺序推进。原函数算例：初速 (10,20)、初始加速度 (2,−10)、mass=2、resistance=1、wind=6、g_resistance=−20，dt=1；阻力积分第一步位置 (10,20)、速度 (12,10)、加速度 (−3,−15)，第二步位置 (22,30)。标准抛物线相同初速与初始加速度在 t=1 得到 (11,15)。[轨迹原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.fight.manager.base.fighting.trajectory&function=move_target_along_parabola)

这是客户端运动/预测的已证实行为。引擎碰撞、地形变形和服务器命中裁定仍不能由这些公式单独还原。

## 生命与资源的更新契约

| 函数 | 原规则 | 验证例 |
| --- | --- | --- |
| `add_unit_hp` | `min(max_hp, hp+delta)` | 90+30→100；10+(−30)→−20 |
| `dec_unit_hp` | `max(0, hp−delta)` | 10−30→0；90−(−30)→120 |
| `update_unit_hp` | 直接赋值后更新表现 | 传 120 得 120；传 −20 得 −20 |
| 最大生命更新 | 当前 HP 与新上限取 min | 不构成通用伤害公式 |
| strength / energy 更新 | 上下限均钳制 | −10→0，120→100（上限 100） |

负输入案例用于确认契约，不表示线上服务器会发送这些值。生命显示、伤害数字和护盾数字也可能来自同一节点的不同字段，不应把显示层钳制当最终数值结算。[属性原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.fight.manager.base.fighting.unit.attrs&function=update_unit_hp)

## 伤害与异常的证据边界

客户端存在攻击、防御、暴击、范围衰减、盾、伤害类型等字段，但没有足够证据闭合服务端最终乘区、取整、减伤叠加、随机种子和盾优先级。这些字段属于伤害输入与同步结果，完整执行顺序以服务器为依据。

## 发炮快照、辅助瞄准与风

发炮请求包含 round、angle、force、pos、from_pos、direction、force_type、land_angle、fire_buff_pos 与 force_aim_type。开始蓄力的 force_speed 表示增长速度，最终发炮的 force 表示提交力度；round 关联当前行动。位置、朝向与角度联合确定输入语义。[发炮消息](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.fight.manager.base.fighting.cmd.network&function=)

快捷角度提供 20／30／50／65° 的样本，偏风提示包含 30°±风、50／65°±2×风。推荐力度在 0～100 区间模拟落点并二分缩界，目标、武器、风和传送门进入求解。合法解、落点预测与服务器命中分别属于不同结果。[力度求解](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.fight.manager.base.fighting.recommand_force&function=)

风回包先乘 0.1 得 cur_wind，再乘 wind_power_factor 和 weather_factor 得 wind_factor。例如 wind=10、两因子为 240 和 1，结果为 1 与 240。轨迹还处理质量和阻力，因此该中间风因子与最终横向加速度不同。

## 战斗系统结论

战斗分为输入、预测、节点、表现和属性更新五层。位置、角度、力度和技能决定操作输入；环境与 Buff 改变蓄力；轨迹类型决定位置更新；服务器节点驱动结果。多弹体、重复行动与召唤增加表现顺序的复杂度。已确定的客户端公式覆盖输入与运动，伤害和碰撞以权威执行链为依据。


---

# 技能、Buff 与升级预算

## 四个 ID 层次

玩家养成的基础技能 ID、某等级转换出的战斗技能 ID、主动技能原型和被动技能配置属于不同对象。通用槽位、武器授予技能、宠物技能和特殊玩法技能还带来源、位置、品质、使用回合和累计次数。按中文名字合并记录会丢失等级与来源差异。

有效配置包含主动配置 8,237 行、被动配置 8,932 行，主动原型 518 种；这些是快照中的配置变体统计，不是 17,169 个独立可学技能。[主动技能表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=skill.skill&q=) [被动技能表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=passive_skill.passive_skill&q=)

## 槽位与出战计划

通用技能五个槽位 ID 为 1、2、3、100、101；类型定义主动=1、被动=2。五槽包含不同类型，实际主动／被动分配由槽位定义确定。技能穿戴与计划切换独立于等级培养；进入战斗时再转换成具体配置 ID。当前玩法可以套用对应构筑，而不是始终沿用大厅最后一次穿戴顺序。[技能管理器](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.skill.manager.core&function=)

## 使用资格是多条件交集

完整资格要考虑：玩法允许技能、当前是否可控制、是否手动可用、技能已持有、次数限制、CD、资源、状态禁用和技能特殊例外。次数可能分全局累计 `all_count` 与回合累计 `round_count`。服务端更新 `use_round` 和所属单位 `round_count`，CD 按所属单位行动回合维护。

CD 在所属单位行动回合推进；某些特殊原型有独立处理，例如 2139 的例外。重复行动、冻结等状态也会影响可用性。具体技能有是否取消普通发炮的字段，因此“释放任何技能都消耗一次攻击”不是正确概括。[局内技能原指令](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.fight.manager.base.fighting.skill.core&function=)

## 以冰冻和净化解释机制差异

冰冻 1001009 的匹配限制为最多 1 次、CD 4，并配置取消普通攻击；1001049 则是最多 3 次、CD 3，两种配置分别维护次数、CD 和行动替代。净化对应分支不替代普通攻击。描述文本、参数和客户端资格要交叉核对：文本表达效果，字段决定客户端提示和操作，服务器最终执行仍需权威链条。

Buff 有持有、有效回合、结束回合、层数、来源单位与配置 ID；被动另有触发和效果次数。显示图标消失、Buff 节点删除、技能 CD 变化不是同一事件。多段弹体可能多次触发被动，也可能由服务器限制次数，不能仅相加描述中的倍率。

## 培养费用查当前级

升级函数查当前等级费用，下一等级行用来判定还能继续。检查顺序包含角色等级、功能开放、其他已培养技能数量、任务完成状态 5、开服天数、下一行存在和材料余额。0→1 是解锁，通常与后续升级材料不同。[培养原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.skill.manager.core&function=can_upgrade_skill_lvl) [升级有效表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=skill_base_upgrade.skill_base_upgrade_0&q=)

冰冻基础技能 1001：0→1 要技能书·冰冻 `1402020003×1`；1→2 要知识 25、金币 1,000；10→11 要知识 400、金币 10,000；20→21 要知识 4,000、金币 90,000；40→41 要知识 7,500、金币 150,000，且角色 40 级、开服 5 天。材料 3,999/4,000、角色 39/40、开服 4/5 天的边界均经原函数验证。

## 单次成本与累计预算

| 到达技能等级 | 累计知识 | 累计金币 | 另外需要 |
| ---: | ---: | ---: | --- |
| 10 | 1,275 | 33,000 | 解锁书 1 |
| 20 | 17,675 | 433,000 | 解锁书 1 |
| 30 | 78,675 | 1,723,000 | 解锁书 1 |
| 40 | 153,675 | 3,223,000 | 解锁书 1 |
| 50 | 228,675 | 4,723,000 | 解锁书 1 |
| 60 | 303,675 | 6,223,000 | 解锁书 1 |
| 70 | 378,675 | 7,723,000 | 解锁书 1 |
| 80 | 453,675 | 9,223,000 | 解锁书 1 |

累计费用为 0～目标级−1 各行之和，当前级行对应下一步。80 级行虽有费用，但缺少下一行，此配置终点为 80 级。交互计算器支持选择技能和任意当前/目标级，输出按物品分列的成本；不代替资格判断，也不计算服务器折扣。

## 构筑与成长的作用

技能构筑同时考虑用途、次数、CD、资源和普通攻击替代关系。控制、解控和辅助改变回合机会，直接伤害只是其中一类收益。基础技能、战斗配置及来源分离，使同一技能名称能够对应不同等级与模式效果。

冰冻 40→80 每十级消耗知识 75,000、金币 1,500,000，占 0→80 总知识约 66.1%、金币约 65.1%。该阶段的边际成本稳定，开放门槛与实际资源供给共同决定推进速度。技能系统兼有局内战术选择和长期材料消耗两种作用。


---

# 角色、武器、宠物与外围养成

## 养成的持久数据对象

角色级、武器星级、强化级、装备部位、宠物实例、技能级、竞技段位各自有索引和请求。评分是汇总展示，战斗能力由属性与技能机制共同决定。玩家选择的是构筑实例；配置表定义候选模板，服务端保存所有权、等级、余额和方案。

## 角色等级与配点

`exp.player` 有 133 级有效行。点数配置为等级×5，五项基础上限为等级×3；额外点字段 50 来自元表默认值，其到账方式取决于实例数据。50 级基础点预算 250、单项上限 150，配点需要分散到多项。未分配余额及额外来源仍读角色实例。[角色表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=exp.player&q=)

基础生命在 1/30/50/60 级为 40/120/120/280，呈分段变化。普通转换体质 61→生命 28/防御 0.3/速度 0.3，力量 62→攻击 1；排位有单独转换与属性替换。经验高等级重复值来自有效行继承，不是自动认定导出失败。[转换表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=attr_trans.attr_trans&q=)

## 武器有多条培养轴

武器表 440 行、85 组，包含等级/品质等变体。穿戴请求按位置和列表处理，移除按 pos；成功回包更新默认方案、推荐/热门方案及评分。强化提交材料、使用模式等，回复更新强化结果和返还数量。升星按武器 ID 与星级查碎片、货币、属性、主动/被动和特性。[武器网络](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.main_weapon_develop.manager.network.network&function=) [武器表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=weapon.weapon&q=)

升星表 3,664 行；例如 1101011011 的部分初期行配置碎片 10、金币 5,000。该例不是所有武器统一成本。精通、羁绊、阵营、装备模式和计划另有管理器分支；升星可能改变技能，而非只加评分。

武器阶级 5/6 的 quality 均为 5，等级门槛 95/105、开服 248/310 天、score 19,500/24,500；class 和 quality 不一一对应。六阶 `strengthen_max=15` 与另一张 30 级强化门槛是不同对象，不能拼接成一条曲线。`weapon_class_up` 的 6 条示例门槛含开服 99999、角色 999，属于缓存存在且常规条件不可达的配置。[阶级](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=weapon_class.weapon_class&q=) [转换](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=weapon_class_up.weapon_class_up&q=)

## 宠物：升级、突破、候选确认与配点

47 条宠物模板、19 种类型不是 47 个账号已拥有实例。`pet_id` 是实例，`c_id` 是品种配置。升级和突破分开请求：品种 10010 在 times0 上限 20，times1 上限 25；突破同时改变属性和技能候选。分解返还与升级喂料分开计算。[宠物网络](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.pet.manager.network.network&function=) [突破](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=pet_evo.pet_evo&q=)

洗练先产生候选，再确认接受或取消；学习技能也有独立确认接口。五个学习槽要求等级 10/20/30/40/50，解锁材料 `1618010001` 数量 1/2/3/4/5。达到 50 级不等于免费打开全部槽。技能书品质、互斥类型、替换规则应按确切 ID 解释。

宠物支持多配点方案、设置/切换/重置/重命名。`point2attr` 同时加固定转换和等级曲线转换，并乘全局 69 号转换因子以及目标属性加减因子；函数没有额外逐项 floor。例 100 点体质、固定转换 5、全局 1.1、目标加成 1.1 得贡献生命 605，这不是整只宠物最终 HP。[点转换](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.pet.manager.core&function=point2attr)

等级差衰减函数：宠物 100 级返回 0；否则 `max(1−(pet.level+50)/(player.level+pause_level+54),0)`。宠物 30、角色 50、pause0 返回约 23.0769%；pause10 约 29.8246%。它返回比例，不证明最终伤害在哪一步应用。[衰减原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.pet.manager.data.data&function=get_pet_weaken_rate)

## 装备、宝石与石头系统

装备有部位、基础属性、附加词条、继承、强化、方案和洗练确认。强化 `success_max`、`luck_max`、`luck_display_conversion` 是进度或显示参数，不能把 900 自动解读为 90% 成功率。不同部位强化结构也有差异。[装备管理器](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.equip.manager.core&function=)

宝石按品质与等级联合索引：130 行；品质 5 等级 25 的角色门槛 35、材料 45、金币 45,000，`attr_num=1`、`passive_per=1000`。品质 5 合成行另有 num4、week_count20、open_func2302。`stone` 模块还管理穿戴、套装激活、自动分解筛选和继承；不能因中文同称“石头”把所有系统合并。[宝石升级](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=gem_level.gem_level&q=) [石头管理器](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.stone.manager.core&function=)

## 卡牌、玩具、魔方与其他成长

卡牌按组、部位、品质维护激活、升级、图鉴属性、组合技能和分解，可交易资格也单独判断。玩具有主/副技能、组合、天赋树、总点数及副位解锁。魔方有激活、增强、超频分支；神宠有获取/旅行任务和稀有品种入口；声望、境界、称号、外观分别有自己的数据层。[卡牌](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.card.manager.core&function=) [玩具](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.toy.manager.core&function=) [魔方](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.cube.manager.core&function=)

卡牌、玩具、魔方等外围分支由模块入口、数据对象和请求链确认。功能目录提供精确函数及来源；具体培养公式的确定程度按各条证据说明。

## 公平模式保留什么

288 条排位平衡候选按 level/faction/open_day 区分，字段包括角色替换、加成、宠物替换、PVP 点转换和额外属性。首行角色生命/攻击/防御为 1568/570/335，宠物 297/614/346，并含暴伤等字段。竞技按对应行替换与转换属性，同时保留武器、宠物和技能构筑的对象与机制。[平衡表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=ranked_match_balance.ranked_match_balance&q=)

从设计结构看，长线养成与竞技平衡并存。当前账号具体选择哪一行、最后入场属性和评分权重仍由实际回包确定。


---

# PVP、匹配、赛季与机器人

## 模式先于匹配规则

缓存有 70 条玩法定义，含测试和历史候选。模式决定是否单人、是否技能、自动、倍速、保底发炮、智能力度、灵魂、时间限制、跨服和观战延迟；不是同一套竞技规则换不同标题。交互实验室可同时对比两种模式。[玩法表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=gameplay.gameplay&q=)

| 模式 | ID | 自动 | 保证发炮 | 智能力度 | 时间限制原值 |
| --- | ---: | ---: | ---: | ---: | ---: |
| 排位赛 | 102 | 0 | 0 | 1 | 3600 |
| 3V3 排位 | 103 | 0 | 1 | 1 | 3600 |
| 自由竞技 | 501 | 1 | 依表 | 依表 | 7200 |
| 竞技资格相关模式 | 502 | 0 | 1 | 依表 | 依表 |

时间字段在此保留配置单位。组队目标、竞技目标和匹配入口使用不同请求，队伍状态和玩法设置共同组成匹配输入。

## 匹配前的硬门槛与软提醒

客户端有队伍状态、成员资格、目标玩法和特殊时段检查。00:00～06:30 的夜间分支在超出新手场数后提示，但属于可继续的软提醒。04:30～05:30 的另一分支对杯数大于 1600 且达到新手最大场数的对象关闭；队伍中任一适用成员可能触发。另有新服豁免，必须跟开服时钟一起判断。[匹配管理器](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.match.manager.manager&function=)

养成建议对 score0 或低于推荐值约 10% 的情况提示。匹配前检查包含禁入、可继续的确认及文本建议三种结果；战力建议属于提示层。

## 新手分片与奖励选择

`_0` 有 11 场新手配置；`_543` 有 8 场，再加 4 条事件配置，场次边界由选择索引决定。选择下一条奖励时使用 fight_num+1 等索引和对应胜负分支。配置里有机器人和战斗预设，不足以证明所有新手匹配都固定 AI，具体对手仍需要选择器或实服证据。

## 杯、星与 ELO 是不同轴

杯数表 53 个节点，段位/星表 27 个节点，ELO 表 16 个节点。各自保存胜负收益、节点继承、首达奖励、K 值或赛季重置。这三表共存不代表所有竞技入口都会叠算三套分数。[杯数](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=season_cup.season_cup&q=) [ELO](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=season_pvp_elo.pvp_elo&q=)

| 杯数节点 | 真人胜 / 负原值 | 机器人胜 / 负原值 |
| ---: | ---: | ---: |
| 2600 | 50 / 20 | 25 / 10 |
| 3100 | 30 / 15 | 15 / 6 |
| 3200 | 25 / 15 | 10 / 6 |
| 4100、4200 | 15 / 10 | 8 / 6 |

这里列的是基础配置字段，尚未加入弱队、日保护等修正。低段位存在 lose_cup0、lose_add_cup100、每日失败保护 6 的行，胜负变化由基础收益、保护和特殊修正共同决定。首达按领取状态发，不是每次回到节点都再领。

## 机器人至少有四类证据

练习模式的机器人配置、AI 战术计划、邀请型队友模板、自动补位许可是不同对象。练习约 18 条，AI 方案相关表 91 条；邀请队友配置 2,189 条；`is_add_robot` 默认 1 仅说明允许相关流程，不是已生成机器人。

机器人可有装备、技能、阵营、杯数、外观和行为计划。邀请触发的 `[[1,1,8]]` 是条件原值，未闭合条件解释器时不可自行翻译为“第 8 场必补位”。同样，客户端有 AI 战术不代表排位匹配服务端使用相同决策器。[练习](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.practice.manager.core&function=) [队伍](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.team.manager.core&function=)

## 观战、锦标赛和跨服竞技

赛季联赛、锦标赛、冠军赛、国家相关竞赛和单人竞技均有独立模块。模式可能配置 watcher_delay，例如排位 102 原值 60；但角色是否可观战、列表时间和资格仍依赖服务端信息。相关模块已提供结构目录，不能将缓存中每项赛事都当作当前排期开放。

## 匹配算法的权威边界

隐藏分权重、扩圈及实际机器人投放由服务器选择器决定，客户端缓存没有相应执行实现。客户端发送目标、接收结果、显示对手，与服务器选择对手的算法是不同层。

设计上，真人/机器人收益差、低段位保护和赛季继承可以调节推进节奏；它们的确切在线效果需要当前服回包、选择器或运营数据。已确认的基础收益、保护和入口条件提供竞技推进结构的依据。


---

# 剧情、副本、爬塔与材料奖励

## PVE 类别与进度模型

主线、剧情关卡、多人剧情、组队普通/英雄副本、材料本、塔、组队塔、单人 Boss、木桩和机关/机器人塔等各有配置和进度。主线表 1,600 行、60 章；剧情 `_0` 与 `_543` 各 241 行，另有关卡/章节表。主线、剧情和分片分别统计。

| 系统 | 资格或推进 | 奖励状态 | 主要差异 |
| --- | --- | --- | --- |
| 主线 | 可挑战、前置通过 | 通关/进度回包 | 与剧情关卡模块分离 |
| 剧情 | 难度开放、关卡锁定、星数 | 章节星奖、难度奖 | 首通、速通和自动下一关分开 |
| 组队副本 | 自己与队友资格、队伍目标 | 翻牌、每日经验、周额度 | 普通与英雄额度不同 |
| 塔 | 层数、等级、战力、功能开关 | 层数奖、阶段奖、每日/挂机 | Buff、自动、速通与噩梦系数 |
| 材料本 | 系列、挑战进度、次数 | 次数奖、回合奖、队伍排名奖 | 助力分支会改变奖励额度显示 |
| 单人 Boss | Boss 任务、天赋与次数 | 速战次数、天赋/任务奖 | 普通与全局任务位不同 |

## 剧情：星数奖励与可挑战状态

章节奖励先看是否已领取；未领取时比较章节总星与 `奖励档位×dungeon_star_max`，返回可领或锁定。困难难度先查难度开放，再查关卡锁定。章节奖、关卡通过和难度解锁不是同一布尔值。[剧情函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.story_level.manager.core&function=get_story_level_chapter_award_state)

速通 `can_crush_level` 要求功能开放、关卡尚未通过、存在推荐战力，且实际战力达到推荐战力乘指定系数；进入战斗和速通是不同请求。`can_auto_fight_next` 的开头固定开关为 false，原函数直接返回 false，后面的找下一关逻辑在此版本不可达。已通过离线执行验证，未调用任何下游桩函数。[速通](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.story_level.manager.core&function=can_crush_level) [连续挑战](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.story_level.manager.core&function=can_auto_fight_next)

多人剧情读取章节、关卡、个人积分、目标达成、奖励领取和固定推荐战力，有独立 `req_gve_story_info_c2s`；多人积分与个人剧情星数分别维护。

## 组队副本：资格与奖励额度分开

`check_self_dungeon_unlock`、`check_other_dungeon_unlock` 分别检查自己和队友；目标改变、组队邀请、退出/建队有独立流程。翻牌是否显示、额外普通奖励、英雄周奖励数量和每日经验奖励都读各自的数据。一次通关可以推进副本进度，却不一定剩余所有奖励额度。[组队原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.dungeon_team.manager.core&function=)

## 爬塔：Buff、挂机、自动与速通

塔模块维护目标层、最高可挑战层、阶段领奖、好友信息、Buff 装备/选择次数、自动状态、挂机奖励与速通。`can_get_daily` 要 daily_reward=0 且 `can_show_daily` 满足；不满足可能返回 nil，而不是统一显式 false。

`can_crush` 要下一层存在且能挑战，要求 `cant_crush≤0`，速通功能开放，战力达到 `press_power`。噩梦分支把门槛调整为 `press_power×(1+max(噩梦速通系数,0)/10000)`。因此同一层在不同开服天数可能有不同速通要求。[塔原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.dungeon_tower.manager.core&function=can_crush)

```text
是否噩梦 = open_day × 10000 < night_mare_coeff[1]
怪物系数 = (night_mare_coeff[1] − open_day × 10000)
           × night_mare_coeff[2] / 10000
速通系数 = (night_mare_coeff[1] − open_day × 10000)
           × nightmare_press_power / 10000
```

函数本身可能返回负系数；速通使用处再钳非负。测试阈值 100000、怪物系数项 5000、速通项 2000：第 9 天返回 true/5000/2000，第 10 天 false/0/0，第 11 天 false/−5000/−2000。getter 返回原系数，速通使用处再执行非负处理。[噩梦函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.dungeon_tower.manager.core&function=get_nightmare_mon_coef)

塔配置 `_0/_543/_993` 各 1,200 行，`_2000` 1,000、`_2008` 30，是不同分片，不等于一个服共 4,630 层。实际选择配置和客户端开放条件需要运行上下文。[塔分片](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=tower.tower_0&q=)

## 材料本：奖励次数不是挑战次数

系列表 10 条，普通/英雄分组；关卡 `_0/_543` 各 30 条，回合奖励 15 条。正常 `award_left=reward_limit_cnt−reward_cur_cnt`，同时返回上限；当 `sprouts_rate>0`，剩余显示被压成有额度 1、无额度 0，上限为 1。测试 limit7/used2 正常返回 5/7，助力返回 1/1，used7 返回 0/1。[额度原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.dungeon_material.manager.data.data&function=get_award_left_times)

回合奖要求未领、pass_round>0 且 pass_round≤finish_round，体现“在指定回合内完成”。例如 finish4，pass4可领、pass5和pass0不可领，已领取亦不可领。排名奖另用 team_rank_cnt 与已领列表判断；不能把回合奖与排名奖合成同一个按钮状态。[回合奖](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.dungeon_material.manager.data.data&function=get_round_reward_can_get_by_id)

## 单人 Boss 的进度对象

单人 Boss 模块区分单 Boss 任务、全局 Boss 任务、天赋完成位、速战次数和限时 Boss 表现；有 12 条 Boss 条目。管理器确认了上述入口与数据结构；完整 Boss 战斗和天赋效果属于战斗执行链。

## 挑战系统结论

PVE 分别保存前置、难度、关卡、楼层、队友资格与奖励进度。剧情强调星数和章节目标，组队副本强调成员资格，塔结合成长门槛与挂机收益，材料本按次数和回合目标供给资源。通过、可挑战、可速通和可领奖具有各自条件，形成多个相互连接的进度维度。


---

# 肉鸽挑战：节点、事件与持久状态

## 独立于普通副本的推进结构

肉鸽模块有挑战状态、节点状态、难度、事件、愿望、购买/升级、任务和保存愿望等对象。普通 PVE 往往是“选关→打完→领奖”；肉鸽需要在一轮内维护选择、节点、资源和战斗后的状态。一轮数据包含当前节点与局内选择的持续状态。

| 状态对象 | 原值 |
| --- | --- |
| 挑战 | doing1、finished2、exited3 |
| 节点 | choose1、doing2、finished3 |
| 事件 | fight1、shop2、reward3、wish4、multiple99 |

难度配置 5 条、节点配置 155 条、事件 93 条、愿望 86 条。节点还有 hard9 等行，所以不能简单把 155 行平均分成当前开放的 5 个难度，也不能称 155 个全部在线节点。[状态定义](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.rogue.manager.const&function=) [难度](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=rogue_hard.rogue_hard&q=) [节点](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=rogue_node.rogue_node&q=)

## 难度解锁的原条件

`is_rouge_difficulty_open`（函数名保留原拼写）先要求配置有效、功能开放，再比较请求难度与 `pass_hard+1`。难度 2 在通过难度 0 时不可用，通过难度 1 时可用；功能关闭时即便已通过也不能使用。用例只替换服务器下发的 pass_hard 和开放状态，实际条件运行原始字节码。[解锁原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.rogue.manager.core&function=is_rouge_difficulty_open)

## 节点推进与选择窗口

`get_next_challenge_info` 在节点状态 choose/doing 时仍返回当前节点，finished 才加一。测试 hard2、node3：状态 1/2 返回 (2,3)，状态 3 返回 (2,4)。`can_select_event` 只允许匹配下一可选难度/节点，不能跨到 5 或其他难度。这是防止 UI 提前跳节点的重要客户端约束。[推进](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.rogue.manager.core&function=get_next_challenge_info) [事件选择](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.rogue.manager.core&function=can_select_event)

## 事件与局内构筑

战斗、商店、奖励、愿望和复合事件走不同数据。商店买入、升级和刷新消耗专属资源；愿望既有当轮选择，又有保存、重置和展示。事件权重表或价格表只是输入，完整选择器与服务端扣款仍需进一步证据。

关卡结束后保存的 HP/挑战状态与新节点关联；退出、完成、进行中不同。新一轮初始化和失败重置不能沿用一般副本的“恢复满状态”假设。这一流程保存当前轮资源、可选事件、当前与历史愿望、战斗结算及节点完成状态。

## 日周额度与愿望保存

杂项原值包括 daily_reward8、累计奖励上限56、wish_reset1、save_wish3、save_wish_after8node，以及愿望重置花费肉鸽币5。值应按调用分支使用：8 个节点后保存的门槛不同于每日奖励 8，不能因数字相同合并机制。[肉鸽杂项](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=rogue_misc.rogue_misc&q=)

下一周重置函数按服务器日历定位周一 05:00。这不是使用本地操作系统时间随意计算。实际服务端刷新、补偿和上一轮保留范围仍依赖回包。

## 失败、重试和数据恢复

事件选择通过服务端回复确认，节点完成由结果更新。恢复入口读取 challenge 和节点状态；完成、退出及进行中具有不同状态，愿望保存受相应结算条件约束。

从设计上，节点内选择、愿望保存和周额度将临时构筑连接到长期收益。收益上限会约束重复刷取，但单凭该缓存不能评估难度曲线、平均收益或最优流派；需要事件选择器和真实战斗数据。


---

# 弹球闯关：布局、计分与关卡曲线

## 独立玩法与运行时入口

`pin_ball_game` 使用独立 Unity 控制器桥接，维护球、道具、50 个布局脚本、分数、波次、结果与网络提交。50 份布局由原字节码执行恢复，加载、球组和结算分支通过原函数验证。

运行时入口 `is_runtime_available` 通过 `pcall(typeof(PinBallGameController))` 判断类型是否存在，`is_feature_available` 调用同一检查。类型可用不等于当前服务器开放；类型缺失时会提示“当前客户端版本暂不支持该玩法”。[入口原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.pin_ball_game.manager.core&function=is_runtime_available)

## 关卡数据由两层组合

关卡配置 ID 70101001～70101050，保存目标、前置、默认球数和奖励。布局脚本保存 canvas、init_balls、initial_units、initial_props 和后续 waves。`load_stage_layout` 取根对象的 layout，并在需要时合并根对象的 canvas/init_balls；不能只读取 layout 子对象而漏掉球数。[布局加载](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.pin_ball_game.manager.core&function=load_stage_layout) [关卡表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=pinball_stage.pinball_stage&q=)

全部画布以配置中的像素坐标呈现；首关为 1080×2400。网站提供初始布局和各个后续波次的 SVG 示意：标注单位 HP、道具 ID、位置与大小。它是布局数据可视化，不是游戏截图或碰撞模拟。

## 初始球组的配置优先级

`build_initial_ball_loadout` 优先采用有效非空的布局球列表；检查球 ID 存在、数量有效且大于 0。空列表或未知球 ID 会回退到配置 `init_ball_count`。首关布局 5 普通+1 大力，实际初始 6 球；末关 10 普通+8 大力，实际 18 球；两者配置默认均是 8。四种分支已执行原函数验证。[球组装](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.pin_ball_game.manager.core&function=build_initial_ball_loadout)

| 球 | ID | base_damage | hit_radius |
| --- | ---: | ---: | ---: |
| 普通球 | 7012001 | 1 | 20 |
| 大力球 | 7012002 | 2 | 20 |

这些是配置基础值；不能在未验证控制器碰撞调用时把 hit_radius 直接当世界单位或计算精确击杀次数。[球表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=pinball_ball.pinball_ball&q=)

## 障碍、增球与爆炸道具

共有 6 条 prop 配置。圆形7011001、三角形7011004、正方形7011005、五边形7011006都是prop_type1，hit_score1、death_score10、move_distance216。增球7011002为prop_type2，hit/death_score都0、move_distance216、add_ball1，描述明确为“下一回合小球数量+1”；炸弹7011003为prop_type2，hit/death_score都0、move_distance0、boom_effect50、effect_r300。不同几何、角度、HP 和位置提供反弹/命中路线的布局差异。[道具表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=pinball_prop.pinball_prop&q=)

`on_kill` 把 active_unit_count 下限钳为 0，并累加死亡分数；死亡计数原为 0 的测试仍保持 0，并获得配置死亡分10。`on_hit/on_kill`通过未命名的0.44函数加分：base_score非0时，增加`base_score×max(1,tonumber(回调第二参数)或1)`。这能确认客户端倍率处理，但第二参数的游戏语义仍需控制器证据，不能自行称为完整“连击倍率”。命中、死亡和倍率参数来自控制器回调；不能在缺完整 C# 桥接语义时宣称任意关卡理论最高分。[命中与计分原指令](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.pin_ball_game.manager.core&function=on_hit)

## 50 关的可量化内容

| 指标 | 第 1 关 | 第 50 关 |
| --- | ---: | ---: |
| 目标分数 | 367 | 2560 |
| 初始球数 | 6 | 18 |
| 初始单位 | 6 | 9 |
| 后续波次 | 3 | 5 |
| 全部波次单位总数 | 15 | 24 |
| 全部单位 HP 总和 | 334 | 3068 |
| 道具总数 | 3 | 5 |
| 奖励 | 强化石×2、金币50,000 | 蓝钻×30、金币50,000 |

50 关目标范围 367～2560。HP 总和只汇总配置中初始与后续单位，不等于目标分数，也不能当难度的唯一指标。增球、炸弹、布局和大力球比例都会改变过程。交互曲线分别画目标分与 HP 总和，避免用同一含义解释。

## 关卡曲线存在三次结构跃迁

第12→13关目标440→745、HP387→848、单位15→19、后续波次3→4，但球组仍为6普通+2大力。第25→26关目标865→1200、HP902→1520、单位19→20，同时大力球2→4，普通球保持8。第38→39关目标1410→2340、HP1580→2908、单位20→24、波次4→5，球组仍10普通+4大力。

目标增幅分别约69.3%、38.7%、66.0%，HP增幅约119.1%、68.5%、84.1%。这些是配置差值，不是实测难度增幅。第13和39关同时加内容但未增加初始球，值得作为体验测试的重点；第26关增加大力球可提供部分补偿。整个50关更适合按1～12、13～25、26～38、39～50四段讨论，而不是假设每关线性增长。仍需碰撞、道具触发和通关记录判断是否存在真实卡点。

## 达标、结束和结果提交

`is_stage_target_reached` 在 score≥target 时返回真，目标≤0也为真。`on_round_end` 重置当轮球计数，并在达标后调用控制器 `RequestFinishAfterRoundEnd`。因此该流程按目标分达标，并在回合末请求结束。[达标](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.pin_ball_game.manager.core&function=is_stage_target_reached) [回合末](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.pin_ball_game.manager.core&function=on_round_end)

`on_stage_finished` 用分数是否达标判 win1/lose2，结果只展示一次。只有获胜且该关尚未完成时发送 `pinball_submit_result`；已通过的重玩和失败不走同一提交分支。四种组合已验证。网络包装发送 `{dup_id,type}`，没有 score 字段；这仅描述客户端接口，不证明服务器会信任任意构造结果。[结束原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.pin_ball_game.manager.core&function=on_stage_finished) [网络封装](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.pin_ball_game.manager.network.network&function=)

## 解锁、奖励与继续挑战

进度由 max_pass_stage_id 等回复刷新，下一关依 `pre_dup` 关系查找；请求成功再更新入口红点、待展示奖励和关卡列表。结果页支持下一关、重试、返回，且下一关还要过解锁检查。首次奖励由提交回复刷新，重玩结果展示与背包到账分别处理。

客户端代码确认布局、状态与提交条件；碰撞判定、反弹参数、道具实际触发次数和服务端奖励校验尚待完整 Unity 桥接或实际运行记录补齐。


---

# 公会组织、权限与团体战

## 组织功能与跨系统关系

客户端包含创建/搜索/申请/审批、邀请、任免、退出/踢人、公告改名、捐献、建筑、商店、愿望帮助、试炼、选举、弹劾及团体活动。公会关系又被农场、家园、拍卖、聊天和多个战斗玩法引用，属于跨系统组织层。[公会管理器](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.alliance.manager.core.core&function=)

## 九种职位与权限配置

职位表有 9 条：会长1、副会长2、主理人3、执事4、精锐5、佳人6、指挥7、正式成员10、临时成员11。**ID不连续**，表中没有职位8/9。权限由职位行的 rights 列表决定，职位 ID 与显示顺序独立。[职位表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=alliance_status.alliance_status&q=)

`has_right_for_operate` 调 `DataConfigs.alliance_status.get_status_cfg`，再在 rights 中查指定 ID；未知职位返回 false。实测职位1/2有权限1，职位4无权限1但有权限4，正式成员10无权限3，职位999无权限1。这里测试实际权限查找代码，未伪造职位与权限对应关系。[权限原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.alliance.manager.core.core&function=has_right_for_operate)

权限定义相关表 15 条，但职位 rights 中出现 16；会长 rights 示例不含 7。因此不能未经调用点核查把权限1～16依次写成完整连续菜单。踢人额度也不同，会长30、副会长15、主理人5为职位表的kick_limit原值，是否刷新及例外需沿使用处核对。职位表还含人数num、分红exp_percent、battle_buff和limits；佳人与精锐行有明确性别提示，说明职位除管理权外还关联收益和资格。[职位有效表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=alliance_status.alliance_status&q=) [公会杂项](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=alliance_misc.alliance_misc&q=)

## 成员生命周期与组织限制

搜索/申请和自动通过资格分开；本地已申请列表与服务器成员列表也分开。加入冷却、改名冷却、公告冷却和任免权限有不同检查。当前公会、目标公会、系统公会和临时成员具有各自状态。

选举还有阶段标志、响应期限和结果展示；弹劾/交接流程不等同于直接改 leader_id。请求成功后才刷新成员/职位、组织红点和其他系统关系。功能目录提供请求符号，但请求名有前缀包装和回调，不能把符号数量当真实协议端点数。

## 公会建筑与协作经济

相关配置含 6 类建筑方向，主建筑、金库、房间/共享、商业等由原表字段确认；捐献、建筑升级、商店货币、订单求助、愿望、试炼奖励各有状态。客户端 `is_func_destroy_by_invade` 还表明组织场景存在战斗后功能状态分支，建筑升级与战后可用状态分别维护。[公会管理器](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.alliance.manager.core.core&function=)

奖励提醒分成捐献、商店、经营、愿望帮助、试炼伤害进度/等级进度等。公会钱包和个人背包分别维护来源、权限及扣款接口，组织账本与个人库存由各自状态管理。

## 团体活动的独立对象

| 模块 | 客户端结构 | 证据范围 |
| --- | --- | --- |
| alliance_raid 讨伐 | 活动开放/结束/战斗中，Boss HP，地图进入，抢夺资格，参与/惊喜奖 | 指令与入口复核 |
| alliance_conquest 征战 | 进入资格、参与/惊喜奖励、跳转 | 结构索引与入口核对 |
| territory_battle 领地 | Boss 资格、地图、结算胜负与惊喜奖 | 结构索引与入口核对 |
| alliance_battle 公会战 | 活动与模块开放、膜拜、进度/成就、战报、历史已读 | 结构索引与入口核对 |

另有扫雷、宝藏、集结、宴会等模块。它们与公会成员关系相连，但活动时间、挑战次数和积分不共享。[讨伐](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.alliance_raid.manager.core&function=) [领地](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.territory_battle.manager.core&function=) [公会战](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.alliance_battle.manager.core&function=)

## 职位的管理与收益分工

| 职位 | ID | 配置名额 num | rights 数量 | kick_limit | exp_percent |
| --- | ---: | ---: | ---: | ---: | ---: |
| 会长 | 1 | 1 | 14 | 30 | 10 |
| 副会长 | 2 | 2 | 9 | 15 | 10 |
| 主理人 | 3 | 3 | 7 | 5 | 10 |
| 执事 | 4 | 4 | 2 | 未配置 | 10 |
| 精锐 | 5 | 4 | 0 | 未配置 | 10 |
| 佳人 | 6 | 4 | 0 | 未配置 | 20 |
| 指挥 | 7 | 2 | 0 | 未配置 | 10 |
| 正式成员 | 10 | −1 | 0 | 未配置 | 未配置 |
| 临时成员 | 11 | −1 | 0 | 未配置 | 未配置 |

上述为字段原值，−1 的名额和分红换算需要结合调用处解释。佳人、指挥可配置 battle_buff=187；管理职位与精锐配置 186。由此可见，管理权、组织职位与收益参数是独立维度。指挥的名称不直接授予 rights，具体操作仍走权限查询。[职位配置](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=alliance_status.alliance_status&q=)

## 组织结构的作用

职位权限约束管理行为，名额与收益参数分配组织角色，愿望和互助提供日常协作，团体战与组织奖励提供周期目标。家园、农场和拍卖进一步建立成员之间的经济联系。

服务器分组、组织匹配、占领结算和奖励分配属于权威组织数据。客户端确认成员与权限快照、活动状态、地图入口、组织／个人额度和领取进度的分工。公会形成跨越战斗、生产与社交的组织层。


---

# 好友、聊天、师徒、婚姻与互动

## 关系层的对象边界

本服好友、跨服好友、黑名单、师徒关系、婚姻伙伴、公会成员和临时队伍是独立关系。多个系统都传 role_id，但跨服还需要 server_id 等上下文；不能用昵称作为唯一键。关系状态变化会影响邀请、私聊、亲密效果和场景访问。

## 好友：申请、确认、删除与黑名单

客户端维护本服和跨服两套列表、申请、推荐、搜索、批量添加、接受/拒绝、黑名单及删除流程。`friend_confirm_intimacy_effect` 与跨服对应请求独立，亲密效果确认不是自动接受好友的同义操作。[好友原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.friend.manager.core&function=)

状态文本区分离线、组队、战斗。通知还受设置、当前战斗和消息提示关闭状态影响。已查看申请的本地键、服务器申请列表和最终好友关系不同：打开申请页面可以清提醒，不能直接把所有申请变成好友。

## 聊天与频道

chat 命名空间有 137 个脚本，含渠道、消息表现和扩展。消息可以引用战报、物品、共享订单、求助、家园方案等交互对象；点击链接应按当前资格跳转，而不是只显示一段文本。语音聊天、实时语音房间、AI 回复和虚拟聊天配置各有独立模块。

fake_chat 和 chat_ai_reply 提供演示与自动回复相关结构。需要实际发送来源、标志和服务器链条才能区分真人、演示或系统内容。相关模块提供消息及接口结构；在线消息来源比例需要发送记录。

## 师徒：关系数量、招募和任务

师徒模块区分教师/学生身份、关系 ID、毕业/未毕业人数、招募、申请列表、处分申请、解除及解除惩罚期。`reach_teacher_limit` 与 `reach_student_limit` 是独立资格；招募资格由身份、关系数量及相应配置共同决定。[师徒管理器](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.tutor.manager.core&function=)

解除关系可能先请求再确认；取消解除亦有路径。师徒任务分教师任务、学生任务和关系任务红点，任务完成后要经过奖励领取状态。具体数量上限、惩罚时间和任务投放以相应配置及回包为准，数量上限与惩罚生效以具体配置和关系回复为依据。

## 婚姻：预留、求婚、婚礼与培养

婚姻模块含恋爱信件、求婚通知、婚礼、预约/预留邀请、伙伴姓名异步获取、约会任务、培养技能和离婚资格。预约入口是否启用、婚礼档次资格、队伍邀请及对方确认分别处理。[婚姻管理器](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.marriage.manager.core&function=)

`marriage_handle_propose`、`marriage_handle_open_wedding`、`marriage_enter_wedding` 等调用表明接受关系、举办婚礼、进入场景是不同操作。培养红点与未读一次性提示也分开。不能凭对象有 partner 就自动开放所有婚姻场景。

## 多人场景与休闲互动

大场景管理角色、移动、互动对象和子场景；家园房间按房主、成员状态、准备确认维护，支持躲藏/绘画语音房间等分支。你画我猜、音乐会、宴会、小游戏等有各自模块。角色在房间、家园聚会和观看中的状态并非同一位置布尔值。[家园房间](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.home_room.manager.core&function=) [多人场景](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.big_scene.manager.core&function=)

这些内容构成战斗之外的交流和表达空间。活动实际可用性、同步人数、房间容量和主持流程还需要当前运行状态；结构目录列出已识别的处理函数，避免将“缓存有模块”当成完整体验测试。

## 邮件、分享与邀请

邮件可包含奖励和跳转链接，阅读、领取、删除应分状态。平台分享、好友邀请、群俱乐部、订阅消息和邀请码同样有 SDK/平台资格。农场共享订单、战报回放、家园复制的聊天消息属于业务对象链接，不应当作外部网页 URL 直接打开。

## 关系系统结论

好友提供联系与邀请，师徒以身份和任务组织成长协作，婚姻以确认、场景和培养扩展长期关系，公会与队伍提供不同范围的集体身份。邮件、聊天链接和场景访问把关系连接到具体业务对象。每类关系维护独立资格、确认和已读状态；亲密收益、推荐排序及审核规则由相应服务端数据决定。


---

# 家园：布置、职业、制造与访问

## 一套可编辑、可访问的场景系统

家园维护方案、地形、家具/摆放物、区域、职业、制造、魅力、照片、访问和聚会。农场位于相关场景体系，但有独立土地、作物与订单状态，后章单独说明。切换家园、回自己的家园、重新进入以及场景内区域归属有不同处理。[家园管理器](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.home.manager.core&function=)

## 布置方案与编辑操作

摆放、更换、移除物品，替换/擦除地形，预览和保存方案是不同操作。编辑数据分别维护所有权、库存、摆放实例、预览与保存方案。多个方案允许玩家在保留库存的同时切换布局；复制他人方案又增加缺料检查与购买提示。

杂项配置有 5 个方案、复制费用家园币 `1160020001×100`、每日被复制上限3等原值。复制资格、私密设置和目标预览需先确认；本地预览并不已经扣币或保存。[家园杂项](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=home_misc.home_misc&q=)

## 复制他人方案的完整链

请求目标方案 → 获取预览和已摆放物 → 比较自己缺失物品 → 展示缺料/购买路径 → 确认继续 → 提交复制 → 成功后更新方案。`try_continue_duplicate_plan_from_other_preview` 与最终继续复制是分开的。预览 URL 缺失也有独立查询，复制对象为布局方案和物品实例。

家园复制包含私聊消息发送分支，使方案复制与玩家之间的交流连接。[复制原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.home.manager.core&function=try_copy_other_home_plan)

## 三种职业与职业升级

职业表有园丁、工匠、厨师。杂项配置职业更换参数14天。职业等级提升检查上限、下一行、魅力要求与第一项消耗材料余额；编辑器 GM 分支不能推广为普通玩家免费升级。[职业表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=home_job.home_job&q=) [升级原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.home.manager.core&function=check_job_level_up_enabled)

职业每日奖励、职业升级、帮助制造和魅力奖励有各自红点。制造需要目标物、进度和帮助对象；走到目标后帮助、取消前往目标的处理也分开。`help manufacture factor=13333` 是原参数，未沿所有制造使用处验证前不直接宣称某个实际提速百分比；每周帮助5次亦应按实际额度数据使用。

## 魅力奖：三态与初始化边界

`get_charm_reward_state` 返回 0未达、1可领、2已领。魅力99/阈值100返回0；魅力100且未领返回1；在已领列表中返回2。即使魅力足够，如果领取列表尚为 nil，该函数也返回0，该条件把数据未初始化归入不可领取状态。[魅力原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.home.manager.core&function=get_charm_reward_state)

魅力同时用于职业与奖励门槛。最终魅力还涉及家具评分、摆放折算和服务器规则，此处确定的是奖励查询函数的三态契约。

## 照片、点赞、访问与聚会

照片数据与“已查看照片”本地标志分开；保存、展示与点赞还有自己的请求和记录。杂项有点赞日上限100、场景人数10等原值。派对、绘画房间、观看、重连和回自己家园各有分支；人数参数不应自动套到所有子房间。[家园房间](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.home_room.manager.core&function=)

## 家园系统结论

布局方案提供表达空间，职业与制造提供成长，访问、照片、复制与帮助提供关系行为。复制传播可编辑方案，并通过库存和费用约束保持生产价值。魅力奖励采用未达、可领、已领三态，数据初始化也参与资格判断。家园同时承担空间编辑、资源生产和社交展示。


---

# 农场：种植、偷菜、订单与协作

## 八种土地操作

操作类型 sow1、harvest2、watering3、fertilizing4、steal5、drive_away6、eliminate7、cancel_steal8。每一种资格不同；土地有无作物、作物阶段、归属、浇水记录、偷取记录、当前偷取者及关系状态都可能影响按钮。[操作定义](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.farm.manager.const&function=) [农场原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.farm.manager.core&function=)

## 播种与收获

播种要求土地存在、没有作物，且传入归属时为自己的土地。收获要求成熟阶段10、归属自己、没有 active_thief>0；成长阶段9不满足。收获同时要求成熟和当前没有 active_thief。[播种](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.farm.manager.core&function=can_sow) [收获](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.farm.manager.core&function=can_harvest)

种子、消耗库存与作物模板分开。快速播种、收获、浇水和施肥按批量入口处理，每块地仍有独立资格与回复结果。

## 浇水的归属、阶段与额度

浇水要求有成长中的作物，不是成熟阶段10；所检查归属不能是自己，且自己未对该株浇过水；按调用参数还要检查当日额度。原函数验证正常给他人浇水可用、给自己不可用、成熟不可用、5/5次用完不可用、同株已浇不可用。[浇水原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.farm.manager.core&function=can_watering)

第三参数决定部分限制检查，本节验证使用 false 分支。入口调用参数与土地状态共同决定资格。

## 偷菜需要七类条件

成熟10、不是自己的土地、无当前偷取者、不是同公会、当天剩余次数、该株偷取人数未满、自己未偷过。配置 `veg_steal_percent=[20,10,10]` 的长度使该分支最多记录3个偷取角色；这与另外“同时偷3块”“土地最大偷取2”等杂项参数不是同一个统计口径。[偷取原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.farm.manager.core&function=can_steal)

实测正常允许；未成熟、正在被偷、同公会、10次用完、已三人偷取、自己已在列表均拒绝。驱赶、取消偷取和清除另有流程，还可能进入战斗/回放。界面需要清楚显示正在偷和已经偷的区别。

## 配置规模与数值口径

| 配置 | 数量/原值 | 解释 |
| --- | --- | --- |
| 初始地块 | 6 | 仍需账号解锁数据 |
| 每日浇水/偷菜 | 5 / 10 | 客户端读取实际次数后判定 |
| 偷取时间 | 600 | 使用处确认单位后才能换算 |
| 作物模板 | 11 | 包含季节作物 |
| 种子配置 | 8 | 种子与作物不一一同表 |
| 建筑行 | 145 | 有等级变体，非145栋独立建筑 |
| 订单行 | 20 | 包含类型和品质机制 |

例如“睡蘑菇”时间字段28800、季节南瓜7200且部分收获字段−1；特殊值不能直接当普通产量。种子随机权重示例5项1000、5项150，总5750。可比较相对权重，但未追选择器时不应把它直接公布为权威抽取概率。[作物](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=farm_crop.farm_crop&q=) [种子](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=farm_seed.farm_seed&q=) [杂项](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=farm_misc.farm_misc&q=)

## 普通订单与共享订单

提交订单要求剩余提交次数、订单及配置存在、每项背包库存足够。共享订单还有独立额度、分享与协作状态；分享积分阶段奖分未达、可领、已领，日/周记录独立。接单、分享给聊天、求助、完成、领取不能简化为一次卖菜。[订单原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.farm.manager.core&function=can_commit_order)

建筑升级也可能受其他建筑等级限制，形成联动门槛。订单刷新次数购买是额外消费，不应混入基础提交费。

## 共享订单的双层资格

can_commit_share_order 先调用 can_commit_order(0)，读取共享订单并执行普通剩余次数、订单配置和材料检查；通过后再比较已提交共享次数与 share_order_commit_limit。该上限配置为 3，已用 2 次可继续，已用 3 次拒绝。普通额度不足也会先行拒绝。[共享订单资格](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.farm.manager.core&function=can_commit_share_order)

普通订单要求 accept_cost_item_list 非空，逐项按物品 bag_type 查询库存；库存等于需求可通过，低于需求拒绝。共享提交每次积分配置为 1，阶段目标为 1、2、3、5、8，奖励分别读取独立列表。订单提交、共享额度和累计积分因此形成三层状态。[普通订单资格](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.farm.manager.core&function=can_commit_order) [订单杂项](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=farm_misc.farm_misc&q=)

## 生产与社交的连接

种植形成时间投入，浇水和共享订单形成协作，偷取与驱赶形成争夺，建筑及职业连接长期成长。土地归属、作物阶段、互动历史与次数共同决定每一步操作。生产收益取决于上述状态以及实际结算；社交关系直接参与操作资格。


---

# 资源经济、抽取、商店与交易

## 资源账本先于奖励动画

金币、蓝钻、晶石、技能知识、武器券、家园币、肉鸽币、公会货币和活动代币有不同用途。配置奖励列表可以确定候选投放；玩家实际余额由背包/货币回包更新。显示奖励弹窗不能替代扣款和到账确认。

物品中文索引提供 17,450 个名称，方便查询 ID；它合并名字用于检索，不是某区服完整生效配置的合并器。未知名字保留 ID，避免猜物品含义。

## 日常活跃：两条投放分支

活跃箱在20/40/60/80/100档。一个分支合计金币5,000,000、技能知识2,000、强化石20、武器券5、蓝钻100；另一分支金币500,000，80档券种不同，为1413010001。差异说明不能按同一组名字跨服直接比较收益。[任务/活跃配置](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=task_liveness.task_liveness&q=)

任务候选约7,004条，是缓存候选集合，不能说玩家每天有7,004个任务；`_0/_543` 约80条覆写也不能直接累加为每日任务数。日常资源对技能升级提供回流，但用单日静态总量推算毕业天数还需任务资格、掉落、活动和消耗竞争。

## 抽取：消耗、保底与概率分开

基础抽取配置6条，含999等测试门槛。武器抽取101以武器券消耗；保底类型8/7对应红武器60、神器心200等配置；另有每10紫、每80橙分支和锁定9/10规则。不能把所有池合并成“全局40抽保底”。[抽取基础](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=gacha.gacha&q=)

池配置约200行包含 pool_id/count 等，不是完整基础概率表。愿望/UP 10000、5000等值要追权重和选择器后解释，不能直接公布成100%/50%掉率。保底触发的重置、累计与领取状态也需要接口返回确认。

## 普通商店与动态库存

普通商店基础约2,529行、46分类，分片 `_0`23、`_543`28。购买次数、刷新、限购与动态库存读服务器列表；推送可以删除或新增库存。静态 shop 表不是实时货架，多个入口也可能使用不同货币。[商店管理器](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.shop.manager.core&function=)

## 贸易参数：已确认万分单位

`trade_misc` 的 item_cid 为1001010002，price_increase_premium、system_tax_rate、limit_up_ratio、limit_down_ratio均1000。原函数除以10000，四项返回0.1，故本分支可解释为10%。这来自执行验证，不是看数字自行套百分比。[贸易原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.trade.manager.core&function=get_trade_shop_system_tax_rate) [贸易表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=trade_misc.trade_misc&q=)

涨跌显示先夹在上下限，再乘显示倍率；非整数用 floor 截一位小数。ratio0.02349、倍率100显示2.3%；−0.02349显示−2.4%，负数向下而非向零。展示舍入不一定是服务器交易金额的舍入。[比例显示](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.trade.manager.core&function=get_ratio_keep_one_decimal_digit)

购买可以带价格确认值，并进入成本确认界面；不能把静态基础价当实时成交价。交易商店、玩家挂单、拍卖的对象和钱包还要分开。

## 拍卖和玩家市场

客户端存在上架、调整价格、购买、下架、提取货款以及竞价、直购、关注/自动竞价等分支；世界、公会、区服拍卖有独立通知和跨服信息。不能把贸易商店税率直接套在所有拍卖接口。

`auction_misc` 29项含 tax[1000]、cool_time[30]、extend_time[300]、截止23:00、系统竞价22:00、start[[21,0],[24,0]]等原值。它们属于不同活动对象/时段；完整日程、时间单位与成交税仍应跟具体使用函数闭合，本报告不把它们拼成所有拍卖统一开放时间。[拍卖杂项](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=auction_misc.auction_misc&q=) [交易管理器](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.trade.manager.core&function=)

## 动态价格、涨停与购买溢价

贸易商品 ratio 以 10000 为中性基准。get_abs_change_ratio 返回 abs(ratio−10000)/100，因此 11000 表示相对基准的 10 个百分点，9900 表示 1 个百分点的绝对变化。ratio 缺失时该查询返回 0。[涨跌计算](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.trade.manager.core&function=get_abs_change_ratio)

is_limit_up_ratio 使用未换算的 limit_up_ratio=1000，比较 ratio≥10000+1000。达到 11000 后，get_trade_shop_price 把服务器当前 price 乘 (1+0.1) 并 floor，得到购买调整价；低于阈值保持当前 price。原函数示例：

| 服务器 price | ratio | 当前价格返回 | 调整买价返回 |
| ---: | ---: | ---: | ---: |
| 101 | 10999 | 101 | 101 |
| 101 | 11000 | 101 | 111 |
| 101 | 11001 | 101 | 111 |
| 101 | 缺失 | 101 | 101 |

函数同时返回限购、number、库存相关标志与货币类型；商品不存在时返回零值分支。购买调整价和涨跌展示采用不同计算，服务器确认值仍参与交易请求。[涨停判断](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.trade.manager.core&function=is_limit_up_ratio) [价格查询](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.trade.manager.core&function=get_trade_shop_price)

## 资源结构与经济结论

已确认多种通用/专用货币、日周额度、随机获得、直购、交易税与动态货架共同构成资源产生和消耗。抽取、培养、外观、家园与活动竞争同一部分资源，可通过配置做静态成本对比。

完整通胀、最优投入、付费价值和交易套利需要在线价格、真实掉落、账号资格和统计数据；不能从一组客户端候选表给出保证收益。本报告的计算器只做明示公式的静态核算。


---

# 充值、月卡、广告与通行证

## 付费链与领取链分开

充值订单、平台 SDK 成功/取消、服务器确认、物品到账、首次奖励和季节首次奖励是不同阶段。客户端有428条商品候选，不代表当前账号全部可购买。云审核开关、平台、活动和商品可用状态还会限制入口。[充值网络](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.recharge.manager.network.network&function=) [商品表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=recharge.recharge_goods&q=)

配置例：商品1 price6、gem_reward60、晶石×60、首次蓝钻×60、季节首次×30；商品2 price30、gem_reward300，部分购买/首充奖励独立。price 是配置价格字段，当前结算价格和币种由平台及服务器确定。订单 ID 连接支付结果和服务器确认，物品到账由账户回复处理。

## 月卡激活的时间边界

月卡2条，ID9/10，duration30、各自max_buy4；杂项另有month_card_max_buy18，不能用一个上限替代另一个。`is_month_card_activated` 要功能开放、信息存在且expired_time>server_time；恰好等于到期时间就不激活。四种时间/开放组合已验证。[月卡原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.month_card.manager.core&function=is_month_card_activated) [月卡表](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=month_card.month_card&q=)

| 月卡 | 日奖励配置 | 连续30天全部可领时的静态合计 |
| --- | --- | --- |
| 9 | 蓝钻100、武器券10 | 蓝钻3000、武器券300 |
| 10 | 蓝钻150、物品1213010002×10 | 蓝钻4500、该物品300 |

合计是假设每天都符合资格且领取，不是保证到账。续费、叠加期限、每日已领和补领由数据/服务器规则处理。

## 特权参数的累计

`is_has_privilege` 遍历有效月卡特权，将匹配参数的正值累计返回；调用者可能用非零作真假，但原值是数量或系数，可以大于1。返回值保留累计参数，用于数量或系数计算。试用特权另有6条配置，含86400、cd300等字段；要按调用处分别解释时长与冷却。[特权原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.month_card.manager.core&function=is_has_privilege) [试用特权](https://chitanda233.github.io/dandanxingqiu-research/review/configs.html?table=month_card.privilege&q=)

## 激励广告：额度、冷却与奖励确认

`get_advert_watch_state` 在daily_cnt≥daily_all_cnt返回−1；否则若pre_time+view_interval−now>0，返回剩余秒数；冷却到点返回0。无信息时本地也返回0，但不证明服务器会允许观看或发奖。

测试次数0/2、pre100、interval30，now129→1，now130→0；次数2/2、now140→−1。SDK加载、播放成功、取消/失败和服务器领奖是独立步骤，平台成功回调不能直接等价奖励到账。[广告原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.advertisement.manager.core&function=get_advert_watch_state)

## 通行证：等级、双轨与已领进度

普通与进阶轨道分别保存normal_level/advance_level，是否购买由独立状态确定。锁定判断包括目标等级超过当前等级，或付费轨未购买。可领奖要求达到等级、该轨已解锁、目标超过该轨已领取进度。[通行证原函数](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.battle_pass.manager.core&function=get_item_can_get)

原函数验证：当前10、普通已领9，普通目标10可领；已领10就不可再领；进阶目标6未购时锁定，购买后可领，advance已领6则不可再领。周经验99/100未达上限，100/100和101/100达到。等级、购买资格与领奖进度分别决定锁定和可领取状态。

通用通行证另有get_common_state：0未满足/无相关数据，1有可领项，2终档已领；按目标等级查询与按整个通行证查询的路径不同。节日团队通行证还有邀请、队长、队员、退出费用和共同进度。[团队通行证](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.festival_battle_pass.manager.core&function=)

## 首充、礼包和活动商品

首充、等级礼包、强化礼包、挂机礼包、七日、任选礼包和活动礼包均有单独入口或配置。免费领取、直购、代币兑换和已购奖励不可用同一价格字段处理。月卡期限、限购刷新、首购条件和活动剩余时间应在购买确认前展示。

设计上，商业化与武器抽取、培养资源、日常效率、活动进度和外观相连；实际付费优势和商品性价比需要当前商品、在线收益和服务器规则，缓存候选价格只能支撑静态说明。


---

# 活动、任务、福利与长期运营

## 活动对象与子功能

客户端有春节、圣诞、万圣节、周年、七夕、中秋、五一、儿童节、双十一、开服、合服、回归、赛季等模块，也有festival、activity、activity_role、season_activity等通用层。模块存在说明构建支持相关逻辑，实际开放由服务器时段和账号状态决定。

## 三类活动状态来源

活动列表/动态活动决定入口和时段；活动角色数据决定个人状态；任务、商店、抽取、排行榜和通行证决定子功能。同一活动的签到开放、兑换开放和排行榜开放可能不同。通用层的 upsert/delete 通知会增删活动对象，页面随动态活动对象更新。

活动按 ID/type、开始/结束、开服日、区服与云开关形成筛选；分片配置还会改变奖励和门槛。通用调用关系确认了活动对象与子功能分工；节日小游戏的具体公式以各自配置和执行链为依据。

## 任务的条件、进度与领取

任务客户端保存配置、进度、状态、类型、跳转、条件和领奖。完成状态与已领取不同；红点通常根据可领取或未查看条件派生。日常、成就、师徒、公会、活动、通行证任务可能共享任务层，但奖励计入不同账本。

任务数量是候选表规模，不是当前玩家列表规模。日周刷新还依赖服务器时钟、服务器刷新数据与活动周期；刷新依据服务器时间和回复执行。[任务管理器](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.task.manager.core&function=)

## 星系循环活动作为复合活动例

`galactic_cycle` 管理签到、任务、愿望、商店、排行榜；分别有is_sign_open/is_task_open/is_wish_open/is_shop_open/is_rank_open。愿望保存轮次、等级、已完成轮、可选物、当前/上一池；签到区分某日可签、已签和未签；兑换要求活动物品与限购状态。[星系循环](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.galactic_cycle.manager.core&function=)

活动奖励结束后还可能有展示缓存与待弹奖励；本地save_wish_get_items属于展示暂存，不是背包持久账户。把所有子页用一个is_activity_open开关控制会漏掉这些阶段差异。

## 福利、签到、追赶与回归

七日目标、七日签到、进度奖励、等级礼包、离线收益、追赶系统、回归活动各有自己的领取与时间对象。离线信息可以是服务器计算的收益和时长，不应在客户端随意按墙上时钟累乘收益。追赶可能调门槛或资源，但需要对应生效行，不能一概声称自动补全所有养成。

## 排行与竞争活动

排行榜分个人、公会、服务器、活动和历史；`rank`、`rank_pop`与玩法内排名数据都存在。显示排名、领取奖励和历史已读是不同状态；榜单中的积分定义取决于活动，不是统一战力。

活动银行、红包、抽奖、幸运箱、任选礼、挖星、海盗岛、月盒等提供不同消费和奖励交互。目录保留精确模块名和请求，中文研究别名仅用于导航。抽奖模块有池不代表概率已经公开或逆向闭合。

## 设计分析：三种节奏叠加

日常推动短会话，周/赛季推动长期挑战，节日与开服活动改变资源投放和目标。公会、师徒和团队通行证又叠加共同进度。时间门槛、库存限额、领取状态和推送刷新共同决定活动在各阶段的可操作内容。

实际运营日历、活动参与率、奖励预算和付费转化都需要在线信息。本文说明客户端支持的活动机制，实时排期由服务器活动列表确定。


---

# 技术架构与研究方法

## 资产与代码组织

原始资料由主 wxapkg、两份 wasm 包和 23 份 Lua AssetBundle 组成。Unity TextAsset 包含 8,272 份 Lua 5.1 字节码，全部可解析函数原型、常量、嵌套函数、指令和行号。Bundle 载荷与提取文件逐字节一致，来源清单记录 SHA-256。

Unity 提供场景、UI、对象类型、渲染、声音和平台桥接；Lua 管理业务数据、状态、配置与交互。缓存目录版本 242 是包目录标识。资产 path_id 定位 Unity 对象，业务 ID 索引角色、技能、道具与关卡。

## 业务模块分层

game.module 命名空间组织业务，常见结构包含 manager、data、network、const、event 与 view。管理器处理资格、入口和红点；数据层维护回复和派生状态；网络层包装请求及注册回调；界面层读取这些对象构造交互。

多个功能共享账号、背包、时钟、活动和开放状态。农场监听公会关系，家园监听活动与库存，商业化读取开放状态，战斗读取玩法和养成数据。模块通过请求回复与事件连接。

## 反编译与指令分析

高层反编译辅助阅读调用关系与变量用途；原指令确认条件方向、提前返回、取整、赋值及闭包捕获。3,088 份管理器和战斗指令列表保留 PC 与跳转目标。闭包名称根据赋值识别，缺少可靠名称的函数以 0.44 等原型路径定位。

LuaDec、unluac 对复杂控制流及缺少调试信息的函数可能出现结构恢复误差。具体规则由原指令、配置与执行结果交叉确认。剧情连续挑战的固定返回、贸易涨停价格和 HP 边界均可直接定位原函数。

## 有效配置恢复

配置执行真实字节码和相对 import 依赖。元表 __index 默认字段与本行覆盖字段共同构成有效记录。基础、区服和等级分片独立保存，选择和合并顺序取决于业务加载器。

1,555 份导出中有 1,552 份纯数据表、1,534 份非空纯数据表。hook.buy_init、hook.hook_init、hook.buff_init 含函数值，以标记保存。fight_map.editor.editor3～editor7、fight_map.normal、fight_scene.normal 共 7 个候选未返回可导出表。

执行器设置内存与指令预算，隔离文件、系统和 Python 接口。size_t 宽度进行结构重打包后在内存加载，源文件保留原始字节序列。

## 原函数受控执行

144 个场景覆盖战斗属性与轨迹、技能、宠物、剧情与塔、肉鸽、弹球、农场、公会、家园和商业化。109 个场景保留显式预期断言，35 个保留输入与返回记录。

账号、引擎、库存、时钟与网络依赖以明确替代对象注入，实际条件和计算运行原始字节码。未配置外部调用会报错。结果说明给定输入下的客户端契约，线上账号与服务器属于另一层证据。

## 四层状态及权威来源

| 状态层 | 对象 | 更新方式 | 业务作用 |
| --- | --- | --- | --- |
| 服务器持久状态 | 余额、实例等级、关系、进度、领取记录 | 回复与推送 | 所有权、成本与最终奖励 |
| 客户端派生状态 | 红点、排序、推荐、按钮资格 | 对数据和配置求值 | 操作入口与提醒 |
| 展示缓存 | 候选预览、待弹奖励、已查看标志 | 页面及表现流程 | 确认、展示与通知 |
| 引擎瞬态状态 | 弹体、动画、控制器、相机 | 场景及逐帧更新 | 表现和运动 |

宠物洗练、家园预览和抽取待展示结果体现持久状态与展示缓存的区分。战斗节点连接服务器结果与引擎表现，直接 HP 同步由这一契约解释。

## 平台、云配置与开放状态

登录、分享、订阅、邀请、实名与充值包含微信、字节小游戏、快手等平台分支。cloud_data 处理按玩家或日期组织的云键、读写与开关，包含充值审核判断；云数据加载和业务初始化存在先后依赖。[云配置](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.cloud_data.manager.core&function=) [登录](https://chitanda233.github.io/dandanxingqiu-research/review/evidence.html?module=game.module.login.manager.core&function=)

可用性由配置、服务器状态、平台条件和运行时依赖共同决定。弹球检查 PinBallGameController 类型，充值读取审核开关，分片后缀由选择器解释。网络字符串包含协议、包装与回调，作为定位索引使用。

## 引擎与服务器边界

Lua 说明输入、状态、布局和回调计分；Unity 控制器执行碰撞与部分场景行为。弹球 hit_radius、炸弹范围与反弹布局需要结合控制器确定实际物理语义。

服务器最终伤害、匹配池选择、机器人投放、随机抽取与奖励发放不包含在这些客户端业务函数中。报告记录已确认接口、参数和结果字段。

## 报告与数据查询

网页采用静态 HTML、CSS、JavaScript，配置和指令按需加载。章节链接定位模块、函数、配置表及记录；技能预算、模式对照和弹球布局使用同一份有效数据。哈希、执行输入与返回提供可追溯性。

**技术结论：Unity 表现层、Lua 业务层与服务器持久状态分工。数据驱动配置、事件更新和分层状态使大量玩法共享基础设施，同时保持各自的资格、额度与结果契约。**


---

# 综合结论与系统设计分析

## 一、操作、构筑与长期进度共同组成产品核心

单局决策包含位置、角度、力度、风、技能资源和行动时机。构筑由武器、技能、宠物、装备及模式平衡组成。培养结果进入战斗配置，战斗与挑战结果再进入资源、任务和赛季进度。

这条链使短期操作与长期投资持续相连。竞技中的属性替换限制普通面板直接迁移，技能来源、武器机制和宠物选择仍形成差异。竞争条件是模式规则、属性处理和构筑选择的组合。

## 二、玩法通过不同的状态对象产生差异

| 玩法 | 推进对象 | 核心决策 | 收益约束 |
| --- | --- | --- | --- |
| 竞技 | 队伍、比赛、杯数和赛季 | 配合、构筑、操作与目标选择 | 模式收益、保护及赛季状态 |
| 剧情与组队副本 | 关卡、难度、星数和队伍资格 | 挑战、速通与协作 | 首通、星奖、日周额度 |
| 塔 | 楼层、战力、Buff、自动和挂机 | 层数推进与速通条件 | 层奖、阶段奖与开服天数 |
| 材料本 | 系列、完成回合和奖励次数 | 资源目标与回合效率 | 次数奖、回合奖及排名奖 |
| 肉鸽 | 当前轮、节点、事件和愿望 | 临时构筑、购买与事件选择 | 日周收益和愿望保存条件 |
| 弹球 | 球组、布局、波次与目标分 | 路径和道具利用 | 分段内容曲线与首次胜利提交 |

各玩法通过不同状态和目标提供内容层次。胜利、完成推进、拥有领取资格和实际收到奖励是独立事件，客户端分别处理。

## 三、成长使用多条门槛共同控制节奏

技能培养同时受材料、角色等级、任务、其他技能培养与开服天数限制。武器高阶要求账号等级与长期开服条件；宠物学习槽按等级逐步开放并消耗不同数量材料。由此形成资源、个人进度与服务器进度三条约束轴。

冰冻技能 40→80 的每十级配置成本均为知识 75,000、金币 1,500,000；该段占满级累计知识约 66.1%、金币约 65.1%。高等级阶段以稳定的边际消耗维持资源需求，角色与开服条件调节可进入该阶段的时间。

**结论：成长曲线采用阶段门槛和持续消耗。静态预算能够确定培养成本，毕业时间还取决于实际收入与其他系统的竞争消耗。**

## 四、社交通过资格、协作与资源关系进入游戏

公会职位包含权限、名额和收益参数；农场偷取排除同公会对象，浇水和共享订单提供协作行为；家园职业、制造帮助、照片与布局复制连接生产和表达；师徒、婚姻维护专门的关系任务与培养状态。

社交参与资源流与操作资格。公会、好友、临时队伍各自维护身份和权限，组织奖励与个人背包使用不同账本。成员关系变化会触发其他系统重新计算资格和提醒。

**结论：关系网络扩大日常目标来源，并把个人成长连接到集体协作。功能代码确认机制与依赖关系，实际协作频率属于玩家行为数据。**

## 五、经济采用资源入口、持续消耗与周期额度组合

通用货币在多个培养系统之间竞争，专属材料引导玩家进入相应挑战和活动。抽取将消耗、池选择、保底和愿望组合；商店读取动态库存与限购；贸易提供价格波动、涨停溢价及税率参数；拍卖维护独立对象、通知和成交流程。

月卡产生按日期领取的资源流，广告以次数和冷却提供短周期补充，通行证连接经验、购买资格及双轨领取。首购与季节奖励各有状态。

**结论：商业化接入资源、效率和周期目标。经济控制分布在货币、次数、库存与领取条件中，完整投入回报需要真实收入、概率、价格和账号资格。**

## 六、运营结构叠加多种时间尺度

| 时间尺度 | 主要机制 | 作用 |
| --- | --- | --- |
| 回合与单局 | 行动时钟、技能 CD、波次和节点 | 组织操作顺序与局内资源 |
| 日常 | 广告、任务、浇水、偷取与领奖额度 | 形成重复会话和资源入口 |
| 周期 | 材料额度、肉鸽、通行证经验与团队活动 | 提供中期目标与共同进度 |
| 赛季与活动 | 段位、通行证、节日兑换与排行 | 调整目标、奖励与竞争范围 |
| 开服生命周期 | 技能、武器门槛与噩梦塔系数 | 调节服务器成长阶段 |

服务器时间用于期限与周期判定；活动入口、任务、兑换和排行可以分别开放。红点由可操作、可领取、未查看等状态派生，构成跨系统日常引导。

## 七、技术结构决定规则的表达方式

服务器维护权威持久状态，Lua 处理资格、数据和业务流程，Unity 执行场景与表现。战斗使用分批节点，培养使用请求回包，洗练使用候选确认，家园使用预览和保存，奖励使用达成、可领与已领状态。

字段含义由调用链确定：技能费用查当前级，下一行判定可继续；贸易比例以 10000 为基准；弹球初始球列表优先于默认数量；HP 同步直接赋值。这些都是具体对象的运行契约。

## 八、最终研究结论

1. **核心体验由操作与构筑共同驱动。** 回合弹射提供位置、角度、力度和时机决策；养成与模式规则提供能力差异。
2. **内容层次由独立推进模型组成。** 竞技、关卡、楼层、肉鸽节点和弹球布局使用不同目标、状态与收益条件。
3. **成长同时受资源、账号和服务器时间约束。** 多培养轴竞争资源，阶段门槛控制开放，持续成本维持长期需求。
4. **社交与生产参与核心资源流。** 权限、关系、协作和共享进度连接个人目标与成员行为。
5. **商业化与运营横跨成长、效率和周期奖励。** 月卡、广告、抽取、商店与通行证通过独立账本和资格状态共同工作。
6. **权威结果与客户端表现分层。** 客户端业务契约能够从反编译确认，服务器伤害、匹配、概率和引擎碰撞需要相应执行证据。

《弹弹星球》的系统结构可概括为：**回合操作产生战斗结果，多轴构筑推动长期成长，挑战与活动供给资源，组织与生产连接关系，周期额度和商业化调节推进节奏。** 明确规则、公式与配置均有证据入口；系统设计判断由功能依赖推导。
