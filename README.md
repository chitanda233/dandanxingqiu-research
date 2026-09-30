# 《弹弹星球》本机代码研究

研究对象：微信小游戏 `wx64969d55b91a6963`，本机缓存包目录版本 `242`，采集日期 2026-09-30。研究方法是读取本机缓存中的 wxapkg 和 Unity Lua AssetBundle；未用游戏 UI 验证服务器实时状态。

## 阅读报告

| 专题 | 主要回答 |
| --- | --- |
| [外围系统](analysis/systems.md) | 主界面入口、功能开放、任务、活跃度、商店、扭蛋、赛季的关系 |
| [成长系统](analysis/growth.md) | 角色等级与属性、武器升星/强化、技能/宠物、段位和战令 |
| [匹配系统](analysis/matching.md) | 单人/组队、招募补人、准备、发起/取消匹配、成功回包 |
| [局内流程](analysis/battle.md) | 加载、回合下发、蓄力发射/技能、服务端节点、超时、结算 |

[网页报告入口](docs/index.html) · [研究口径与证据目录](analysis/README.md)

## 仓库结构

```text
analysis/                  分专题的人工分析报告（网页的唯一内容源）
docs/                      GitHub Pages 静态网页；每个专题一个页面
raw/                       从本机缓存复制的原始 wxapkg 与 23 个 Lua AssetBundle
  manifest.json            每份原始文件的大小与 SHA-256
reverse/                   从原始资源提取/反编译的研究材料
  unpacked-wxapkg/         微信包成员
  lua-bytecode/            8,272 个 Lua TextAsset 字节码与清单
  lua-decompiled/          筛选出的 148 份尽力反编译 Lua 与清单
tools/                     提取、反编译、网页生成及校验脚本
vendor/                    研究用工具二进制；临时试验仓库不纳入版本控制
```

原始资源与反编译文件可能来自第三方作品，仅用于本次研究。报告将“客户端代码确认”“客户端配置值”“依据名称推断”“需服务端验证”分开书写。反编译代码存在临时变量丢失或重建错误；阅读规则时优先看配置字段、协议名称和多个调用点是否一致。

## 复现

```powershell
python -m pip install -r requirements.txt
python tools/inspect_wxapkg.py raw/wechat-packages/__WITHOUT_MULTI_PLUGINCODE__.wxapkg --appid wx64969d55b91a6963 --since 2026-09-01
python tools/extract_lua_assets.py raw/lua-bundles reverse/lua-bytecode
python tools/decompile_selected.py reverse/lua-bytecode reverse/lua-decompiled --java java --jar vendor/unluac.jar
python tools/build_site.py
python tools/check_site.py
```

若需要核对本机快照，先检查 [原始资源清单](raw/manifest.json) 的 SHA-256。`docs/` 是 GitHub Pages 的发布目录，建站命令只读取 `analysis/`，不会改动原始资源。
