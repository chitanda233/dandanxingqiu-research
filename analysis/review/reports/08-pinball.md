# 弹球闯关：本次补出的完整玩法

## 为什么需要独立成章

`pin_ball_game` 不只是普通战斗的一个玩法标签：它有自己的 Unity 控制器桥接、球配置、道具、50 个独立布局脚本、分数、波次、球数、结果界面和网络提交。旧报告基本遗漏了这套机制。本次逐一执行 50 个原布局字节码，并验证加载和结算关键分支。

运行时入口 `is_runtime_available` 通过 `pcall(typeof(PinBallGameController))` 判断类型是否存在，`is_feature_available` 调用同一检查。类型可用不等于当前服务器开放；类型缺失时会提示“当前客户端版本暂不支持该玩法”。[入口原函数](evidence:game.module.pin_ball_game.manager.core#is_runtime_available)

## 关卡数据由两层组合

关卡配置 ID 70101001～70101050，保存目标、前置、默认球数和奖励。布局脚本保存 canvas、init_balls、initial_units、initial_props 和后续 waves。`load_stage_layout` 取根对象的 layout，并在需要时合并根对象的 canvas/init_balls；不能只读取 layout 子对象而漏掉球数。[布局加载](evidence:game.module.pin_ball_game.manager.core#load_stage_layout) [关卡表](config:pinball_stage.pinball_stage)

全部画布以配置中的像素坐标呈现；首关为 1080×2400。网站提供初始布局和各个后续波次的 SVG 示意：标注单位 HP、道具 ID、位置与大小。它是布局数据可视化，不是游戏截图或碰撞模拟。

## 默认 8 球不等于实际 8 球

`build_initial_ball_loadout` 优先采用有效非空的布局球列表；检查球 ID 存在、数量有效且大于 0。空列表或未知球 ID 会回退到配置 `init_ball_count`。首关布局 5 普通+1 强力，实际初始 6 球；末关 10 普通+8 强力，实际 18 球；两者配置默认均是 8。四种分支已执行原函数验证。[球组装](evidence:game.module.pin_ball_game.manager.core#build_initial_ball_loadout)

| 球 | ID | base_damage | hit_radius |
| --- | ---: | ---: | ---: |
| 普通球 | 7012001 | 1 | 20 |
| 大力球 | 7012002 | 2 | 20 |

这些是配置基础值；不能在未验证控制器碰撞调用时把 hit_radius 直接当世界单位或计算精确击杀次数。前文“强力球”指配置正式名“大力球”。[球表](config:pinball_ball.pinball_ball)

## 障碍、增球与爆炸道具

共有 6 条 prop 配置。圆形7011001、三角形7011004、正方形7011005、五边形7011006都是prop_type1，hit_score1、death_score10、move_distance216。增球7011002为prop_type2，hit/death_score都0、move_distance216、add_ball1，描述明确为“下一回合小球数量+1”；炸弹7011003为prop_type2，hit/death_score都0、move_distance0、boom_effect50、effect_r300。不同几何、角度、HP 和位置提供反弹/命中路线的布局差异。[道具表](config:pinball_prop.pinball_prop)

`on_kill` 把 active_unit_count 下限钳为 0，并累加死亡分数；死亡计数原为 0 的测试仍保持 0，并获得配置死亡分10。`on_hit/on_kill`通过未命名的0.44函数加分：base_score非0时，增加`base_score×max(1,tonumber(回调第二参数)或1)`。这能确认客户端倍率处理，但第二参数的游戏语义仍需控制器证据，不能自行称为完整“连击倍率”。命中、死亡和倍率参数来自控制器回调；不能在缺完整 C# 桥接语义时宣称任意关卡理论最高分。[命中与计分原指令](evidence:game.module.pin_ball_game.manager.core#on_hit)

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

50 关目标范围 367～2560。HP 总和只汇总配置中初始与后续单位，不等于目标分数，也不能当难度的唯一指标。增球、炸弹、布局和强力球比例都会改变过程。交互曲线分别画目标分与 HP 总和，避免用同一含义解释。

## 关卡曲线存在三次结构跃迁

第12→13关目标440→745、HP387→848、单位15→19、后续波次3→4，但球组仍为6普通+2大力。第25→26关目标865→1200、HP902→1520、单位19→20，同时大力球2→4，普通球保持8。第38→39关目标1410→2340、HP1580→2908、单位20→24、波次4→5，球组仍10普通+4大力。

目标增幅分别约69.3%、38.7%、66.0%，HP增幅约119.1%、68.5%、84.1%。这些是配置差值，不是实测难度增幅。第13和39关同时加内容但未增加初始球，值得作为体验测试的重点；第26关增加大力球可提供部分补偿。整个50关更适合按1～12、13～25、26～38、39～50四段讨论，而不是假设每关线性增长。仍需碰撞、道具触发和通关记录判断是否存在真实卡点。

## 达标、结束和结果提交

`is_stage_target_reached` 在 score≥target 时返回真，目标≤0也为真。`on_round_end` 重置当轮球计数，并在达标后调用控制器 `RequestFinishAfterRoundEnd`。因此玩法存在“达到目标后在回合末结束”的路径，不必笼统写成“清空所有障碍才获胜”。[达标](evidence:game.module.pin_ball_game.manager.core#is_stage_target_reached) [回合末](evidence:game.module.pin_ball_game.manager.core#on_round_end)

`on_stage_finished` 用分数是否达标判 win1/lose2，结果只展示一次。只有获胜且该关尚未完成时发送 `pinball_submit_result`；已通过的重玩和失败不走同一提交分支。四种组合已验证。网络包装发送 `{dup_id,type}`，没有 score 字段；这仅描述客户端接口，不证明服务器会信任任意构造结果。[结束原函数](evidence:game.module.pin_ball_game.manager.core#on_stage_finished) [网络封装](evidence:game.module.pin_ball_game.manager.network.network)

## 解锁、奖励与继续挑战

进度由 max_pass_stage_id 等回复刷新，下一关依 `pre_dup` 关系查找；请求成功再更新入口红点、待展示奖励和关卡列表。结果页支持下一关、重试、返回，且下一关还要过解锁检查。首次奖励与重玩必须分离，不能因为本地 show_result 就再次增加背包。

本次证明的是客户端布局、状态与提交条件；碰撞判定、反弹参数、道具实际触发次数和服务端奖励校验尚待完整 Unity 桥接或实际运行记录补齐。
