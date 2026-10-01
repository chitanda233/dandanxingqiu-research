# 游戏功能深度复查 · 2026-10-01

对象：微信小游戏《弹弹星球》，缓存目录版本242，2026-09-30采集。本轮从原始Bundle复核提取物，执行更多配置和原函数，产出18篇功能分析与静态Web查询工具。原始缓存保持不变。

## 报告

[完整报告](full-report.md)约3.9万字符。网页版从[`docs/index.html`](../../docs/index.html)开始；需要HTTP服务使浏览器可以读取配置JSON。专题证据快捷链接使用`evidence:`/`config:`，建站工具转换为本地查询页面；原文件定位与哈希在清单中。

| 专题 | 文档 |
| --- | --- |
| 复查结果、口径、补漏纠错 | [00-review](reports/00-review.md) |
| 产品结构、开放状态、资源循环 | [01-product](reports/01-product.md) |
| 战斗流程、蓄力、三类弹道、HP | [02-combat](reports/02-combat.md) |
| 技能、Buff、当前级费用与预算 | [03-skills](reports/03-skills.md) |
| 角色、武器、宠物、装备、公平模式 | [04-growth](reports/04-growth.md) |
| 匹配、赛季与机器人 | [05-match](reports/05-match.md) |
| 剧情、爬塔、材料、组队副本 | [06-pve](reports/06-pve.md) |
| 肉鸽节点与事件 | [07-rogue](reports/07-rogue.md) |
| 50关弹球、球组、道具、结算 | [08-pinball](reports/08-pinball.md) |
| 公会组织、权限与团体战 | [09-guild](reports/09-guild.md) |
| 好友、聊天、师徒、婚姻与互动 | [10-social](reports/10-social.md) |
| 家园方案、职业、制造、魅力 | [11-home](reports/11-home.md) |
| 农场种植、偷菜与订单 | [12-farm](reports/12-farm.md) |
| 资源、抽取、商店、贸易、拍卖 | [13-economy](reports/13-economy.md) |
| 充值、月卡、广告、通行证 | [14-monetization](reports/14-monetization.md) |
| 活动、任务、福利与留存 | [15-liveops](reports/15-liveops.md) |
| 技术结构、平台、复现与数据同步 | [16-platform](reports/16-platform.md) |
| 设计评估、复原优先级与缺口 | [17-assessment](reports/17-assessment.md) |

## 数据和验证

- [原始资产核对](bundle-audit.json)：23个Bundle、8272个TextAsset逐字节一致。
- [全量索引](inventory-summary.json)：8272个字节码均成功解析；189个`game.module`命名空间，含技术模块及根定义。
- [配置清单](config-manifest.json)：1562个候选，1555个返回表，1552个纯数据，1534个非空纯数据；263128条记录包含分片重复。3个函数标记表、7个失败候选明确记录。
- [原指令清单](evidence-manifest.json)：3088份管理器/战斗指令；源文件SHA与定位保留。
- [功能目录](feature-catalog.json)：功能别名、分类、函数、消息、证据和专题关系。宽松扫描的消息符号不是独立API数量。
- [新增用例](probes.json)：97个显式断言，17份原始字节码来源。桩函数未配置时抛错。
- [旧场景快照](legacy-replay-snapshot.json)：35个旧场景的输入与返回复跑一致；这是稳定性复查，不等同于新增独立规则断言。
- [派生数据](derived-summary.json)：技能预算、70条模式参数、50份弹球布局与汇总，均说明统计口径。
- [交付校验](validation.json)与[浏览器验证](qa/browser-results.json)：本地链接、源文件哈希、旧128表一致性、查询、分页、计算器和手机布局。

此前“188个模块”的粗计数把同名`game.module.config`根入口与配置资源分组合并后排除了；最终目录按实际命名空间去重为189。它仍不是189个已开放玩法。

## 复现

建议Python3.12或更新版本。无需Java或Windows LuaDec；浏览器QA需要Playwright Chromium。

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

只修改正文或网页时重新运行建站和校验即可，不需重导配置：

```sh
.research-deps/bin/python tools/build_review_site.py
.research-deps/bin/python tools/review_validate.py
.research-deps/bin/python -m http.server 8765 --bind 127.0.0.1 --directory docs
```

在另一终端做浏览器验证：

```sh
.research-deps/bin/python -m playwright install chromium
.research-deps/bin/python tools/review_browser_qa.py --url http://127.0.0.1:8765
```

Windows可将`.research-deps/bin/python`换成`.research-deps/Scripts/python.exe`。原指令单函数查询示例：

```sh
.research-deps/bin/python tools/review_query.py game.module.farm.manager.core can_steal
```

网站静态数据按需加载，不依赖远端CDN。构建时复制配置和指令进`docs/data`使部署目录自包含；这增加约131MB站点资料，首页不会全量下载。旧十篇报告保留在`docs/reports`，旧门户在`docs/legacy.html`。`tools/build_site.py`检测到新专题时也会生成新版主页，避免旧命令覆盖新版。

## 边界

离线执行使用明确账号、引擎、UI、时钟与网络桩；没有在线战斗、消费或服务器探测。最终伤害、碰撞、匹配选择器、完整抽取概率以及当前开放状态仍需要新的服务端/引擎证据。详细说明见00与17章。新增Web已在本地完成，发布到远端需要另行操作。
