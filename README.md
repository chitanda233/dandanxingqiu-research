# 《弹弹星球》游戏功能与系统设计研究报告

以 Unity 资源、Lua 5.1 字节码、有效配置和原函数执行分析游戏的操作、养成、挑战、组织、生产、经济与运营机制。

[在线研究报告](https://chitanda233.github.io/dandanxingqiu-research/) · [完整 Markdown](analysis/review/full-report.md) · [研究资料与复现](analysis/review/README.md)

## 报告内容

18 章涵盖研究摘要、产品循环、战斗、技能、角色养成、竞技匹配、PVE、肉鸽、50 关弹球、公会、社交、家园、农场、经济、商业化、活动、技术架构与综合结论。

研究对象为微信小游戏 AppID `wx64969d55b91a6963`，缓存目录版本 242，采集日期 2026-09-30。资料包含 23 个 Lua AssetBundle、8,272 份字节码、1,555 份有效配置导出、3,088 份原指令及 144 个原函数执行场景。189 个命名空间包含业务与基础设施，配置行数包含等级和分片变体。

Web 提供全文搜索、功能目录、配置分页查询、函数定位、技能预算、模式对照、弹球布局与执行记录。具体结论链接到来源文件、函数、字段和输入返回。

## 本地阅读

```sh
python3 -m http.server 8765 --bind 127.0.0.1 --directory docs
```

打开 http://127.0.0.1:8765/。资料按需加载，HTTP 服务用于读取配置与证据 JSON。

## 仓库结构

| 目录 | 内容 |
| --- | --- |
| analysis/review/reports | 18 章报告的可编辑正文 |
| analysis/review/full-report.md | 合成的完整研究报告 |
| analysis/review/configs | 有效配置、默认字段与分片 |
| analysis/review | 来源清单、功能目录、派生数据和执行记录 |
| docs | 从 main/docs 发布的 GitHub Pages 网站 |
| docs/data | 按需加载的配置、指令和搜索数据 |
| raw | 原始 wxapkg、wasm 包和 Lua AssetBundle |
| reverse/lua-bytecode | 原始字节码提取物与定位清单 |
| reverse/review-disassembled | 3,088 份原指令列表 |
| reverse/lua-decompiled、reverse/lua-luadec | 高层反编译材料 |
| tools | 提取、分析、原函数执行、建站与验证工具 |

## 研究方法

配置执行真实字节码及 import 依赖，解析元表默认字段；关键分支按原指令和受控执行确认。服务器持久状态、客户端派生状态、展示缓存与引擎状态分别说明。最终伤害、碰撞、匹配选择器、完整抽取概率和当前开放状态的结论以相应执行证据为范围。

建站及验证流程见[研究资料说明](analysis/review/README.md)。原始文件哈希保存在[原始资源清单](raw/manifest.json)，报告生成不修改原始资产。
