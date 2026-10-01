# 肉鸽挑战：节点、事件与持久状态

## 独立于普通副本的推进结构

肉鸽模块有挑战状态、节点状态、难度、事件、愿望、购买/升级、任务和保存愿望等对象。普通 PVE 往往是“选关→打完→领奖”；肉鸽需要在一轮内维护选择、节点、资源和战斗后的状态。因此不能以通关关卡列表直接替代这一套数据。

| 状态对象 | 原值 |
| --- | --- |
| 挑战 | doing1、finished2、exited3 |
| 节点 | choose1、doing2、finished3 |
| 事件 | fight1、shop2、reward3、wish4、multiple99 |

难度配置 5 条、节点配置 155 条、事件 93 条、愿望 86 条。节点还有 hard9 等行，所以不能简单把 155 行平均分成当前开放的 5 个难度，也不能称 155 个全部在线节点。[状态定义](evidence:game.module.rogue.manager.const) [难度](config:rogue_hard.rogue_hard) [节点](config:rogue_node.rogue_node)

## 难度解锁的原条件

`is_rouge_difficulty_open`（函数名保留原拼写）先要求配置有效、功能开放，再比较请求难度与 `pass_hard+1`。难度 2 在通过难度 0 时不可用，通过难度 1 时可用；功能关闭时即便已通过也不能使用。用例只替换服务器下发的 pass_hard 和开放状态，实际条件运行原始字节码。[解锁原函数](evidence:game.module.rogue.manager.core#is_rouge_difficulty_open)

## 节点推进与选择窗口

`get_next_challenge_info` 在节点状态 choose/doing 时仍返回当前节点，finished 才加一。测试 hard2、node3：状态 1/2 返回 (2,3)，状态 3 返回 (2,4)。`can_select_event` 只允许匹配下一可选难度/节点，不能跨到 5 或其他难度。这是防止 UI 提前跳节点的重要客户端约束。[推进](evidence:game.module.rogue.manager.core#get_next_challenge_info) [事件选择](evidence:game.module.rogue.manager.core#can_select_event)

## 事件与局内构筑

战斗、商店、奖励、愿望和复合事件走不同数据。商店买入、升级和刷新消耗专属资源；愿望既有当轮选择，又有保存、重置和展示。事件权重表或价格表只是输入，完整选择器与服务端扣款仍需进一步证据。

关卡结束后保存的 HP/挑战状态与新节点关联；退出、完成、进行中不同。新一轮初始化和失败重置不能沿用一般副本的“恢复满状态”假设。复刻需追踪当前轮资源、可选事件、当前愿望、历史愿望、战斗结算和节点完成。

## 日周额度与愿望保存

杂项原值包括 daily_reward8、累计奖励上限56、wish_reset1、save_wish3、save_wish_after8node，以及愿望重置花费肉鸽币5。值应按调用分支使用：8 个节点后保存的门槛不同于每日奖励 8，不能因数字相同合并机制。[肉鸽杂项](config:rogue_misc.rogue_misc)

下一周重置函数按服务器日历定位周一 05:00。这不是使用本地操作系统时间随意计算。实际服务端刷新、补偿和上一轮保留范围仍依赖回包。

## 失败、重试和数据恢复

选择事件后应等待服务端确认再进入；请求失败不能先把节点标 finished。重新打开页面要根据 challenge 状态和节点状态恢复，而不是固定回首节点。完成与退出需要不同结果提示；愿望保存条件要在退出/结算路径复查。

从设计上，节点内选择、愿望保存和周额度让临时构筑与长期收益相连。收益上限会约束重复刷取，但单凭该缓存不能评估难度曲线、平均收益或最优流派；需要事件选择器和真实战斗数据。
