## 日常经济设计：任务奖、活跃奖、参与奖分别入账

### 五档活跃预算

20/40/60/80/100宝箱累计领取是一套二次奖励：任务直接奖由task_award定义，宝箱资格由服务器day_act判断，已领由act_ids判断。两组宝箱投放不能混成“每天保底”：分支1全领共金币5,000,000、技能知识2,000、1级强化石20、武器抽取券5、蓝钻100；分支2金币500,000，第80档换成1413010001×5，其余按该分支表。下方给准确物品名与ID。

活跃40档的技能知识2,000，若账户技能1001在20级，要升21级需4,000知识，它只能覆盖一半；若在10级，10→11需400，材料能覆盖五份**该步骤价格**，但后续等级成本递增，不能据此说一定升五级。任务直接奖、对局奖、签到/活动另算，不将7,004个候选任务奖励加总成一天收益。[活跃源表](../analysis/data/task_liveness_task_liveness.json)、[技能逐级预算](skills.md)

### 候选任务与当天实例

基础tasks7,004条、默认/543覆盖片段各80条；task_tp3的候选在下方按基础＋默认覆盖展开。目标量、开放功能、活跃、奖励和jump_id一起决定行为。任务状态can_get3与finish5不同，领奖、下一个任务和活跃更新需对应网络/数据回包。主线、新手、日常、工会与通行证任务类别分别保存，不能从某个每日目标的open_cond999推全系统不开。

排位每日参与奖励次数参数3与杯数成长是两件事。奖励机会用完不意味着排位不能继续，也不等于后续对局杯数必不变；服务器对局结果、任务进度和参与奖励分模块更新。

## 商店设计：分类、商品定义与动态库存

### 商品不是只有分片里23/28行

基础shop有2,529行、shop_class46行；`_0`23条和`_543`28条用于覆盖。商品字段包括type/subtype/type2、item_id/get_item、price/original_price、num/num_max、refresh_type、buy_limit、single_max_times、open、前后购买关系和server_ids。配置里还有过去日期范围与9999级门槛，不能全算当前在售商品。

打开商店发送shop_info，回包初始化动态店铺字典，再缓存和广播shop_info/红点。普通购买提交shop_id、number、item_cid；批量购买提交buy_list。购买回包有shop时替换该店记录并刷新缓存；增量更新还处理shop_list与delete_list，商品可以被动态移除。库存/限购值是当前店铺数据，不应按静态num简单减一次后永久保留。[商店交易](../reverse/lua-luadec/game.module.shop.manager.network.network.lua)

例基础商品10701011价格为1001010007×1500、奖励102022001007×1，open里有[9999,99999]范围；它可说明某货币兑换商品的结构，但不能声称玩家现在可以买。计算“买两份”也需number、get_num、get_item各层的语义与限购允许，不能用页面标价直接推最终扣费。[基础商品定义](../analysis/data/shop_shop.json)

## 抽取设计：开放、实际请求、心愿与保底

### 入口与操作

基础gacha六行，武器101单次消耗1405020001×1、主池101、分支池`[[1,10101],[2,101]]`、保底引用[8,7]；宠物1001单次1405010001×1、开放条件含开服2/角色25、保底引用[3]。装备102默认分片有更详细的单次/十次及其他批量动作定义。每个池应按自己的ultra_reward_rule读取保底，不能把保底表所有行全叠在武器101。

gacha_spin请求c_id/times/attr_list；attr_list来自已开放自动分解/锻造筛选中的有效属性选项。武器页会先缓存武器信息，广播wait_reward_start，再发送。心愿职业用cid/job/old_job，心愿物品用cid/job/item_list。设置心愿与实际抽取是两种写操作，未成功回包时不应该改变真实UP状态。[抽取网络](../reverse/lua-luadec/game.module.gacha.manager.network.network.lua)

### 普通抽取与预抽/刷新分开

