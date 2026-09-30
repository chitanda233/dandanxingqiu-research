# 匹配与机器人：出现位置、配装、AI 参数

要把“机器人”拆成四种证据：**组队补位的开关**、**自由对战手工加电脑**、**机器人角色/配装表**、**战斗 AI 配置**。这些表都在缓存，但客户端未包含服务器队列分配与胜率控制实现。以下能精确说明配置了什么，不能声称排位等多久后一定塞机器人。

## 哪些玩法配置写了 `need_robot`

| 主目标 | `play_type` | 人数 | `need_robot` | 招募时间字段 |
| --- | ---: | ---: | ---: | ---: |
| 常规 PVE `pve` | 203 | 1–4 | 1 | 8 |
| 寻星奇遇 `pve_star_dig` | 207 | 4 | 1 | 10 |
| 海盗岛 `pve_pirate_island` | 401 | 1–4 | 1 | 8 |
| 公塔 `pve_tower` | 209 | 4 | 1 | 10 |
| 材料副本 `pve_material` | 409 | 4 | 1 | 8 |
| 高难材料 `pve_material_hard` | 219 | 4 | 1 | 20–40（子目标不同） |
| 自由对战 `custom` | 501 | 1–8 | 0 | 未配 |
| 赛季 2v2 / 3v3 | 103 | 1–2 / 1–3 | **字段缺失** | 未配 |
| 身份乱斗 `brawl` | 117 | 1–4 | 0 | 未配 |

来自 [team_target.main 完整表](../analysis/data/team_target_main.json)。`need_robot=1` 是**允许/需求机器人相关流程的静态字段**；不能凭它断言达到 `recruit_time` 秒必补 AI。`is_open`、`open_func` 也只是客户端配置，实时运营开关另有来源。自由对战行 `need_robot=0`，但 [组队网络](../reverse/lua-decompiled/game.module.team.manager.network.network.lua) 存在 `team_add_bot_c2s` 手工加电脑请求：两者不矛盾，前者不等同于房主按钮是否存在。

## 组队与匹配时钟

`team_misc` 原表配置 `team_match_life=300`、`team_match_cd=1`、`match_diff=2`、`team_match_auto_note=15`、`team_recruit_refresh_cd=10`、`recruit_life=300`、`apply_life=60`。招募聊天 CD 分别是招募频道 10、公会频道 30；邀请发出 CD 30，接收 CD 120。[原表](../analysis/data/team_misc_team_misc.json) 这些值分别属于 UI/组队招募/请求节流；**不能把 300 秒解释成服务器匹配超时、2 解释成段位容差或 15 解释成自动塞机器人时间**，除非调用处证明。客户端 [匹配请求链](../reverse/lua-decompiled/game.module.team.manager.network.network.lua) 有 `team_auto_match_c2s`、`team_open_match_c2s`、`team_match_stat_c2s`；队伍形成和正式开匹配是不同步骤。

## 自由对战机器人 18 行：9 种职责 × 2 档 AI

[free_battle_robot](../analysis/data/free_battle_robot_free_battle_robot.json) 的 18 行，每行有 `type/job_type/ai_type/robot_id`：`ai_type=1` 对应 `11001–11009`，`ai_type=2` 对应 `12001–12009`；职责 1–9 各一行。样本：职责 1 的召唤陪练员是 `11009/12009`，职责 4 的连击陪练员是 `11001/12001`，职责 8 的感电陪练员是 `11005/12005`。`free_battle_robot_level=50` 是自由对战房机器人等级配置；不是任何排位机器人的等级。[自由对战配置](../analysis/data/free_battle_misc_free_battle_misc.json)、[机器人角色](../analysis/data/robot_robot.json)

