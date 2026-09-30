"""Build the GitHub Pages site from the source Markdown research reports."""

from __future__ import annotations

import html
import re
from pathlib import Path

import markdown
from markdown.extensions.toc import TocExtension


ROOT = Path(__file__).resolve().parents[1]
DOCS = ROOT / "docs"
REPO = "https://github.com/chitanda233/dandanxingqiu-research"
REPORTS = [
    ("design-spec", "逆向策划设计案", "主循环、规则、成长、匹配与经济的整体复原", "00"),
    ("systems", "外围系统", "入口、功能开放、任务与资源回流", "01"),
    ("growth", "成长系统", "角色、武器、技能与赛季进度", "02"),
    ("matching", "匹配系统", "玩法目标、队伍状态和服务端边界", "03"),
    ("battle", "局内流程", "回合、弹射指令与结算", "04"),
    ("combat-math", "局内计算与操作", "发炮字段、弹道、天气和伤害边界", "05"),
    ("skills", "技能与数值", "主动技能、被动触发与等级变体", "06"),
    ("robots", "机器人与 AI", "补位、配装、战术和匹配证据", "07"),
    ("growth-numbers", "局外成长数值", "等级、宠物、武器、宝石与公平值", "08"),
    ("economy", "局外经济与留存", "任务、活跃、抽取、商店与通行证", "09"),
]


def replace_links(source: str) -> str:
    def target(match: re.Match[str]) -> str:
        path = match.group(1)
        fragment = match.group(2) or ""
        if any(path.startswith(prefix) for prefix in ("../reverse/", "../raw/", "../analysis/data/", "../tools/")):
            return f"]({REPO}/blob/main/{path[3:]}{fragment})"
        if path == "README.md":
            return "](../../index.html)"
        name = path.removesuffix(".md")
        if name in {item[0] for item in REPORTS}:
            return f"](../{name}/index.html{fragment})"
        return match.group(0)

    return re.sub(r"\]\(([^)]+?)(#[^)]+)?\)", target, source)


def report_page(slug: str, title: str, subtitle: str, number: str) -> str:
    md_source = (ROOT / "analysis" / f"{slug}.md").read_text(encoding="utf-8")
    body = markdown.markdown(
        replace_links(md_source),
        extensions=["tables", "fenced_code", TocExtension(slugify=lambda value, separator: re.sub(r"[^\w-]", "", value).lower())],
    )
    headings = re.findall(r"<h2 id=\"([^\"]+)\">(.*?)</h2>", body)
    toc = "\n".join(f'<a href="#{html.escape(anchor)}">{label}</a>' for anchor, label in headings)
    nav = "\n".join(
        f'<a class="{("current" if slug == key else "")}" href="../{key}/index.html"><span>{num}</span>{label}</a>'
        for key, label, _, num in REPORTS
    )
    return f"""<!doctype html>
<html lang="zh-CN"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="《弹弹星球》{html.escape(title)}客户端代码研究。{html.escape(subtitle)}">
<title>{html.escape(title)} · 弹弹星球代码研究</title><link rel="stylesheet" href="../../assets/site.css"></head>
<body><div class="site-shell">
<aside class="sidebar"><a class="brand" href="../../index.html"><b>弹弹星球</b><small>本机代码研究 · 缓存版 242</small></a>
<div class="nav-caption">研究专题</div><nav class="report-nav">{nav}</nav>
<div class="nav-caption section-caption">本页章节</div><nav class="toc">{toc}</nav>
<div class="sidebar-foot"><a href="{REPO}/blob/main/analysis/{slug}.md">原始 Markdown</a><a href="{REPO}/tree/main/raw">原始资源</a><a href="{REPO}/tree/main/reverse">反编译内容</a></div></aside>
<main class="report-main"><header class="report-header"><a class="back" href="../../index.html">← 返回研究门户</a><div class="eyebrow">研究专题 {number} / {len(REPORTS):02d} · 客户端源码</div><h1>{html.escape(title)}</h1><p>{html.escape(subtitle)}</p><div class="meta"><span>缓存版本 242</span><span>2026-09-30</span><span>源码可回查</span></div></header>
<article class="prose">{body}</article><footer class="report-footer"><span>本报告基于本机客户端缓存；服务端规则和当前开放状态需另行核对。</span><a href="../../index.html">返回门户 ↑</a></footer></main></div></body></html>"""


def home_page() -> str:
    cards = "\n".join(
        f'<a class="topic" href="reports/{key}/index.html"><span class="topic-num">{num} / {len(REPORTS):02d}</span><h2>{title}</h2><p>{description}</p><span class="topic-link">阅读专题 ↗</span></a>'
        for key, title, description, num in REPORTS
    )
    return f"""<!doctype html><html lang="zh-CN"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="《弹弹星球》微信小游戏逆向策划设计案：单局计算、技能、成长、匹配机器人与经济循环。">
<title>弹弹星球 · 代码研究门户</title><link rel="stylesheet" href="assets/site.css"></head><body class="home">
<header class="home-top"><div class="wordmark">弹弹星球 <span>/ CODE RESEARCH</span></div><a href="{REPO}">GitHub 仓库 ↗</a></header>
<main class="home-main"><div class="home-hero"><div class="eyebrow">WECHAT MINI GAME / UNITY + LUA / SNAPSHOT 242</div><h1>从代码反推<br><em>弹弹星球</em>的策划设计</h1><p>把战斗操作、技能数值、成长节奏、赛季匹配和机器人安排连成一套可复核的设计案。每条具体规则回到配置或调用链，未闭合的服务端环节保留边界。</p><div class="hero-meta"><span>2026.09.30 采集</span><span>23 个 Lua AssetBundle</span><span>8,272 个 Lua 字节码</span><span>75 张配置表</span></div></div>
<div class="section-label">十个研究专题 <span>SELECT A REPORT</span></div><div class="topic-grid">{cards}</div>
<section class="home-note"><div><div class="eyebrow">证据与边界</div><h2>读配置，也读它的限制</h2><p>客户端代码能说明入口、字段、请求和表现链；不能单独证明当前服是否开放、匹配池算法、抽取概率或服务器最终结算。反编译内容有局部失真，正文已标出推断与未验证部分。</p></div><div class="resource-list"><a href="{REPO}/blob/main/analysis/README.md">研究口径与证据等级 ↗</a><a href="{REPO}/blob/main/raw/manifest.json">原始包哈希清单 ↗</a><a href="{REPO}/tree/main/reverse">提取与反编译目录 ↗</a><a href="{REPO}/tree/main/tools">复现工具 ↗</a></div></section>
</main><footer class="home-footer">《弹弹星球》本机缓存研究 · AppID wx64969d55b91a6963 · 包目录 242</footer></body></html>"""


def main() -> None:
    (DOCS / "reports").mkdir(parents=True, exist_ok=True)
    for slug, title, subtitle, number in REPORTS:
        output = DOCS / "reports" / slug / "index.html"
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(report_page(slug, title, subtitle, number), encoding="utf-8")
    (DOCS / "index.html").write_text(home_page(), encoding="utf-8")
    (DOCS / ".nojekyll").touch()
    print(f"Built docs/index.html and {len(REPORTS)} topic pages")


if __name__ == "__main__":
    main()
