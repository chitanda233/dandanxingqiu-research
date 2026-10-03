# 游戏功能与系统设计研究资料

研究对象：《弹弹星球》微信小游戏，缓存目录版本 242，2026-09-30 采集。研究依据原始资源、Lua 字节码、有效配置和原函数执行，报告日期 2026-10-03。

## 正式报告

[完整报告](full-report.md) · [在线 Web](https://chitanda233.github.io/dandanxingqiu-research/) · [网页入口](../../docs/index.html)

| 章节 | 内容 |
| --- | --- |
| [00 研究摘要与核心结论](reports/00-review.md) | 产品结构与明确研究判断 |
| [01 产品结构与循环](reports/01-product.md) | 登录、开放、状态与资源关系 |
| [02 战斗与操作](reports/02-combat.md) | 节点、蓄力、轨迹、HP 与瞄准 |
| [03 技能与 Buff](reports/03-skills.md) | 槽位、资格、CD、费用和累计预算 |
| [04 角色与养成](reports/04-growth.md) | 武器、宠物、装备及竞技平衡 |
| [05 PVP 与匹配](reports/05-match.md) | 队伍、门槛、赛季与机器人 |
| [06 副本与爬塔](reports/06-pve.md) | 星奖、速通、噩梦与材料奖励 |
| [07 肉鸽挑战](reports/07-rogue.md) | 挑战、节点、事件与愿望 |
| [08 弹球闯关](reports/08-pinball.md) | 50 关布局、球组、计分和结算 |
| [09 公会与团体战](reports/09-guild.md) | 权限、职位、协作与组织活动 |
| [10 社交与互动](reports/10-social.md) | 好友、师徒、婚姻、聊天与场景 |
| [11 家园与职业](reports/11-home.md) | 编辑、复制、制造、魅力与访问 |
| [12 农场与订单](reports/12-farm.md) | 种植、互动、双层订单资格 |
| [13 经济与交易](reports/13-economy.md) | 资源、抽取、动态价格与拍卖 |
| [14 商业化功能](reports/14-monetization.md) | 订单、月卡、广告与通行证 |
| [15 活动与留存](reports/15-liveops.md) | 任务、周期、福利与复合活动 |
| [16 技术架构与研究方法](reports/16-platform.md) | 资产、字节码、平台与状态分层 |
| [17 综合结论与系统设计](reports/17-assessment.md) | 操作、成长、社交、经济与运营分析 |

## 数据与执行资料

23 个 Bundle 的 8,272 个 TextAsset 与提取字节码逐字节一致。配置候选 1,562 个，1,555 个返回表，其中纯数据表 1,552 个、非空纯数据表 1,534 个。263,128 条记录包含分片；3 份表保留函数标记，7 个候选未返回可导出表。

[功能目录](feature-catalog.json)包含 189 个命名空间及函数、消息和证据关系；[原指令](evidence-manifest.json)共 3,088 份。网络扫描包含包装与回调符号，作为定位索引使用。

[规则断言](probes.json)包含 109 个场景、17 份原始字节码来源；[行为记录](../data/client_rule_probes.json)包含 35 个场景，其返回与[记录快照](legacy-replay-snapshot.json)核对。显式预期断言和输入返回记录分别标明。所有执行均使用明确账号、引擎、UI、时钟和网络替代对象。

[派生数据](derived-summary.json)包含技能预算、70 条玩法参数和 50 份弹球布局。[校验记录](validation.json)与[浏览器验证](qa/browser-results.json)说明数据来源、链接、查询、预算和移动端页面情况。

## 复现流程

Python 3.12+；浏览器验证使用 Playwright Chromium。

```sh
python3 -m venv .research-deps
.research-deps/bin/python -m pip install -r requirements-review.txt
.research-deps/bin/python tools/review_inventory.py inventory
.research-deps/bin/python tools/review_inventory.py configs
.research-deps/bin/python tools/review_inventory.py evidence
.research-deps/bin/python tools/review_derive.py
.research-deps/bin/python tools/probe_client_rules.py
.research-deps/bin/python tools/review_probes.py
.research-deps/bin/python tools/review_catalog.py
.research-deps/bin/python tools/build_review_site.py
.research-deps/bin/python tools/review_validate.py --bundles
```

修改报告正文或页面后，运行建站与验证即可：

```sh
.research-deps/bin/python tools/build_review_site.py
.research-deps/bin/python tools/review_validate.py
.research-deps/bin/python -m http.server 8765 --bind 127.0.0.1 --directory docs
```

浏览器验证：

```sh
.research-deps/bin/python -m playwright install chromium
.research-deps/bin/python tools/review_browser_qa.py --url http://127.0.0.1:8765
```

原函数查询示例：

```sh
.research-deps/bin/python tools/review_query.py game.module.trade.manager.core get_trade_shop_price
```

Windows 将 .research-deps/bin/python 换为 .research-deps/Scripts/python.exe。配置与指令复制到 docs/data，部署目录包含全部资料；网页按需读取，首页不下载全量数据。报告入口统一指向对应系统章节。