| `job_type` | 流派 / 机器人 ID（AI 档 1 / 2） | 武器池示例（档 1） |
| ---: | --- | --- |
| 1 | 召唤 `11009/12009` | `1101014121, 1101014181, 1101014231, 1101014251` |
| 2 | 盾击 `11008/12008` | `1101014056, 1101014057, 1101014101, 1101014171` |
| 3 | 挖坑 `11007/12007` | `1101014021, 1101014022, 1101014023, 1101014271` |
| 4 | 连击 `11001/12001` | `1101014051, 1101014052, 1101014053, 1101014241` |
| 5 | 豹速 `11002/12002` | `1101014077, 1101014078, 1101014079, 1101014261` |
| 6 | 追击 `11003/12003` | `1101014054, 1101014055, 1101014111, 1101014221` |
| 7 | 流血 `11004/12004` | `1101014281, 1101014291, 1101014283, 1101014284` |
| 8 | 感电 `11005/12005` | `1101014041, 1101014191, 1101014201, 1101014211` |
| 9 | 灼烧 `11006/12006` | `1101014011, 1101014161, 1101014282, 1101014286` |

两档机器人在 [robot 角色表](../analysis/data/robot_robot.json)列出的武器池相同；档位差异更可能在 `ai_type` 对应行为参数或战斗生成流程，不能凭这张表说档 2 装备更强。

## 机器人身份与配装从哪里来

| 表 | 行数 | 内容 |
| --- | ---: | --- |
| `robot_role` | 606 | 名称、头像、外观组合；例如角色 2037 名称“三生三世”，有 7 个外观部位 ID。 |
| `robot` | 196 | 特定机器人 ID 的名称、武器池、外观、等级等；字段稀疏，不是每行都有完整配装。 |
| `robot_plan` | 91 | `fixed_pet_id`、`fixed_weap_id`、`fixed_equ_skill`、`select_skill_id`、`select_passive_skill_id`、`pet_lv`、`lv`。 |
| `team_robot_misc` | 10 个键 | 招募机器人名字、头像池、间隔与房间回收时间等。 |

例如 `robot_plan[2001001]`：宠物等级 35、候选宠物 `[2001001,2001002]`、装备技能 `[8046999]`、被动候选 `[623,624,625]`、主动技能 `1001999`。`robot_plan[2001002]` 则还指定五把武器和位移技能 `1005999`。[配装表](../analysis/data/robot_plan_robot_plan.json) 这能证明**有预设配装资源**，不能证明任一线上玩家当时遇到的机器人一定用了该行。

`team_robot_misc` 中 `robot_recruit_interval_time=2`、`robot_recruit_new_first_time=2`、`robot_recruit_new_interval_time=2`、`robot_room_delete_time=120`、`robot_recruit_attr=9000`、`robot_open_func=5001`，另有 51 个中文招募名字、17 个头像 ID。[原表](../analysis/data/team_robot_misc_team_robot_misc.json) 字段名支持“招募/房间机器人”机制，但计时单位和触发条件要与使用这些键的代码核对；绝不可写成“排位 2 秒必有人机”。

## AI 表给出的行为参数

[ai.ai](../analysis/data/ai_ai.json) 有 23 个 AI 模板。ID 1 可见目标时 `visible_power` 是五组三元组，第一组 `[2000,0,0]`；不可见时首组 `[0,0,0]`，其他组包括角度/力度偏移。ID 2 可见时首组 `[6000,0,0]`，余四组每个 1000；ID 5 可见/不可见均为 `[10000,0,0]`。这些三元组首位之和经常是 10000，**推断**为权重式选择，后两位为参数偏移；具体采样顺序与转化须见 AI 执行器，不能直接给玩家一个“命中率”。

ID 3 的 `target=1,plane=1,evasion=1,invisability=5000`；ID 4 的 `target=3,plane=1,evasion=1,invisability=10000`。字段名描述目标、位移、规避与隐藏目标处理，但枚举 1/3 的语义尚未闭合。`ai_misc` 另列 `distance=300`、`delta_distance=100`、`angle=[10,60]`、`delta_theta=3`、`move_time=5`、`plane_transmit_init_r=500`、`plane_transmit_delta_r=100`、`plane_transmit_angle_density=2`。[AI 常量表](../analysis/data/ai_misc_ai_misc.json) 不能把这些全部套到 PVP 机器人；不同 AI ID 可能被 PVE 怪物、陪练和自动战斗共用。

