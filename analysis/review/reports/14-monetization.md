# 充值、月卡、广告与通行证

## 付费链与领取链分开

充值订单、平台 SDK 成功/取消、服务器确认、物品到账、首次奖励和季节首次奖励是不同阶段。客户端有428条商品候选，不代表当前账号全部可购买。云审核开关、平台、活动和商品可用状态还会限制入口。[充值网络](evidence:game.module.recharge.manager.network.network) [商品表](config:recharge.recharge_goods)

配置例：商品1 price6、gem_reward60、晶石×60、首次蓝钻×60、季节首次×30；商品2 price30、gem_reward300，部分购买/首充奖励独立。price 是配置价格字段，当前结算价格和币种由平台及服务器确定。订单 ID 连接支付结果和服务器确认，物品到账由账户回复处理。

## 月卡激活的时间边界

月卡2条，ID9/10，duration30、各自max_buy4；杂项另有month_card_max_buy18，不能用一个上限替代另一个。`is_month_card_activated` 要功能开放、信息存在且expired_time>server_time；恰好等于到期时间就不激活。四种时间/开放组合已验证。[月卡原函数](evidence:game.module.month_card.manager.core#is_month_card_activated) [月卡表](config:month_card.month_card)

| 月卡 | 日奖励配置 | 连续30天全部可领时的静态合计 |
| --- | --- | --- |
| 9 | 蓝钻100、武器券10 | 蓝钻3000、武器券300 |
| 10 | 蓝钻150、物品1213010002×10 | 蓝钻4500、该物品300 |

合计是假设每天都符合资格且领取，不是保证到账。续费、叠加期限、每日已领和补领由数据/服务器规则处理。

## 特权参数的累计

`is_has_privilege` 遍历有效月卡特权，将匹配参数的正值累计返回；调用者可能用非零作真假，但原值是数量或系数，可以大于1。返回值保留累计参数，用于数量或系数计算。试用特权另有6条配置，含86400、cd300等字段；要按调用处分别解释时长与冷却。[特权原函数](evidence:game.module.month_card.manager.core#is_has_privilege) [试用特权](config:month_card.privilege)

## 激励广告：额度、冷却与奖励确认

`get_advert_watch_state` 在daily_cnt≥daily_all_cnt返回−1；否则若pre_time+view_interval−now>0，返回剩余秒数；冷却到点返回0。无信息时本地也返回0，但不证明服务器会允许观看或发奖。

测试次数0/2、pre100、interval30，now129→1，now130→0；次数2/2、now140→−1。SDK加载、播放成功、取消/失败和服务器领奖是独立步骤，平台成功回调不能直接等价奖励到账。[广告原函数](evidence:game.module.advertisement.manager.core#get_advert_watch_state)

## 通行证：等级、双轨与已领进度

普通与进阶轨道分别保存normal_level/advance_level，是否购买由独立状态确定。锁定判断包括目标等级超过当前等级，或付费轨未购买。可领奖要求达到等级、该轨已解锁、目标超过该轨已领取进度。[通行证原函数](evidence:game.module.battle_pass.manager.core#get_item_can_get)

原函数验证：当前10、普通已领9，普通目标10可领；已领10就不可再领；进阶目标6未购时锁定，购买后可领，advance已领6则不可再领。周经验99/100未达上限，100/100和101/100达到。等级、购买资格与领奖进度分别决定锁定和可领取状态。

通用通行证另有get_common_state：0未满足/无相关数据，1有可领项，2终档已领；按目标等级查询与按整个通行证查询的路径不同。节日团队通行证还有邀请、队长、队员、退出费用和共同进度。[团队通行证](evidence:game.module.festival_battle_pass.manager.core)

## 首充、礼包和活动商品

首充、等级礼包、强化礼包、挂机礼包、七日、任选礼包和活动礼包均有单独入口或配置。免费领取、直购、代币兑换和已购奖励不可用同一价格字段处理。月卡期限、限购刷新、首购条件和活动剩余时间应在购买确认前展示。

设计上，商业化与武器抽取、培养资源、日常效率、活动进度和外观相连；实际付费优势和商品性价比需要当前商品、在线收益和服务器规则，缓存候选价格只能支撑静态说明。
