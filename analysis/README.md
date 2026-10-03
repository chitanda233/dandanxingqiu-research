# 研究资料与证据说明

[完整研究报告](review/full-report.md) · [18 章正文与复现流程](review/README.md) · [Web 报告](../docs/index.html)

## 研究对象

微信小游戏《弹弹星球》，AppID `wx64969d55b91a6963`，缓存目录版本 242，采集日期 2026-09-30。原始资料为主 wxapkg、两份 wasm 包和 23 份 Lua AssetBundle，文件大小及 SHA-256 见[来源清单](../raw/manifest.json)。

## 结论的证据来源

| 来源 | 支持的结论 |
| --- | --- |
| 有效配置 | 字段、默认值、成本、候选奖励与分片 |
| 原指令与调用链 | 条件、赋值、跳转、提前返回及调用顺序 |
| 原函数受控执行 | 明确输入下的返回和状态变化 |
| 系统关系分析 | 从规则及依赖推导产品结构和机制作用 |

正文直接说明已确认规则及其系统含义。设计作用属于分析判断，服务器最终算法和当前账号状态需相应来源支撑。

## 资料索引

- [字节码目录](review/inventory.json)：8,272 份来源、函数与常量。
- [配置清单](review/config-manifest.json)：1,555 份导出、依赖和记录规模。
- [原指令清单](review/evidence-manifest.json)：3,088 份模块与函数定位。
- [功能目录](review/feature-catalog.json)：189 个业务及技术命名空间。
- [规则断言](review/probes.json)：109 个具有显式预期的原函数场景。
- [行为记录](data/client_rule_probes.json)：35 个输入与返回场景。
- [校验记录](review/validation.json)：来源、配置、链接与规则验证。