| AI ID | `target/plane/evasion` | 可见目标时的力度/角度样本结构 | 设计风格推断 |
| ---: | --- | --- | --- |
| 1 | 4 / 0 / 0 | 5 组，每组权重 2000，含力度偏移 ±2000、角度偏移 ±5 | 大幅扰动的入门模板 |
| 2 | 4 / 0 / 0 | 正中样本 6000，另外四组各 1000 | 多数正中、少量角度偏移 |
| 3 | 1 / 1 / 1 | 正中 6000，另有 ±1/±2 角度偏移；不可见目标 8 组 | 有位移与规避的中档模板 |
| 4 | 3 / 1 / 1 | 正中 8000，角度 ±1 各 1000；不可见目标 8 组 | 更集中的弹道模板 |
| 5 | 3 / 1 / 1 | 仅 `[10000,0,0]` | 不加随机扰动的瞄准样本 |
| 8 | 1 / 0 / 0 | 仅 `[10000,0,-15]` | 固定角度修正样本 |
| 10 | 1 / 0 / 0 | `[5000,-3000,0]` 与 `[5000,2000,0]` | 两种力度偏置 |
| 11 | 2 / 0 / 0 | 四组各 2500，含 `0,+3000,+2000,-2500` 力度偏移 | 分散力度试探 |
| 12 | 2 / 0 / 1 | 正中 5000，其他 4 组补足 10000 | 有规避的力度试探 |
| 13 | 1 / 1 / 1 | 正中 7500，另三组偏移 | 偏稳定的位移模板 |
| 14 | 2 / 1 / 0 | 正中 5000，另四组偏移 | 位移但不规避的模板 |

上表“风格”是从配置字段推断，**不是已验证 AI 决策树**。三元组首位在这些行合计 10000，但第二/第三位的单位和扰动施加次序须靠服务器 AI 执行代码验证。[完整 23 行](../analysis/data/ai_ai.json)

## “像真人”表现与证据边界

`robot_tactic` 60 行中大多数只有 `talk_group`，仅少数含 `atk_list/def_list`；对应 `talk_trigger` 有 210 行，包含 `time`、`show_time`、`group`、`trigger_condition` 和中文聊天文本。这可用于安排机器人对话/表情，不等于核心作战 AI。[战术表](../analysis/data/robot_tactic_robot_tactic.json)、[聊天触发表](../analysis/data/robot_tactic_talk_trigger.json)

## 赛季 PVP：新人 AI、等待兜底与机器人杯分

此前只看了组队模块，遗漏了 [season_misc](../analysis/data/season_misc_season_misc.json) 中更直接的 PVP 机器人参数：`the_first_X_ai_pvp=5`、`the_first_X_games_ai=[5,1,1]`、`the_first_2_ai_pvp_battle=[102010001,102010002]`、`second_ai_pvp_task=100101`，以及 `robot_role_list=[4001..4012]` 共 12 个 ID。**逆向策划解释**：前段对局存在 AI 引导，前两场还关联指定战斗 ID/任务；但三个元素各自的实际使用分支在服务端，不能说所有玩家必打 5 场 AI。

同表的 `newbie_match_time=[2500,5000]`、`pvp_match_fail_ai_time=180`、`robot_invitation_time=15000`、`robot_quit=2`、`robot_quit2=8`、`robot_open_func=110`，明显为匹配与机器人交互提供多套时钟和开放条件。毫秒/秒的单位、触发时点和是否热更新均未在客户端调用链闭合，所以报告保留原始值，不直接翻译成“排位等 180 秒必补人机”。

[season_cup](../analysis/data/season_cup_season_cup.json) 则明确存在 `robot_win_cup/robot_lose_cup` 专用结算字段：2600 档为 25/10，3100 档为 15/6，3200 档为 10/6，4100 和 4200 档为 8/6；同档真人 `win_cup/lose_cup` 分别为 50/20、30/15、25/15、15/10、15/10。低档 1100、1700、1800、2100 未配置机器人专用值。**可确定的设计意图推断**：对人机战果单列杯分，且高档人机胜利奖励低于常规胜利；是否每局实际使用、是否叠加其他修正由服务端裁定。该表的 `weak_team_win_fixed`、`weak_team_lose_fixed` 等还可能修正杯分，不能只取基础值当最终公式。

目前能确认**配置中为赛季 PVP 预留了 AI 新人期、匹配兜底和专用杯分**。不能确认当前服这些开关是否启用、机器人插入的精确条件、胜率控制、难度随连败变化或每场人机比例。要回答这些，需要服务器匹配代码或真实回包采样。
