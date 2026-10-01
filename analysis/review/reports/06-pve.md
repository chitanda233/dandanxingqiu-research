# 剧情、副本、爬塔与材料奖励

## PVE 不是一个总进度条

主线、剧情关卡、多人剧情、组队普通/英雄副本、材料本、塔、组队塔、单人 Boss、木桩和机关/机器人塔等各有配置和进度。主线表 1,600 行、60 章；剧情 `_0` 与 `_543` 各 241 行，另有关卡/章节表。不能将它们相加为同一条主线关卡数。

| 系统 | 资格或推进 | 奖励状态 | 主要差异 |
| --- | --- | --- | --- |
| 主线 | 可挑战、前置通过 | 通关/进度回包 | 与剧情关卡模块分离 |
| 剧情 | 难度开放、关卡锁定、星数 | 章节星奖、难度奖 | 首通、速通和自动下一关分开 |
| 组队副本 | 自己与队友资格、队伍目标 | 翻牌、每日经验、周额度 | 普通与英雄额度不同 |
| 塔 | 层数、等级、战力、功能开关 | 层数奖、阶段奖、每日/挂机 | Buff、自动、速通与噩梦系数 |
| 材料本 | 系列、挑战进度、次数 | 次数奖、回合奖、队伍排名奖 | 助力分支会改变奖励额度显示 |
| 单人 Boss | Boss 任务、天赋与次数 | 速战次数、天赋/任务奖 | 普通与全局任务位不同 |

## 剧情：星数奖励与可挑战状态

章节奖励先看是否已领取；未领取时比较章节总星与 `奖励档位×dungeon_star_max`，返回可领或锁定。困难难度先查难度开放，再查关卡锁定。章节奖、关卡通过和难度解锁不是同一布尔值。[剧情函数](evidence:game.module.story_level.manager.core#get_story_level_chapter_award_state)

速通 `can_crush_level` 要求功能开放、关卡尚未通过、存在推荐战力，且实际战力达到推荐战力乘指定系数；进入战斗和速通是不同请求。特别需要纠正：`can_auto_fight_next` 的开头固定开关为 false，原函数直接返回 false，后面的找下一关逻辑在此版本不可达。已通过离线执行验证，未调用任何下游桩函数。[速通](evidence:game.module.story_level.manager.core#can_crush_level) [连续挑战](evidence:game.module.story_level.manager.core#can_auto_fight_next)

多人剧情读取章节、关卡、个人积分、目标达成、奖励领取和固定推荐战力，有独立 `req_gve_story_info_c2s`；不要用个人剧情星数覆盖多人积分。

## 组队副本：资格与奖励额度分开

`check_self_dungeon_unlock`、`check_other_dungeon_unlock` 分别检查自己和队友；目标改变、组队邀请、退出/建队有独立流程。翻牌是否显示、额外普通奖励、英雄周奖励数量和每日经验奖励都读各自的数据。一次通关可以推进副本进度，却不一定剩余所有奖励额度。[组队原函数](evidence:game.module.dungeon_team.manager.core)

## 爬塔：Buff、挂机、自动与速通

塔模块维护目标层、最高可挑战层、阶段领奖、好友信息、Buff 装备/选择次数、自动状态、挂机奖励与速通。`can_get_daily` 要 daily_reward=0 且 `can_show_daily` 满足；不满足可能返回 nil，而不是统一显式 false。

`can_crush` 要下一层存在且能挑战，不能带 `cant_crush>0`，速通功能开放，战力达到 `press_power`。噩梦分支把门槛调整为 `press_power×(1+max(噩梦速通系数,0)/10000)`。因此同一层在不同开服天数可能有不同速通要求。[塔原函数](evidence:game.module.dungeon_tower.manager.core#can_crush)

```text
是否噩梦 = open_day × 10000 < night_mare_coeff[1]
怪物系数 = (night_mare_coeff[1] − open_day × 10000)
           × night_mare_coeff[2] / 10000
速通系数 = (night_mare_coeff[1] − open_day × 10000)
           × nightmare_press_power / 10000
```

函数本身可能返回负系数；速通使用处再钳非负。测试阈值 100000、怪物系数项 5000、速通项 2000：第 9 天返回 true/5000/2000，第 10 天 false/0/0，第 11 天 false/−5000/−2000。不要在 getter 层擅自加 clamp。[噩梦函数](evidence:game.module.dungeon_tower.manager.core#get_nightmare_mon_coef)

塔配置 `_0/_543/_993` 各 1,200 行，`_2000` 1,000、`_2008` 30，是不同分片，不等于一个服共 4,630 层。实际选择配置和客户端开放条件需要运行上下文。[塔分片](config:tower.tower_0)

## 材料本：奖励次数不是挑战次数

系列表 10 条，普通/英雄分组；关卡 `_0/_543` 各 30 条，回合奖励 15 条。正常 `award_left=reward_limit_cnt−reward_cur_cnt`，同时返回上限；当 `sprouts_rate>0`，剩余显示被压成有额度 1、无额度 0，上限为 1。测试 limit7/used2 正常返回 5/7，助力返回 1/1，used7 返回 0/1。[额度原函数](evidence:game.module.dungeon_material.manager.data.data#get_award_left_times)

回合奖要求未领、pass_round>0 且 pass_round≤finish_round，体现“在指定回合内完成”。例如 finish4，pass4可领、pass5和pass0不可领，已领取亦不可领。排名奖另用 team_rank_cnt 与已领列表判断；不能把回合奖与排名奖合成同一个按钮状态。[回合奖](evidence:game.module.dungeon_material.manager.data.data#get_round_reward_can_get_by_id)

## 单人 Boss 与复刻清单

单人 Boss 模块区分单 Boss 任务、全局 Boss 任务、天赋完成位、速战次数和限时 Boss 表现；有 12 条 Boss 条目。这里对入口和状态做结构复核，尚未动态执行完整 Boss 战斗或天赋计算。

完整 PVE 复刻应保存前置关系、玩法 ID、推荐/强制战力、奖励次数、首次/重复奖励、回合/星数条件、队友资格、已领取标志和服务器失败结果。难度、关卡、楼层、奖励进度不能共享一条通用状态。
