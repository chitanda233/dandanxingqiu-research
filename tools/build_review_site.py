"""Build the formal research report with searchable, local evidence."""
from __future__ import annotations
import html,json,re,shutil
from pathlib import Path
from urllib.parse import quote
import markdown
from markdown.extensions.toc import TocExtension
ROOT=Path(__file__).resolve().parents[1]; REVIEW=ROOT/'analysis/review'; DOCS=ROOT/'docs'
CHAPTERS=[
 ('00-review','研究摘要与核心结论','产品结构、核心机制与最终研究判断','研究总览'),
 ('01-product','产品结构与循环','从登录、开放状态到玩法与资源回流','研究总览'),
 ('02-combat','战斗与操作','行为节点、蓄力、三种弹道与HP边界','战斗与构筑'),
 ('03-skills','技能与Buff','槽位、使用资格、CD和每步升级预算','战斗与构筑'),
 ('04-growth','角色与养成','武器、宠物、装备、宝石及公平模式','战斗与构筑'),
 ('05-match','PVP与匹配','硬门槛、软提醒、赛季和机器人证据','战斗与构筑'),
 ('06-pve','副本与爬塔','剧情、组队、噩梦系数和材料奖励','挑战玩法'),
 ('07-rogue','肉鸽挑战','节点状态、事件选择和愿望保存','挑战玩法'),
 ('08-pinball','弹球闯关','独立50关、布局球组、计分与提交','挑战玩法'),
 ('09-guild','公会与团体战','组织生命周期、权限与团体活动','社交与生产'),
 ('10-social','社交与互动','好友、师徒、婚姻、聊天和多人房间','社交与生产'),
 ('11-home','家园与职业','方案编辑、复制、制造、魅力与访问','社交与生产'),
 ('12-farm','农场与订单','种植、偷菜、互动资格和共享订单','社交与生产'),
 ('13-economy','经济与交易','日常投放、抽取、动态商店与税率','经济与运营'),
 ('14-monetization','商业化功能','订单、月卡、广告和双轨通行证','经济与运营'),
 ('15-liveops','活动与留存','任务、节日、回归和复合活动','经济与运营'),
 ('16-platform','技术架构与研究方法','资产提取、字节码、Unity桥接与数据同步','架构与结论'),
 ('17-assessment','综合结论与系统设计','操作、成长、社交、经济与运营的整体分析','架构与结论'),
]
UTILS=[('catalog','功能目录','189个命名空间 · 按系统、函数与协议检索'),('configs','配置浏览器','1,555份有效导出 · 按表与记录查询'),('evidence','原指令查询','3,088份原始指令 · 查看函数、跳转与哈希'),('labs','交互实验室','技能预算 · 模式对照 · 50关弹球布局'),('tests','原函数执行记录','144个受控执行场景 · 输入、输出与断言')]
def read(name):return json.loads((REVIEW/(name+'.json')).read_text())
def dump(path,obj):path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(obj,ensure_ascii=False,separators=(',',':'))+'\n')
def esc(s):return html.escape(str(s),quote=True)
def links(source):
 def link(m):
  typ,target=m.groups();name,_,fn=target.partition('#')
  return ']('+('evidence.html?module='+quote(name)+'&function='+quote(fn) if typ=='evidence' else 'configs.html?table='+quote(name)+'&q='+quote(fn))+')'
 source=re.sub(r'\]\((\d\d-[\w-]+)\.md\)',r'](\1.html)',source)
 return re.sub(r'\]\((evidence|config):([^\)]+)\)',link,source)
def sidebar(current,prefix):
 out=[f'<a class="brand" href="{prefix}index.html"><span class="brand-mark">弹</span><span><b>弹弹星球</b><small>功能逆向研究 / 242</small></span></a>']
 out.append(f'<button class="search-open" type="button"><span>搜索报告与功能</span><kbd>⌘ K</kbd></button>')
 out.append(f'<a class="nav-home {"active" if current=="home" else ""}" href="{prefix}index.html">研究首页 <span>↗</span></a>')
 group=None
 for slug,title,_,g in CHAPTERS:
  if group!=g:out.append(f'<div class="nav-label">{g}</div>');group=g
  out.append(f'<a class="nav-item {"active" if slug==current else ""}" href="{prefix}review/{slug}.html"><span>{slug[:2]}</span>{title}</a>')
 out.append('<div class="nav-label">研究工具</div>')
 for slug,title,_ in UTILS:out.append(f'<a class="nav-item {"active" if slug==current else ""}" href="{prefix}review/{slug}.html"><span>◌</span>{title}</a>')
 out.append(f'<div class="sidebar-foot">采集 2026.09.30 / 报告 2026.10.03<br><a href="{prefix}data/review-report.md" download>完整 Markdown ↓</a></div>')
 return ''.join(out)
