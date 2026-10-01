/* Static, offline-first research UI. All fetches target report assets only. */
'use strict';
const $ = (id) => document.getElementById(id);
const root = document.body.dataset.root || '';
const query = new URLSearchParams(location.search);
const cache = new Map();
const esc = (v) => String(v ?? '').replace(/[&<>"']/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
const fmt = (v) => Number(v).toLocaleString('zh-CN');
const values = (v) => Array.isArray(v) ? v : Object.values(v || {});
const entries = (v) => Array.isArray(v) ? v.map((x,i)=>[String(i+1),x]) : Object.entries(v || {});
const json = (v) => JSON.stringify(v,null,2);
const opts = (rows, key, label) => rows.map(r=>`<option value="${esc(key(r))}">${esc(label(r))}</option>`).join('');
const errorBox = (err) => `<div class="error">资料加载失败：${esc(err.message)}。请使用本地 HTTP 服务打开报告；直接双击 HTML 时浏览器可能限制 JSON 读取。可运行：python3 -m http.server 8765 --directory docs</div>`;
function fetchData(path, raw=false) {
 const k=path+(raw?'#text':'');
 if(!cache.has(k)) cache.set(k,fetch(root+'data/'+path).then(r=>{if(!r.ok)throw Error(`${path} (${r.status})`);return raw?r.text():r.json();}));
 return cache.get(k);
}
function setQuery(fields) {const q=new URLSearchParams(location.search);for(const [k,v] of Object.entries(fields)){v?q.set(k,v):q.delete(k);}history.replaceState(null,'',location.pathname+(q.size?'?'+q:''));}
function highlight(s,q){if(!q)return esc(s);const p=s.toLowerCase().indexOf(q.toLowerCase());return p<0?esc(s):esc(s.slice(0,p))+'<mark>'+esc(s.slice(p,p+q.length))+'</mark>'+esc(s.slice(p+q.length));}
function debounce(fn,ms=160){let t;return (...args)=>{clearTimeout(t);t=setTimeout(()=>fn(...args),ms);};}
function closeDialog(d){if(d?.open)d.close();}
document.querySelector('.menu-button')?.addEventListener('click',e=>{const open=$('sidebar').classList.toggle('open');e.currentTarget.setAttribute('aria-expanded',String(open));});
document.querySelector('.print-button')?.addEventListener('click',()=>window.print());
document.addEventListener('click',e=>{if(window.innerWidth<681&&!e.target.closest('.sidebar,.menu-button')){$('sidebar').classList.remove('open');document.querySelector('.menu-button').setAttribute('aria-expanded','false');}});

// Search stays lazy so normal reading never downloads the catalog or index.
let searchIndex;
async function openSearch(){const d=$('search-dialog');d.showModal();$('global-search').focus();try{searchIndex=await fetchData('search-index.json');}catch(e){$('search-results').innerHTML=errorBox(e);}}
document.querySelectorAll('.search-open').forEach(b=>b.addEventListener('click',openSearch));
$('search-close').addEventListener('click',()=>closeDialog($('search-dialog')));
document.addEventListener('keydown',e=>{if((e.metaKey||e.ctrlKey)&&e.key.toLowerCase()==='k'){e.preventDefault();if($('search-dialog').open)closeDialog($('search-dialog'));else openSearch();}});
$('global-search').addEventListener('input',debounce(async()=>{
 const q=$('global-search').value.trim().toLowerCase();if(!q){$('search-results').innerHTML='<p class="muted">输入关键词，搜索专题正文和功能目录。</p>';return;}
 try{const data=searchIndex||await fetchData('search-index.json');const terms=q.split(/\s+/);const hits=data.filter(r=>terms.every(t=>(r.title+' '+r.text).toLowerCase().includes(t))).sort((a,b)=>(b.title.toLowerCase().includes(q)?1:0)-(a.title.toLowerCase().includes(q)?1:0));
  $('search-results').innerHTML=`<p class="result-status">${hits.length} 个结果${hits.length>30?' · 显示前30个':''}</p>`+hits.slice(0,30).map(r=>{const p=r.text.toLowerCase().indexOf(terms[0]);const excerpt=r.text.slice(Math.max(0,p-35),Math.max(0,p-35)+150);return `<a class="search-hit" href="${root+esc(r.href)}"><small>${esc(r.group)}</small><strong>${highlight(r.title,q)}</strong><p>${highlight(excerpt,terms[0])}…</p></a>`;}).join('');
 }catch(e){$('search-results').innerHTML=errorBox(e);}
}));

async function catalogPage(){
 const rows=await fetchData('catalog.json');const cats=[...new Set(rows.map(r=>r.category))];$('catalog-category').innerHTML+='<option>'+cats.map(esc).join('</option><option>')+'</option>';
 $('catalog-search').value=query.get('q')||'';
 const levelClass=l=>l==='有原函数验证'?'':l==='指令复核'?'amber':'gray';
 function render(){const q=$('catalog-search').value.trim().toLowerCase(),cat=$('catalog-category').value,lv=$('catalog-level').value;const rs=rows.filter(r=>(!cat||r.category===cat)&&(!lv||r.level===lv)&&(!q||(r.label+' '+r.id+' '+r.messages.join(' ')+' '+r.functions.map(f=>f.name).join(' ')).toLowerCase().includes(q)));
  $('catalog-status').textContent=`${rs.length} / ${rows.length} 个命名空间`;
  $('catalog-list').innerHTML=rs.length?rs.map(r=>`<button class="module-card" data-module="${esc(r.id)}"><span class="badge ${levelClass(r.level)}">${esc(r.level)}</span><span class="badge gray">${esc(r.category)}</span><h3>${esc(r.label)} <span>↗</span></h3><small>${esc(r.id)}</small><p>${r.chunks} 份字节码 · ${r.functions.length} 个命名函数引用<br>${r.messages.length} 个请求/消息符号</p></button>`).join(''):'<div class="empty">没有匹配项。可换用英文模块名或更短的关键词。</div>';
  setQuery({q:$('catalog-search').value});
 }
 $('catalog-list').addEventListener('click',e=>{const b=e.target.closest('[data-module]');if(!b)return;const r=rows.find(x=>x.id===b.dataset.module);$('feature-detail').innerHTML=`<span class="badge ${levelClass(r.level)}">${esc(r.level)}</span><h2>${esc(r.label)}</h2><div class="muted">${esc(r.id)} / ${esc(r.category)}</div><p>有 ${r.chunks} 份缓存字节码、${r.sources.length} 份本报告原指令。${r.level==='结构索引'?'已定位函数和消息，尚未逐项深入验证。':'该专题有详细规则；标签不意味着模块每个分支都已测试。'}</p>${r.report?`<a class="button primary" href="${r.report}.html">阅读系统专题 →</a>`:''}<h3>处理函数</h3><div class="function-count">${r.functions.length} 个命名引用，保留不同源文件中的同名函数。</div><div class="function-list">${r.functions.map(f=>f.evidence?`<a href="evidence.html?module=${encodeURIComponent(f.source)}&function=${encodeURIComponent(f.name)}" title="${esc(f.source)}">${esc(f.name)} ↗</a>`:`<span>${esc(f.name)}</span>`).join('')||'暂无可识别的命名函数'}</div><h3>请求 / 消息符号</h3><p class="muted">包括协议、包装或注册符号；不等于独立服务端端点数。</p><div class="symbol-list">${r.messages.map(esc).join('<br>')||'未找到该命名空间的消息字符串'}</div><h3>原指令入口</h3><div class="function-list">${r.sources.map(s=>`<a href="evidence.html?module=${encodeURIComponent(s)}">${esc(s.replace('game.module.',''))} ↗</a>`).join('')}</div>`;$('feature-dialog').showModal();});
 $('feature-dialog').querySelector('.dialog-x').addEventListener('click',()=>closeDialog($('feature-dialog')));
 $('catalog-search').addEventListener('input',debounce(render));['catalog-category','catalog-level'].forEach(id=>$(id).addEventListener('change',render));render();
}

async function configsPage(){
 const [manifest,labels,names]=await Promise.all([fetchData('config-manifest.json'),fetchData('labels.json'),fetchData('item-names.json')]);
 const tables=manifest.filter(r=>r.output).sort((a,b)=>a.output.localeCompare(b.output));let selected=query.get('table')||'pinball_stage.pinball_stage',records=[],page=0,request=0;
 $('row-search').value=query.get('q')||'';
 $('config-errors').innerHTML=manifest.filter(r=>!r.output).map(r=>`<p><code>${esc(r.name)}</code>：${esc(r.error)}</p>`).join('');
 function populate(){const q=$('table-filter').value.trim().toLowerCase();const rs=tables.filter(r=>r.output.toLowerCase().includes(q));$('config-select').innerHTML=opts(rs,r=>r.output.slice(0,-5),r=>`${r.output.slice(0,-5)} (${r.rows}行${r.function_values?' · 函数标记':''})`);if(rs.some(r=>r.output===selected+'.json'))$('config-select').value=selected;else if(rs.length){selected=$('config-select').value;load();}else{$('config-status').textContent='没有匹配的表';}}
 function labelFor(k,v){if(typeof v==='string')return labels[v]||v;if(v&&typeof v==='object'){return labels[v.name]||labels[v.stage_name]||names[v.id]||names[k]||v.stage_name||v.name||v.desc||v.key||'';}return String(v??'');}
 function render(){const q=$('row-search').value.trim().toLowerCase();const rs=records.filter(([k,v])=>!q||(k+' '+JSON.stringify(v)+' '+labelFor(k,v)).toLowerCase().includes(q));const pages=Math.max(1,Math.ceil(rs.length/40));page=Math.min(page,pages-1);
  $('config-status').textContent=`${rs.length} / ${records.length} 条记录 · 每页40条 · 点开查看完整有效字段`;
  $('config-page').textContent=`第 ${page+1} / ${pages} 页`;$('config-prev').disabled=page===0;$('config-next').disabled=page===pages-1;
  $('config-rows').innerHTML=rs.slice(page*40,page*40+40).map(([k,v])=>{const fields=v&&typeof v==='object'?Object.entries(v).slice(0,5).map(([a,b])=>`${a}: ${typeof b==='object'?JSON.stringify(b).slice(0,45):b}`).join(' · '):String(v);return `<details class="record"><summary><strong>${esc(k)}</strong><b>${esc(labelFor(k,v))}</b><span>${esc(fields.slice(0,350))}</span></summary><pre class="json-code">${esc(json(v))}</pre></details>`;}).join('')||'<div class="empty">当前表没有匹配记录。</div>';
  setQuery({table:selected,q:$('row-search').value});
 }
 async function load(){const n=++request;const r=tables.find(r=>r.output===selected+'.json');if(!r)return;$('config-status').textContent='正在加载配置…';try{const data=await fetchData('configs/'+r.output);if(n!==request)return;records=entries(data).sort(([a],[b])=>a.localeCompare(b,undefined,{numeric:true}));page=0;$('config-download').href=root+'data/configs/'+r.output;$('config-meta').innerHTML=`<b>${esc(r.name)}</b><br>${r.rows} 条记录 · ${r.function_values?'含函数标记，不能作为完整执行器':'纯数据表，默认字段已解析'}<br>原文件：<code>${esc(r.source)}</code><br>SHA-256：<code>${esc(r.sha256)}</code><br>依赖：${(r.dependencies||[]).map(d=>esc(d.name.replace('auto_gen.package_include.config.',''))).join('、')}`;render();}catch(e){$('config-rows').innerHTML=errorBox(e);}}
 $('config-select').addEventListener('change',()=>{selected=$('config-select').value;load();});$('table-filter').addEventListener('input',debounce(populate));$('row-search').addEventListener('input',debounce(()=>{page=0;render();}));$('config-prev').addEventListener('click',()=>{page--;render();});$('config-next').addEventListener('click',()=>{page++;render();});populate();await load();
}

async function evidencePage(){
 const rows=(await fetchData('evidence-manifest.json')).filter(r=>r.listing).sort((a,b)=>a.name.localeCompare(b.name));let selected=query.get('module')||'game.module.pin_ball_game.manager.core',sections=[],raw='',request=0;
 function populate(){const q=$('evidence-filter').value.trim().toLowerCase();const rs=rows.filter(r=>r.name.toLowerCase().includes(q));$('evidence-select').innerHTML=opts(rs,r=>r.name,r=>r.name.replace('game.module.',''));if(rs.some(r=>r.name===selected))$('evidence-select').value=selected;else if(rs.length){selected=$('evidence-select').value;load();}}
 function render(){const i=$('function-select').value;const source=i==='all'?raw:sections[Number(i)]?.text||'';const q=$('instruction-search').value.trim();let lines=source.split('\n'),out;
  if(q){const visible=new Set();lines.forEach((line,i)=>{if(line.toLowerCase().includes(q.toLowerCase()))for(let j=Math.max(0,i-2);j<=Math.min(lines.length-1,i+2);j++)visible.add(j);});out=[...visible].sort((a,b)=>a-b).map(i=>`${String(i+1).padStart(5)}  ${lines[i]}`);$('instruction-status').textContent=`${out.length} 行搜索上下文 · 行号是当前所选片段内行号`;}else{out=lines;$('instruction-status').textContent=`${lines.length} 行 · ${sections.length} 个函数片段`;}
  $('evidence-code').innerHTML=out.map(l=>highlight(l,q)).join('\n')||'未找到匹配的指令';const name=i==='all'?'':sections[Number(i)]?.names[0]||'';setQuery({module:selected,function:name});
 }
 async function load(){const n=++request;try{const r=rows.find(x=>x.name===selected);if(!r)return;const text=await fetchData('evidence/'+selected+'.txt',true);if(n!==request)return;raw=text;sections=raw.split(/(?=; Function [\d.]+:)/).filter(s=>s.startsWith('; Function ')).map(text=>{const m=text.match(/^; Function ([\d.]+):([^\n]*)/);return {text,path:m[1],names:m[2].trim().split(', ').filter(Boolean)};});
  $('evidence-meta').innerHTML=`<b>${esc(selected)}</b><br>原文件：<code>${esc(r.source)}</code><br>SHA-256：<code>${esc(r.sha256)}</code><br>原文件未改动；展示为指令列表，未重构控制流。`;$('evidence-download').href=root+'data/evidence/'+selected+'.txt';$('function-select').innerHTML='<option value="all">完整模块指令</option>'+sections.map((s,i)=>`<option value="${i}">${esc(s.path+' · '+(s.names.join(', ')||'未命名函数'))}</option>`).join('');const fn=query.get('function');const hit=fn?sections.findIndex(s=>s.names.includes(fn)):-1;if(hit>=0)$('function-select').value=String(hit);render();
 }catch(e){$('evidence-code').innerHTML=errorBox(e);}}
 $('evidence-filter').addEventListener('input',debounce(populate));$('evidence-select').addEventListener('change',()=>{selected=$('evidence-select').value;load();});$('function-select').addEventListener('change',render);$('instruction-search').addEventListener('input',debounce(render));populate();await load();
}

async function testsPage(){
 const [fresh,old]=await Promise.all([fetchData('probes.json'),fetchData('legacy-probes.json')]);const rows=[...fresh.cases.map(c=>({...c,suite:'review'})),...old.cases.map(c=>({...c,suite:'legacy'}))];
 $('test-stats').innerHTML=`<div><b>97</b><span>新增场景 · 显式断言通过</span></div><div><b>35</b><span>旧场景 · 复跑记录一致</span></div><div><b>${fresh.sources.length}</b><span>新增套件原字节码来源</span></div><div><b>离线</b><span>无游戏服务器调用</span></div>`;
 function render(){const q=$('test-search').value.toLowerCase(),suite=$('test-suite').value;const rs=rows.filter(c=>(!suite||c.suite===suite)&&(!q||JSON.stringify(c).toLowerCase().includes(q)));$('test-status').textContent=`${rs.length} / 132 个场景`;
  $('test-list').innerHTML=rs.map(c=>`<details class="test-row"><summary><span class="pass-badge">${c.suite==='review'?'✓ 断言通过':'✓ 复跑一致'}</span><strong>${esc(c.label)}</strong><span class="suite">${c.suite==='review'?'新增 · '+c.topic:'原有套件'}</span></summary><div class="test-detail"><h4>输入与桩设置</h4><pre class="json-code">${esc(json(c.inputs))}</pre><h4>原函数返回</h4><pre class="json-code">${esc(json(c.returned))}</pre>${c.expected?'<h4>显式预期断言</h4><pre class="json-code">'+esc(json(c.expected))+'</pre>':'<p class="muted">旧套件JSON保留运行返回值。本次以采集的返回快照复跑对比，不将它等同新增显式规则断言。</p>'}${c.code?'<h4>测试调用代码（逻辑来自原字节码）</h4><pre class="json-code">'+esc(c.code)+'</pre>':''}</div></details>`).join('')||'<div class="empty">没有匹配场景。</div>';
 }
 $('test-search').addEventListener('input',debounce(render));$('test-suite').addEventListener('change',render);render();
}

async function labsPage(){
 document.querySelectorAll('[data-lab]').forEach(b=>b.addEventListener('click',()=>{document.querySelectorAll('[data-lab]').forEach(x=>x.setAttribute('aria-selected',String(x===b)));document.querySelectorAll('.lab-panel').forEach(x=>x.hidden=x.id!=='lab-'+b.dataset.lab);setQuery({lab:b.dataset.lab});}));
 const [rawUp,names,modes,stages,layouts]=await Promise.all([fetchData('skill-upgrades.json'),fetchData('item-names.json'),fetchData('mode-matrix.json'),fetchData('pinball-stages.json'),fetchData('pinball-layouts.json')]);
 const upgrades=new Map();for(const r of values(rawUp)){if(!upgrades.has(r.skill_id))upgrades.set(r.skill_id,new Map());upgrades.get(r.skill_id).set(r.lvl,r);}
 const skills=[...upgrades.keys()].sort((a,b)=>a-b);$('budget-skill').innerHTML=opts(skills,x=>x,x=>{const book=upgrades.get(x).get(0)?.cost?.[0]?.[0];return x+' · '+(names[book]?.replace('技能书·','')||'技能');});
 function budget(){const sid=Number($('budget-skill').value),from=Number($('budget-from').value),to=Number($('budget-to').value),ls=upgrades.get(sid);const max=Math.max(...ls.keys());$('budget-from').max=max;$('budget-to').max=max;
  if(!Number.isInteger(from)||!Number.isInteger(to)||from<0||to<from||to>max){$('budget-result').innerHTML=`<div class="error">请输入整数等级：0 ≤ 当前等级 ≤ 目标等级 ≤ ${max}。最高行缺下一行时不能继续升级。</div>`;return;}
  const sums=new Map();let missing=false;for(let lv=from;lv<to;lv++){const r=ls.get(lv);if(!r||!ls.has(lv+1)){missing=true;break;}for(const [id,n] of values(r.cost))sums.set(id,(sums.get(id)||0)+n);}
  if(missing){$('budget-result').innerHTML='<div class="error">该范围有缺失步骤，不能完整计算。</div>';return;}
  const next=ls.get(from),can=ls.has(from+1);$('budget-result').innerHTML=`<div class="result-status">技能 ${sid} · ${from} → ${to} · 累加当前 ${from} 至 ${to-1} 级费用${from===to?'（无需升级）':''}</div><div class="budget-cards">${[...sums].sort((a,b)=>a[0]-b[0]).map(([id,n])=>`<div class="budget-card"><b>${fmt(n)}</b><p>${esc(names[id]||id)}</p><small class="muted">ID ${id}</small></div>`).join('')||'<p class="muted">当前等级与目标相同，成本为0。</p>'}</div><div class="budget-notes">当前下一步：${can?values(next.cost).map(([id,n])=>esc(names[id]||id)+' × '+fmt(n)).join('、'):'已无下一等级行'}<br>当前费用行门槛：角色等级 ${next?.require_lvl??'未配置'}，开服日 ${next?.open_day??'未配置'}；还需检查任务、其他技能、功能开放和余额。<br><a href="configs.html?table=skill_base_upgrade.skill_base_upgrade_0&q=${sid}">查看费用原表 ↗</a></div>`;
 }
 ['budget-skill','budget-from','budget-to'].forEach(id=>$(id).addEventListener('input',budget));budget();
 const modeOpt=opts(modes,r=>r.play_type,r=>r.play_type+' · '+r.desc);$('mode-a').innerHTML=modeOpt;$('mode-b').innerHTML=modeOpt;$('mode-a').value='102';$('mode-b').value='501';
 function modeCompare(){const a=modes.find(r=>String(r.play_type)===$('mode-a').value),b=modes.find(r=>String(r.play_type)===$('mode-b').value);const fields={name:'实现类型',single_player:'单人',use_skill:'技能',auto_battle:'自动战斗',can_adjust_play_speed:'倍速',guaranteed_fire:'保证发炮',intelligent_force:'智能力度',soul:'灵魂',time_limit:'时间限制（原单位）',fight_plan:'战斗方案',cross_type:'跨服类型',watcher_delay:'观战延迟（原单位）',show_mvp:'MVP'};
  $('mode-result').innerHTML=`<div class="table-wrap"><table class="data-table"><thead><tr><th>字段</th><th>${esc(a.desc)} (${a.play_type})</th><th>${esc(b.desc)} (${b.play_type})</th></tr></thead><tbody>${Object.entries(fields).map(([k,v])=>`<tr class="${a[k]!==b[k]?'difference':''}"><td>${v}<br><small class="muted">${k}</small></td><td>${esc(a[k]??'未配置')}</td><td>${esc(b[k]??'未配置')}</td></tr>`).join('')}</tbody></table></div><p class="muted">浅黄色表示两种玩法的字段不同。表存在不证明当前服务器正在开放。</p>`;
 }
 ['mode-a','mode-b'].forEach(id=>$(id).addEventListener('change',modeCompare));modeCompare();
 const sr=stages.rows;$('pinball-stage').innerHTML=opts(sr,r=>r.stage_id,r=>r.name+' · '+r.stage_id);
 const points=(key,max)=>sr.map((r,i)=>`${45+i*690/49},${180-r[key]/max*150}`).join(' ');const max=Math.max(...sr.map(r=>Math.max(r.target_score,r.hp_sum)));
 $('pinball-chart').innerHTML=`<div class="chart-legend"><span><i style="background:#0d6157"></i>目标分</span><span><i style="background:#d69c3f"></i>全部单位HP总和</span></div><svg viewBox="0 0 770 220" role="img" aria-label="50关目标分与全部单位HP总和曲线">${[0,1000,2000,3000].map(n=>`<line x1="45" y1="${180-n/max*150}" x2="735" y2="${180-n/max*150}" stroke="#e1e8de"/><text x="37" y="${184-n/max*150}" text-anchor="end" font-size="10" fill="#728476">${n}</text>`).join('')}<polyline points="${points('hp_sum',max)}" fill="none" stroke="#d69c3f" stroke-width="2"/><polyline points="${points('target_score',max)}" fill="none" stroke="#0d6157" stroke-width="2.4"/><text x="45" y="210" font-size="10" fill="#728476">第1关</text><text x="700" y="210" font-size="10" fill="#728476">第50关</text></svg>`;
 const kind=(id)=>id===7011002?'增球':id===7011003?'炸弹':'单位';
 function draw(){const r=sr.find(r=>String(r.stage_id)===$('pinball-stage').value),rootLayout=layouts.find(x=>x.stage_id===r.stage_id).layout,l=rootLayout.layout;const w=Number($('pinball-wave').value);const payload=w===0?{units:l.initial_units,props:l.initial_props}:l.waves[w-1];const units=values(payload.units),props=values(payload.props),W=r.canvas.width||1080,H=r.canvas.height||2400;
  const all=units.concat(props),zoom=$('pinball-zoom').value==='active'&&all.length;
  const bottom=zoom?Math.max(0,Math.min(...all.map(p=>H-p.y-(p.h||100)/2))-90):0;
  const top=zoom?Math.min(H,Math.max(...all.map(p=>H-p.y+(p.h||100)/2))+90):H;
  const viewHeight=Math.max(280,top-bottom);
  // Flip only the preview Y axis to show the upward game coordinate convention.
  function shape(p,prop){const x=p.x,y=H-p.y,width=p.w||100,height=p.h||100,color=prop?(p.prop_id===7011002?'#bfda89':'#e3a65a'):'#69bdb0';let s;if(p.prop_id===7011001)s=`<ellipse cx="${x}" cy="${y}" rx="${width/2}" ry="${height/2}"/>`;else if(p.prop_id===7011004)s=`<polygon points="${x},${y-height/2} ${x-width/2},${y+height/2} ${x+width/2},${y+height/2}"/>`;else if(p.prop_id===7011006){const ps=Array.from({length:5},(_,i)=>{const a=-Math.PI/2+i*2*Math.PI/5;return `${x+Math.cos(a)*width/2},${y+Math.sin(a)*height/2}`;}).join(' ');s=`<polygon points="${ps}"/>`;}else s=`<rect x="${x-width/2}" y="${y-height/2}" width="${width}" height="${height}" rx="5"/>`;return `<g fill="${color}" transform="rotate(${-(p.angle||0)} ${x} ${y})">${s}</g><text x="${x}" y="${y+8}" text-anchor="middle" fill="#102f28" font-size="25">${prop?(p.prop_id===7011002?'+1':'爆'):p.hp??''}</text>`;}
  $('pinball-stats').innerHTML=`<div><b>${fmt(r.target_score)}</b><span>目标分数</span></div><div><b>${r.layout_ball_count}</b><span>布局初始球 · 默认${r.configured_ball_count}</span></div><div><b>${r.unit_count}</b><span>全部波次单位</span></div><div><b>${fmt(r.hp_sum)}</b><span>全部单位HP总和</span></div>`;
  $('pinball-canvas').innerHTML=`<svg viewBox="0 ${bottom} ${W} ${viewHeight}" role="img" aria-label="${esc(r.name)}${w===0?'初始布局':'第'+w+'波布局'}"><rect x="10" y="10" width="${W-20}" height="${H-20}" rx="28" fill="#16352e" stroke="#4a6e5e" stroke-width="5"/>${units.map(p=>shape(p,false)).join('')}${props.map(p=>shape(p,true)).join('')}<line x1="60" x2="${W-60}" y1="${H-110}" y2="${H-110}" stroke="#627d60" stroke-dasharray="14 15"/><text x="${W/2}" y="${H-45}" font-size="27" text-anchor="middle" fill="#8da58b">布局示意 · 非物理模拟</text></svg>`;
  $('pinball-info').innerHTML=`<div class="pinball-info"><h3>${esc(r.name)} · ${w===0?'初始布局':'后续第'+w+'波'}</h3><p>当前展示 ${units.length} 个单位、${props.length} 个道具。后续波次单独显示，未模拟前一波遗留对象。${zoom?'已放大当前对象所在区域；可以切换完整画布。':''}</p><p>球组：${r.layout_init_balls.map(b=>(b.ball_id===7012001?'普通球':'大力球')+'×'+b.count).join('、')}<br>画布：${W}×${H} px；预览将Y轴向上显示。真实引擎坐标约定未作为已验证结论。</p><p>奖励：${r.reward.map(([id,n])=>esc(names[id]||id)+'×'+fmt(n)).join('、')}</p><div class="layout-legend"><span><i style="background:#69bdb0"></i>障碍与HP</span><span><i style="background:#bfda89"></i>增球</span><span><i style="background:#e3a65a"></i>炸弹</span></div><div class="source-meta">布局原文件：<code>${esc(r.source)}</code><br>SHA-256：<code>${esc(r.sha256)}</code></div><p><a href="08-pinball.html">阅读玩法与提交流程 →</a><br><a href="configs.html?table=pinball_stage.pinball_stage&q=${r.stage_id}">查看关卡配置 →</a></p><details class="record"><summary><strong>当前布局数据</strong><span>位置、尺寸、角度、HP与道具ID</span></summary><pre class="json-code">${esc(json(payload))}</pre></details></div>`;setQuery({lab:'pinball',stage:String(r.stage_id)});
 }
 function stageChange(){const r=sr.find(r=>String(r.stage_id)===$('pinball-stage').value);$('pinball-wave').innerHTML='<option value="0">初始布局</option>'+Array.from({length:r.waves},(_,i)=>`<option value="${i+1}">后续第 ${i+1} 波</option>`).join('');draw();}
 if(sr.some(r=>String(r.stage_id)===query.get('stage')))$('pinball-stage').value=query.get('stage');$('pinball-stage').addEventListener('change',stageChange);$('pinball-wave').addEventListener('change',draw);$('pinball-zoom').addEventListener('change',draw);stageChange();
 // Initial drawing should not change the default tab or URL to pinball.
 const initialLab=query.get('lab')||'budget';document.querySelector(`[data-lab="${['budget','modes','pinball'].includes(initialLab)?initialLab:'budget'}"]`).click();
}
const pages={catalog:catalogPage,configs:configsPage,evidence:evidencePage,labs:labsPage,tests:testsPage};
const init=pages[document.body.dataset.page];if(init)init().catch(e=>{const target=document.querySelector('.tool-layout');target.insertAdjacentHTML('beforeend',errorBox(e));});