gacha_preview_info、refresh_preview、draw_preview和普通spin分别存在。预抽刷新有自己的c_id/type、缓存与费用；gacha_misc首/次/三次金币1/2/3、刷新100不能拿来替换普通武器抽取券成本。免费CD字段8、auto_refresh18400与广告次数2保留原值；时间单位和生效池需要对应具体调用闭合。

### 保底只描述保证，不等于基础概率

规则1每10次紫及以上、2每80次橙及以上，规则8每60次红武、7每200次神器之心；9/10另有解锁条件，不能一概把60改成40。类型3每3次随池等级改变保证品质，是另一规则族。200行gacha_pool给poo_id和count，**没有基础掉率字段**；不能把行数或count当权重。wish_up_percent10000/5000也不是总体出货率，可能作用于已满足品质后的定向分配。当前静态资料能做保底与池选择设计，不能算真实期望花费/保底计数继承。

## 通行证设计：开放、升级、双轨领取与购买

### 活动状态必须同时满足四个条件

core.is_open要求开放功能通过、season_id≠0、reward_group_id≠0、end_time≠0且end_time≥服务器当前时间。季节ID选battlepass_season，奖励组ID选battlepass_reward；不能只看21天参数就生成当前通行证。基础奖励组1001有50级，get_max_lv取该组最后一行lv；换组可能改变上限。

### 经验与等级是两个数据层

get_max_exp明确返回battlepass_exp1000；get_is_exp_limit直接比较服务器数据week_exp≥week_exp_limit，**不是每次只读静态10000**。静态10000是默认周限，实际数据仍可覆盖。level、exp、week_exp、周限、normal_level、advance_level、is_buy及end_time分别保存。客户端显示进度和可领状态，等级提升与周经验核算由回包写入。

### 免费/付费双轨状态表

固定示例：当前10级、免费已领到5、付费已领到3。

| 奖励 | 购买付费轨 | 锁定 | 已领 | 可领 |
| --- | --- | --- | --- | --- |
| 免费5级 | 否 | 否 | 是 | 否 |
| 免费6级 | 否 | 否 | 否 | 是 |
| 免费11级 | 否 | 是 | 否 | 否 |
| 付费4级 | 否 | 是 | 否 | 否 |
| 付费3级 | 是 | 否 | 是 | 否 |
| 付费4级 | 是 | 否 | 否 | 是 |

六例均运行原字节码；LuaDec漏掉免费分支的问题已由原始指令与执行结果纠正。normal_level和advance_level是分别记录的领取进度，升级不自动等于奖励已经领完。[领取原指令](../reverse/lua-disassembled/game.module.battle_pass.manager.core.txt#L664)、[探针](../analysis/data/client_rule_probes.json)

### 奖励合成、买级与购买付费轨

get_reward_list复制每级free_reward/pay_reward，再把当前赛季reward[lv]追加到付费轨。下方50级付费基础表不含季节专属追加，展示“总收益”须再并入季节表，不能只抄模板。get_buy_reward_list统计当前level之后到目标级的免费奖，已购买才并入付费奖和季节追加；它用于购买预览而非自动发奖。

买级请求携目标level，成功回包重新init_info后刷新任务/奖励红点；一键领奖单独请求；购买付费轨成功通知is_buy=true，再刷新可领状态。等级价格参数100、货币接口返回GlobalConst.money.diamond，付费轨SKU参数pay_id7与买级货币不是同一种支付。是否人民币价格必须继续查SKU，不以100当100元。[买级与领奖网络](../reverse/lua-luadec/game.module.battle_pass.manager.network.network.lua)、[货币原指令](../reverse/lua-disassembled/game.module.battle_pass.manager.core.txt#L1196)

## 签到与周期重置

七日签到基础＋分服覆盖共同构成完整奖励序列；前两天在基础表，不能把只含3–7日的覆盖片段当完整活动。默认/543第5日的核心物品不同，均列在下方；实际已领日与重置状态需要签到实例数据。赛季重置另有杯分继承/ELO和指定物品转化，不把21天通行证周期自动当全部赛季周期。
