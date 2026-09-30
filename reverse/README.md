# 提取与反编译内容

| 目录 | 内容 |
| --- | --- |
| `unpacked-wxapkg/` | wxapkg 成员提取结果，保留包版本/包名层级。 |
| `lua-bytecode/` | 从 23 个 Lua AssetBundle 提取出的 8,272 个 TextAsset 字节码及 `manifest.json`。 |
| `lua-decompiled/` | 筛选反编译的 148 份 Lua 文件与 `manifest.json`。 |

反编译脚本只能尽力重建 Lua。`L0_0` 等是工具生成的变量名，部分表字面量、闭包和条件顺序会失真。原始证据在 [`raw/`](../raw/README.md)，对规则的审慎解释在 [`analysis/`](../analysis/README.md)。
