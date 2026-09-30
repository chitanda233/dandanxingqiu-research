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

## “像真人”表现与证据边界

`robot_tactic` 60 行中大多数只有 `talk_group`，仅少数含 `atk_list/def_list`；对应 `talk_trigger` 有 210 行，包含 `time`、`show_time`、`group`、`trigger_condition` 和中文聊天文本。这可用于安排机器人对话/表情，不等于核心作战 AI。[战术表](../analysis/data/robot_tactic_robot_tactic.json)、[聊天触发表](../analysis/data/robot_tactic_talk_trigger.json)

目前**无客户端证据**能确认排位队列的机器人插入阈值、段位保护、胜率控制、难度随连败变化，或每场人机比例。要回答这些，需要服务器匹配代码或采样足够多真实匹配回包。把静态机器人名单当成“线上排位全是机器人”是错误推断。
