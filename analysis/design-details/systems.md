## 功能开放模块：服务器列表、云端开关与平台

### 真正的开放结果如何形成

`open_func.core.is_open(id)` 对nil记录错误并返回false，否则交给data.is_open。data层要求本地服务器开放字典中该ID为真，同时cloud_data.is_open为真；再查配置plat。plat1要求MINIGAME_MODE，plat2要求Android/iOS/OpenHarmony，编辑器另有豁免。因此客户端有效开放是**服务器授权列表×云端开关×平台条件**，不是角色达到配置文案就本地把is_open置1。[开放核心](../reverse/lua-disassembled/game.module.open_func.manager.core.txt#L378)、[平台/云端判定](../reverse/lua-disassembled/game.module.open_func.manager.data.data.txt)

配置707条，基础行、`_0`与`_543`覆盖片段分别保存。`is_open/isShow`、unlock_and/unlock_or、open_days、preview_reward、showIcon与动画目标负责定义和展示；“显示入口”“实际允许进入”“已经看过开放动画”“领取过预告奖励”是四个状态。707条不能宣称当前小游戏开放707个系统。

### 初始化顺序和增量更新

data.reset清空open_func、role_open_func、reward_list与main_btn_open_func等状态。服务器全量消息到来但云数据未初始化时，先保存wait_update_all_open_func_msg；云初始化完成后再重放。后续open_list/close_list是增量变化，要并入有效字典并广播update_all/update_item，主城入口和子系统重新检查。

这条等待链解释了“登录时角色等级已够，入口还没出现”的一种客户端状态：尚未完成服务器/云端数据合流。不能在此时发明“重新点击就解锁”。预告动画与跳转依赖开放事件，本地已看记录不能代替实时权限。

### 开服天数是另一个查询

`is_server_day_open(id)` 查get_cfg_by_id(id).open_days；没有配置返回true，否则比较server_open_day≥open_days。它与is_open不同，某模块到投放日但云开关关闭时仍进不去。养成评分的condition类型2正是调用这个日门槛接口。下方完整清单保留AND/OR编码与锁定提示，不把所有条件编码都硬译成等级。[开服日原指令](../reverse/lua-disassembled/game.module.open_func.manager.core.txt#L420)

## 任务模块：分类、状态、领取与指引

### 分类对象不能只按“主线/每日”两类

常量task_type包含main102、zhixian2、daily3、noob4、battle_pass21、alliance_daily104、career_pve201、championship202，另有回归、活动、直播等类别。基础tasks有7004条；80条tasks_0只是覆盖片段。任务实例的status、进度和领取资格来自数据回包，配置给目标、前置、后继、奖励、功能与跳转。

任务状态确切枚举为`accepttable=1/is_accepted=2/can_get=3/failed=4/finish=5`；奖励状态另为`not_get=1/can_get=2/getted=3`。不同枚举中的3不能混用。技能培养前置读task.status==finish5，不接受“任务进度满了但仍可领奖”的can_get3状态。[任务常量](../reverse/lua-disassembled/game.module.task.manager.const.txt)、[任务网络](../reverse/lua-luadec/game.module.task.manager.network.network.lua)

### 活跃数据与任务进度的分工

日常实例列表、day_act、act_ids、role_lv、day_score、week_score、week_ids与week_score_limit是独立字段。活跃宝箱候选用day_act≥配置liveness判断can_get，再扫描act_ids判断is_get；can_get为真且is_get为真时是已经领过，不能重复显示可领。周奖励另以week_ids及week_dic维护，不能把每日宝箱领取列表复用给周任务。

示例day_act45、act_ids[1]：20档已领，40档达到且未领，60/80/100档未达。完成一条任务后先等任务/活跃回包，再刷新两个区域；仅点击跳转或完成战斗动画不能本地加20活跃。[日常数据原指令](../reverse/lua-disassembled/game.module.task.manager.data.data_daily_task.txt)

### 任务如何引导外围行为

每日候选的open_func决定关联模块是否可进入，jump_id决定具体页面，lock_jump可提供资源来源，task_priority决定排序，target_num定义数量，condition_args定义特定玩法等参数。比如1031012目标4、活跃20、跳MoonBoxMainView，但open_cond999；它是配置候选，不应当成每个玩家当天必有任务。每条实际日常仍由服务器列表选取。日常设置还有max_daily_task_num5、工会日常3，这是设置维度而非“所有账号每天只完成5件事”。[完整日常候选](economy.md)

## 主城入口与红点模块

主城底栏、右上栏按钮配置和开放事件绑定各系统跳转。红点的含义分模块定义：任务奖励、功能预告、武器可升星、技能可升级、抽取有券、通行证可领都触发不同刷新。背包变化可触发养成可用检查；战斗结果本身不能直接当通行证/商店红点来源。

例如武器全量/增量回包同时刷新可穿戴、解锁、评分、可升星、构筑计划与宝石镶嵌红点；通行证有等级轨和任务两种可领取数量；抽取则监听三类券与开放事件。离开模块清监听及缓存，避免登录后旧红点残留。[武器状态刷新](../reverse/lua-luadec/game.module.main_weapon_develop.manager.network.network.lua)、[抽取红点](../reverse/lua-disassembled/game.module.gacha.manager.core.txt)

## 资源回流与社交入口的设计边界

资源用item_id＋数量并通过物品表区分背包类与物品类；金币、彩钻、蓝钻、技能知识、抽取券不是可互换的一种货币。领取奖励、购买、升级的资源变动由背包/数据更新统一反映；在领奖视图播动画不等于金额已落库。

邮件、公会、好友、婚姻、活动等入口在707条开放表和主城配置中存在；本专题给出入口、条件和事件关联，不把存在入口包装成已经完整复原其内部玩法。公会贡献/副本、任务、组队邀请通过外围任务及team目标关联；具体公会权限和邮件附件领取需各自网络执行器继续核对。下方开放清单让这些模块的ID和真实配置可以直接检索，避免只列一串系统名。
