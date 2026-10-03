"""Browser checks for the report's actual tools, evidence jumps and mobile layout."""
from __future__ import annotations
import argparse,json
from pathlib import Path
from playwright.sync_api import sync_playwright
ROOT=Path(__file__).resolve().parents[1];OUT=ROOT/'analysis/review/qa'
def main(url):
 OUT.mkdir(exist_ok=True);errors=[];checks=[]
 with sync_playwright() as p:
  browser=p.chromium.launch(headless=True);page=browser.new_page(viewport={'width':1440,'height':1000},device_scale_factor=1)
  page.on('pageerror',lambda e:errors.append(str(e)))
  page.on('response',lambda r:errors.append(f'HTTP {r.status} {r.url}') if r.status>=400 else None)
  def visit(path):page.goto(url+'/'+path,wait_until='networkidle')
  visit('index.html');page.screenshot(path=str(OUT/'home-desktop.png'));checks.append('Home loads')
  page.locator('.sidebar .search-open').click();page.locator('#global-search').fill('偷菜');page.locator('.search-hit').first.wait_for();assert page.locator('.search-results').inner_text().find('农场')>=0;page.locator('#search-close').click();checks.append('Global Chinese full text search')
  visit('review/catalog.html');page.locator('#catalog-search').fill('农场');page.wait_for_timeout(250);assert page.locator('.module-card').count()==1;page.locator('.module-card').click();assert page.locator('#feature-detail').inner_text().find('can_steal')>=0;page.locator('.dialog-x').click();checks.append('Catalog filter and function detail')
  visit('review/configs.html?table=pinball_stage.pinball_stage&q=70101001');assert page.locator('.record').count()==2;page.locator('.record summary').first.click();assert '367' in page.locator('.record pre').first.inner_text();page.locator('#row-search').fill('');page.wait_for_timeout(250);assert page.locator('.record').count()==40;page.locator('#config-next').click();assert page.locator('.record').count()==10;checks.append('Config query, full record and pagination')
  visit('review/evidence.html?module=game.module.fight.manager.base.fighting.unit.attrs&function=update_unit_hp');assert 'update_unit_hp' in page.locator('#evidence-code').inner_text();assert page.locator('#function-select').input_value()!='all';page.locator('#instruction-search').fill('SETTABLE');page.wait_for_timeout(250);assert page.locator('#evidence-code mark').count()>0;checks.append('Evidence module/function jump and instruction search')
  visit('review/labs.html');assert page.locator('#lab-budget').is_visible();assert '153,675' in page.locator('#budget-result').inner_text();assert '3,223,000' in page.locator('#budget-result').inner_text();page.locator('#budget-to').fill('81');assert '请输入整数' in page.locator('#budget-result').inner_text();page.locator('#budget-to').fill('40');checks.append('Actual current-level cost aggregation and invalid range')
  page.locator('[data-lab="modes"]').click();assert '排位赛' in page.locator('#mode-result').inner_text();assert page.locator('#mode-result tr.difference').count()>0;checks.append('Mode field comparison')
  page.locator('[data-lab="pinball"]').click();assert page.locator('#pinball-stats b').nth(1).inner_text()=='6';page.locator('#pinball-stage').select_option('70101050');assert page.locator('#pinball-stats b').nth(1).inner_text()=='18';assert page.locator('#pinball-wave option').count()==6;page.locator('#pinball-wave').select_option('5');assert '后续第5波' in page.locator('#pinball-info').inner_text();page.screenshot(path=str(OUT/'pinball-desktop.png'),full_page=True);checks.append('All-stage selection, layout ball override and wave rendering')
  visit('review/tests.html');assert page.locator('.test-row').count()==144;page.locator('#test-suite').select_option('review');assert page.locator('.test-row').count()==109;page.locator('#test-search').fill('直接负生命');page.wait_for_timeout(250);assert page.locator('.test-row').count()==1;page.locator('.test-row summary').click();assert '-20' in page.locator('.test-detail').inner_text();checks.append('Rule assertions and behavior records, result expansion')
  # Each narrative page and dynamic tool must remain readable on mobile.
  mobile=browser.new_page(viewport={'width':390,'height':844},device_scale_factor=1)
  mobile.on('pageerror',lambda e:errors.append('Mobile '+str(e)))
  pages=['index.html']+[str(p.relative_to(ROOT/'docs')) for p in sorted((ROOT/'docs/review').glob('*.html'))]
  for path in pages:
   mobile.goto(url+'/'+path,wait_until='networkidle')
   assert mobile.evaluate('document.documentElement.scrollWidth <= window.innerWidth+1'),path
  mobile.goto(url+'/index.html',wait_until='networkidle');mobile.screenshot(path=str(OUT/'home-mobile.png'),full_page=True);mobile.locator('.menu-button').click();assert mobile.locator('.sidebar').evaluate('(el)=>el.classList.contains("open")');checks.append(f'{len(pages)} mobile pages without horizontal overflow and mobile menu')
  browser.close()
 if errors:raise AssertionError('\n'.join(errors))
 result={'passed':True,'checks':checks,'javascript_errors':errors,'desktop_viewport':[1440,1000],'mobile_viewport':[390,844]};(OUT/'browser-results.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n');print(json.dumps(result,ensure_ascii=False))
if __name__=='__main__':
 ap=argparse.ArgumentParser();ap.add_argument('--url',default='http://127.0.0.1:8765');args=ap.parse_args();main(args.url)