def shell(slug,title,subtitle,body,toc='',home=False):
 prefix='' if home else '../'
 return f'''<!doctype html><html lang="zh-CN"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><meta name="description" content="弹弹星球功能逆向研究：{esc(subtitle)}"><title>{esc(title)} · 弹弹星球研究</title><link rel="stylesheet" href="{prefix}assets/review.css"><script defer src="{prefix}assets/review.js"></script></head>
<body data-page="{slug}" data-root="{prefix}"><a class="skip" href="#content">跳至正文</a><aside class="sidebar" id="sidebar">{sidebar(slug,prefix)}</aside><div class="workspace"><header class="topbar"><button class="menu-button" aria-label="展开导航" aria-controls="sidebar" aria-expanded="false">☰</button><span>CLIENT RESEARCH <i>/</i> <b>{esc(title)}</b></span><div><span class="snapshot">缓存快照 242</span><button class="search-icon search-open" aria-label="搜索">⌕</button><button class="print-button" title="打印本页" aria-label="打印本页">↥</button></div></header><main id="content" class="{'home-main' if home else 'page-main'}">
{'' if home else f'<header class="page-heading"><div class="eyebrow">{("研究工具" if slug in [u[0] for u in UTILS] else "功能专题 · "+slug[:2])} / REVERSE ENGINEERING</div><h1>{esc(title)}</h1><p>{esc(subtitle)}</p><div class="meta-row"><span>版本 242</span><span>2026.10.03 报告</span><span>原文件可追溯</span></div></header>'}
<div class="{'home-content' if home else 'reading-layout' if toc else 'tool-layout'}">{body}{f'<aside class="page-toc"><div>本页目录</div>{toc}<a class="to-top" href="#content">返回顶部 ↑</a></aside>' if toc else ''}</div>
<footer class="footer"><span>版本 242 客户端研究 · 字节码、有效配置与原函数证据。</span><a href="{prefix}data/review-report.md" download>下载完整报告 ↓</a></footer></main></div>
<dialog id="search-dialog" aria-label="全站搜索"><div class="dialog-bar"><input id="global-search" aria-label="搜索关键词" placeholder="搜索功能、规则、模块或请求…" autocomplete="off"><button id="search-close" aria-label="关闭搜索">×</button></div><div id="search-results" class="search-results"><p class="muted">输入关键词，搜索专题正文和功能目录。</p></div></dialog></body></html>'''
def home():
 cards=''.join(f'<a class="topic-card" href="review/{slug}.html"><span class="topic-number">{slug[:2]} / {g}</span><h3>{t} <span>↗</span></h3><p>{d}</p></a>' for slug,t,d,g in CHAPTERS)
 tools=''.join(f'<a class="tool-card" href="review/{slug}.html"><span>0{i+1}</span><h3>{t} ↗</h3><p>{d}</p></a>' for i,(slug,t,d) in enumerate(UTILS))
 return f'''<section class="hero"><div class="hero-copy"><div class="eyebrow"><span class="status-dot"></span> GAME SYSTEMS REPORT · 2026.10.03</div><h1>《弹弹星球》<br><span>游戏系统研究</span></h1><p>从反编译代码与有效配置出发，分析回合操作、构筑养成、挑战玩法、组织生产和资源经济，给出游戏功能与系统设计的完整结论。</p><div class="hero-actions"><a class="button primary" href="review/00-review.html">阅读研究摘要 <span>→</span></a><a class="button" href="review/catalog.html">查看功能目录</a></div><div class="hero-scope">Unity + Lua 5.1 <i>/</i> 微信小游戏 <i>/</i> 缓存版本 242</div></div><div class="hero-diagram" aria-label="玩法与系统循环示意"><div class="diagram-caption">SYSTEM MAP / 功能关系</div><svg viewBox="0 0 440 380" role="img" aria-label="战斗、构筑、挑战、社交、生产、经济相互连接"><defs><pattern id="dots" width="18" height="18" patternUnits="userSpaceOnUse"><circle cx="1" cy="1" r="1" fill="#c6d7d3"/></pattern></defs><rect width="440" height="380" fill="url(#dots)"/><g stroke="#8eaaa3" fill="none"><path d="M220 105L350 170L350 270L220 330L90 270L90 170Z"/><path d="M220 210L220 105M220 210L350 170M220 210L350 270M220 210L220 330M220 210L90 270M220 210L90 170"/></g><g fill="#fff" stroke="#c3d4d0"><circle cx="220" cy="105" r="35"/><circle cx="350" cy="170" r="35"/><circle cx="350" cy="270" r="35"/><circle cx="220" cy="330" r="35"/><circle cx="90" cy="270" r="35"/><circle cx="90" cy="170" r="35"/></g><circle cx="220" cy="210" r="55" fill="#0d6157"/><g fill="#203c37" text-anchor="middle" font-size="15" font-family="sans-serif"><text x="220" y="110">战斗</text><text x="350" y="175">构筑</text><text x="350" y="275">挑战</text><text x="220" y="335">经济</text><text x="90" y="275">生产</text><text x="90" y="175">社交</text></g><text x="220" y="207" fill="white" text-anchor="middle" font-size="19">玩家状态</text><text x="220" y="229" fill="#b3d8cb" text-anchor="middle" font-size="11">INPUT → UPDATE</text></svg><div class="diagram-note">依赖关系示意 · 非游戏实际界面</div></div></section>
<section class="stats"><div><b>8,272</b><span>原字节码逐字节核对</span></div><div><b>1,555</b><span>成功配置导出 · 含分片</span></div><div><b>144</b><span>原函数执行场景</span></div><div><b>50</b><span>弹球关卡与布局</span></div></section>
<section class="findings-section"><div class="section-head"><div><span class="eyebrow">CORE CONCLUSIONS</span><h2>游戏系统的四个核心特征</h2></div><a href="review/17-assessment.html">阅读综合结论 →</a></div><div class="findings-grid"><a href="review/02-combat.html" class="finding"><span class="badge">回合战斗</span><h3>操作与构筑共同驱动</h3><p>位置、角度、力度与技能构成操作输入；模式平衡和多轴养成共同定义战斗能力。</p></a><a href="review/06-pve.html" class="finding"><span class="badge amber">挑战推进</span><h3>多种玩法使用独立进度</h3><p>关卡、楼层、肉鸽节点与50关弹球分别维护推进、目标和收益状态。</p></a><a href="review/09-guild.html" class="finding"><span class="badge">社交生产</span><h3>关系网络参与资源循环</h3><p>公会权限、家园职业、农场互助与共享订单连接个人成长和成员协作。</p></a><a href="review/13-economy.html" class="finding"><span class="badge amber">经济运营</span><h3>资源、额度与周期共同控制节奏</h3><p>培养消耗、动态交易、月卡、广告与通行证在各自账本和资格条件下协同。</p></a></div></section>
<section><div class="section-head"><div><span class="eyebrow">18 CHAPTERS</span><h2>按游戏系统深入阅读</h2></div><span class="muted">入口 → 状态 → 规则 → 数值 → 边界</span></div><div class="topic-grid">{cards}</div></section>
<section><div class="section-head"><div><span class="eyebrow">EXPLORE THE EVIDENCE</span><h2>查询规则与原始证据</h2></div></div><div class="tool-grid">{tools}</div></section>
<section class="scope-note"><div><span class="eyebrow">EVIDENCE FIRST</span><h2>全量索引，明确验证深度</h2></div><p>189 个命名空间包含技术模块；配置表含分服和等级变体。结构索引、指令分析和原函数验证分别标记。客户端机制与服务器权威结果按来源区分，具体公式、调用链和执行场景均可查询。</p><a href="review/16-platform.html">技术架构与研究方法 →</a></section>'''
def tool_body(slug):
 if slug=='catalog':return '''<div class="callout">中文名称是研究导航别名。189 个命名空间包含基础设施；“有原函数验证”只表示该模块有已执行场景，不代表每个函数全部验证。</div><div class="controls"><label>搜索功能、模块、函数、消息<input id="catalog-search" placeholder="例如：农场、pinball、trade_buy"></label><label>系统<select id="catalog-category"><option value="">全部系统</option></select></label><label>证据深度<select id="catalog-level"><option value="">全部深度</option><option>有原函数验证</option><option>指令分析</option><option>结构索引</option></select></label></div><div class="result-status" id="catalog-status" aria-live="polite"></div><div class="catalog-grid" id="catalog-list"></div><dialog id="feature-dialog" class="feature-dialog"><button class="dialog-x" aria-label="关闭详情">×</button><div id="feature-detail"></div></dialog>'''
 if slug=='configs':return '''<div class="callout">有效字段已解析元表默认值。各后缀表独立展示，未自动合并为当前区服。1,555 份成功输出含 3 份函数标记表；7 份失败候选列在清单中。</div><div class="controls config-controls"><label>筛选表名<input id="table-filter" placeholder="例如：farm、weapon、language"></label><label>选择配置<select id="config-select" aria-label="选择配置表"></select></label></div><div id="config-meta" class="source-meta"></div><div class="controls"><label>在当前表搜索 ID、名称或字段值<input id="row-search" placeholder="例如：70101001、冰冻、reward"></label><a id="config-download" class="button" download>下载本表 JSON ↓</a></div><div id="config-status" class="result-status" aria-live="polite"></div><div id="config-rows"></div><div class="pager"><button id="config-prev">← 上一页</button><span id="config-page"></span><button id="config-next">下一页 →</button></div><details class="failures"><summary>查看 7 份未返回表的候选</summary><div id="config-errors"></div></details>'''
 if slug=='evidence':return '''<div class="callout">这是原 Lua 5.1 指令，不是重构源码。PC 跳转、原行号和函数路径保留；部分闭包名称由赋值识别。源文件哈希可回查原字节码。</div><div class="controls"><label>筛选模块路径<input id="evidence-filter" placeholder="例如：farm.manager.core"></label><label>选择模块<select id="evidence-select" aria-label="选择原指令模块"></select></label></div><div id="evidence-meta" class="source-meta"></div><div class="controls"><label>函数<select id="function-select" aria-label="选择函数"></select></label><label>在指令中搜索<input id="instruction-search" placeholder="例如：RETURN、max_hp"></label><a id="evidence-download" class="button" download>下载完整指令 ↓</a></div><div id="instruction-status" class="result-status" aria-live="polite"></div><pre class="instruction-code" id="evidence-code" tabindex="0"></pre>'''
 if slug=='tests':return '''<div class="callout">两个执行类别合计144个场景。执行的是原字节码；账号、Unity、时间、UI与网络使用离线桩对象。执行记录说明给定输入下的客户端返回契约。</div><div id="test-stats" class="stats compact"></div><div class="controls"><label>搜索场景、输入或代码<input id="test-search" placeholder="例如：偷菜、到期、HP"></label><label>验证套件<select id="test-suite"><option value="">全部144个</option><option value="review">规则断言109个</option><option value="legacy">行为记录35个</option></select></label></div><div id="test-status" class="result-status" aria-live="polite"></div><div id="test-list"></div>'''
 return '''<div class="lab-tabs" role="tablist" aria-label="选择实验"><button role="tab" aria-selected="true" data-lab="budget">技能升级预算</button><button role="tab" aria-selected="false" data-lab="modes">玩法模式对照</button><button role="tab" aria-selected="false" data-lab="pinball">弹球关卡与布局</button></div>
<section id="lab-budget" class="lab-panel"><h2>按当前级费用逐步累加</h2><p class="muted">使用 skill_base_upgrade_0。只核算配置成本，不代替等级、开服日、任务和其他技能资格检查；无服务器折扣。</p><div class="controls"><label>技能<select id="budget-skill"></select></label><label>当前等级<input id="budget-from" type="number" min="0" max="80" value="0"></label><label>目标等级<input id="budget-to" type="number" min="0" max="80" value="40"></label></div><div id="budget-result" aria-live="polite"></div></section>
<section id="lab-modes" class="lab-panel" hidden><h2>同一操作，不同玩法规则</h2><p class="muted">70条缓存定义含测试/历史候选。字段原单位不擅自转换；缺字段显示“未配置”。</p><div class="controls"><label>玩法 A<select id="mode-a"></select></label><label>玩法 B<select id="mode-b"></select></label></div><div id="mode-result"></div></section>
<section id="lab-pinball" class="lab-panel" hidden><h2>50关弹球配置实验</h2><p class="muted">目标分与HP总和是不同指标。布局为像素数据示意，未模拟碰撞；初始球组优先于默认8球。</p><div class="pinball-chart" id="pinball-chart"></div><div class="controls"><label>关卡<select id="pinball-stage"></select></label><label>布局阶段<select id="pinball-wave"></select></label><label>查看区域<select id="pinball-zoom"><option value="active">当前布局区域</option><option value="full">完整画布</option></select></label></div><div id="pinball-stats" class="stats compact"></div><div class="pinball-layout"><div class="pinball-canvas" id="pinball-canvas"></div><div id="pinball-info"></div></div></section>'''
def main(include_legacy=True):
 (DOCS/'review').mkdir(parents=True,exist_ok=True);(DOCS/'data').mkdir(exist_ok=True)
 targets={'design-spec':'01-product','systems':'01-product','growth':'04-growth','growth-numbers':'04-growth','matching':'05-match','battle':'02-combat','combat-math':'02-combat','skills':'03-skills','robots':'05-match','economy':'13-economy'}
 def redirect(url):
  return f'<!doctype html><html lang="zh-CN"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><meta http-equiv="refresh" content="0;url={url}"><title>弹弹星球研究报告</title><body><a href="{url}">打开研究报告</a></body></html>'
 for slug,target in targets.items():
  p=DOCS/'reports'/slug/'index.html';p.parent.mkdir(parents=True,exist_ok=True);p.write_text(redirect('../../review/'+target+'.html'))
 (DOCS/'legacy.html').write_text(redirect('index.html'))
 inv={r['name']:r for r in read('inventory')};cf=read('config-manifest');ev=read('evidence-manifest');catalog=read('feature-catalog')
 dump(DOCS/'data/config-manifest.json',cf);dump(DOCS/'data/evidence-manifest.json',ev);dump(DOCS/'data/catalog.json',catalog)
 for r in cf:
  if 'output' in r:
   p=DOCS/'data/configs'/r['output'];p.parent.mkdir(exist_ok=True);shutil.copyfile(REVIEW/'configs'/r['output'],p)
 for r in ev:
  p=DOCS/'data/evidence'/(r['name']+'.txt');p.parent.mkdir(exist_ok=True);shutil.copyfile(ROOT/r['listing'],p)
 for name in ['mode-matrix','pinball-stages','pinball-layouts','item-names','inventory-summary','derived-summary','bundle-audit','probes']:
  shutil.copyfile(REVIEW/(name+'.json'),DOCS/'data'/(name+'.json'))
 shutil.copyfile(ROOT/'analysis/data/client_rule_probes.json',DOCS/'data/legacy-probes.json')
 shutil.copyfile(REVIEW/'configs/skill_base_upgrade.skill_base_upgrade_0.json',DOCS/'data/skill-upgrades.json')
 # Keep Chinese lookup compact and omit the privacy policy/legal corpus from UI payload.
 t=read('translations');dump(DOCS/'data/labels.json',{k:v for k,v in t.items() if len(v)<240})
 search=[]; combined=[]
 for slug,title,desc,g in CHAPTERS:
  src=(REVIEW/'reports'/(slug+'.md')).read_text();combined.append(src)
  md=markdown.Markdown(extensions=['tables','fenced_code',TocExtension(permalink=False)])
  body=md.convert(links(re.sub(r'^# .*\n','',src,count=1)))
  # Make wide tables scroll independently on phones.
  body=body.replace('<table>','<div class="table-wrap"><table>').replace('</table>','</table></div>')
  toc=''.join(f'<a href="#{esc(a)}">{label}</a>' for a,label in re.findall(r'<h2 id="([^"]+)">(.*?)</h2>',body))
  n=[x[0] for x in CHAPTERS].index(slug);prev=CHAPTERS[n-1] if n else None;nxt=CHAPTERS[n+1] if n<len(CHAPTERS)-1 else None
  pager='<nav class="chapter-pager">'+(f'<a href="{prev[0]}.html">← {prev[1]}</a>' if prev else '<span></span>')+(f'<a href="{nxt[0]}.html">{nxt[1]} →</a>' if nxt else '<span></span>')+'</nav>'
  (DOCS/'review'/(slug+'.html')).write_text(shell(slug,title,desc,'<article class="prose">'+body+pager+'</article>',toc))
  search.append({'title':title,'group':g,'href':'review/'+slug+'.html','text':re.sub(r'<[^>]+>',' ',body)})
 for slug,title,desc in UTILS:(DOCS/'review'/(slug+'.html')).write_text(shell(slug,title,desc,tool_body(slug)))
 for r in catalog:search.append({'title':r['label']+' / '+r['id'],'group':r['category'],'href':'review/catalog.html?q='+quote(r['id']),'text':' '.join([r['label'],r['id'],r['category']]+r['messages']+[f['name'] for f in r['functions']])})
 dump(DOCS/'data/search-index.json',search)
 (DOCS/'data/review-report.md').write_text('# 《弹弹星球》游戏功能与系统设计研究报告\n\n'+'\n\n---\n\n'.join(combined))
 (REVIEW/'full-report.md').write_text((DOCS/'data/review-report.md').read_text())
 (DOCS/'index.html').write_text(shell('home','研究首页','18章正式研究报告与可查询证据',home(),home=True));(DOCS/'.nojekyll').touch()
 print(f'Built research report: {len(CHAPTERS)} chapters, {len(UTILS)} tools, {len(catalog)} namespaces, {sum("output" in r for r in cf)} configs, {len(ev)} instruction files')
if __name__=='__main__':main()
