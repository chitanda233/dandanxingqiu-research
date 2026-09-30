# 研究口径与证据目录

本报告基于 2026-09-30 本机缓存快照：AppID `wx64969d55b91a6963`、微信包目录版本 `242`。主包 SHA-256 为 `3b8ab533d6ae2c4e9630149e0bd30b6647c15c92a5d5e405154debcd3d2392a8`。另有两个 wasmcode 包和 23 个 `res/Zero/Lua/*.ab` 原包；大小和哈希见 [`raw/manifest.json`](../raw/manifest.json)。原始包未改动；提取和反编译结果分别放在 `reverse/` 下。

## 证据等级

| 标记 | 意义 |
| --- | --- |
| 客户端实现 | 至少可从函数、字段或消息处理链确认该客户端有对应逻辑；不保证当前账号可用。 |
| 客户端配置 | 缓存版本内的静态数值或开关；服务端、热更新、活动和账号状态可能覆盖最终表现。 |
| 推断 | 从字段名、入口关系或多个模块交叉分析所得；不把推断写成服务器规则。 |
| 未验证 | 客户端无法得知，或反编译损坏导致具体分支不可靠。 |

`reverse/lua-decompiled/` 使用 unluac 尽力还原剥离调试信息的 Lua。配置表有些嵌套字面量被还原为 `({})`，部分核心函数可能出现未定义的 `Lx_x` 临时变量。为修复这个问题，现用 [Lua 5.1 字节码结构转换器](../tools/repack_lua51.py) 将原包 32 位 `size_t` 转为本机 64 位 Lua 5.1 可读取格式，在关闭文件、系统和包 API 的 Lua 运行时执行**白名单静态配置模块**，导出 [128 张配置 JSON 与哈希清单](data/manifest.json)。其中含服务器分片 `_0` / `_543` 等；聚合入口若单独执行会返回空表，故分别导出分片。原始字节码不变，完整配置行可复查；战斗算法仍需以反编译代码与服务端边界交叉确认。

## 本轮关键修正与验证

配置行通过元表 `__index` 继承默认字段。导出器现在递归合并默认值与行内覆盖，每张表清单标记 `resolved_table_defaults=true`。此前把技能40级费用、角色60级经验、排位操作开关、武器高阶品质当成缺失，是导出方法错误，现已纠正。基础表与服务器覆盖片段分别保存；仅导出覆盖片段不能描述完整任务、商店或功能开放系统。

新增 [184个模块原始指令列表](../reverse/lua-disassembled/manifest.json)，保留函数入口、操作数、常量、跳转目标与原字节码哈希。这是字节码证据，不是无误的高层Lua源码。第二套LuaDec输出在 `reverse/lua-luadec`，保留其错误提示；空输出和工具崩溃记录在指令清单，不宣称184份均成功高层反编译。

[35个原函数受控执行场景](data/client_rule_probes.json)覆盖：局内技能状态/费用/次数/CD、局外技能升级门槛与资源边界、技能槽、宠物等级差衰减、通行证双轨领取、环境与buff蓄力公式。运行的是原始字节码，外部账号、设置、回合和库存使用明确桩输入；结果不等同于在线服务器实测。每个场景保留输入与返回，来源保留哈希。

## 可复现的报告流水线

```powershell
python -m pip install -r requirements-research.txt
python tools/extract_config_tables.py
python tools/deep_decompile.py
python tools/probe_client_rules.py
python tools/build_design_appendices.py
python tools/build_site.py
python tools/check_site.py
```

`deep_decompile.py` 调用仓库中的Windows LuaDec二进制；原指令解码由Python脚本完成。`analysis/design-details` 是可编辑规则正文，`build_design_appendices.py` 将它与有效配置合成专题Markdown，长表不靠手抄。网页读取合成后的报告。校验包括611以上链接、26份原包哈希、128配置来源/行数、184指令来源和35原函数结果，不以页面能打开代替内容验证。

## 专题路径

0. [逆向策划设计案：从实现反推主循环与规则](design-spec.md)
1. [外围系统：入口与资源回流](systems.md)
2. [成长系统：等级、武器、技能与赛季](growth.md)
3. [匹配系统：目标、组队与服务端边界](matching.md)
4. [局内流程：回合、指令和结算](battle.md)
5. [局内计算与操作：弹道、天气和伤害](combat-math.md)
6. [技能与数值：主动、被动与等级变体](skills.md)
7. [机器人与 AI：补位、配装和行为参数](robots.md)
8. [局外成长数值：角色、宠物、武器和宝石](growth-numbers.md)
9. [局外经济与留存：任务、抽取、商店与通行证](economy.md)

## 此次未覆盖

本机缓存未包含服务器匹配和结算实现；当前在线开放状态、真实匹配池、机器人填充策略、完整伤害公式与局内实际时长均需额外服务端或实测证据。按用户要求，本次停止 UI 操作，仅查代码。研究的“玩法目标枚举”包含历史与预埋内容，不代表当前服全开放。
