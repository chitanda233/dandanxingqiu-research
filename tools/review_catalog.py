"""Build a navigable catalog without presenting indexed modules as tested features."""
import json,re
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'analysis/review'
GROUPS={
 '战斗与竞技': 'fight battle match season season_league season_activity pvp_single rank_challenge tournament championship nat_champ nat_match_api practice newbie_fight_flow game_room mvp_result id_fight robot_tower',
 '副本与小游戏': 'dungeon_main story story_level story_level_multi dungeon_team dungeon_material dungeon_tower dungeon_tower_team dungeon_stake single_boss rogue pin_ball_game mini_play javelin pirate_island minefield_battle pictionary red_cat_blue_rabbit custom_shot map_studio commander',
 '构筑与养成': 'level_up attr_point main_weapon_develop weapon_trans equip equip_effect pet godpet stone skill card toy cube cultivation morph realm title reputation score astro dress_up pictorial label treasure moon_box art_number skin',
 '公会与社交': 'alliance alliance_raid alliance_conquest alliance_battle alliance_call_up alliance_party alliance_treasure territory_battle friend chat chat_ai_reply real_time_voice marriage tutor concentric team star_team red_envelop party_concert',
 '家园与生产': 'home home_room farm camera gallery location',
 '经济与付费': 'bag shop trade recharge month_card advertisement privilege first_charge battle_pass festival_battle_pass level_gift strengthen_gift hook_gift lucky_box raffle pick_gift activity_bank',
 '活动与留存': 'task achieve welfare seven_day seven_sign open_server_activity activity activity_role activity_spring activity_christmas activity_anniversary activity_double_eleven activity_merge_alliance activity_server_merge activity_return activity_may_day activity_childrens_day halloween qixi_activity mid_autumn spring_painting festival galactic_cycle dig_star catchup_system sprouts_assist progress_reward offline sprint',
 '平台与基础': 'config framework base core head init scene_manager big_scene guide_system tips misc game_club feed_back entrance bytegame player_proxy player_portrait invite question popup violation setting questionnaire broadcast opening_cutscene main_view npc_dialog subscribe data cloud_data jump_to common common_view gm_panel game_helper game_plan client_active time_line help ticker notice newspaper preload block login kuaishou open_func',
}
LABELS='''
fight 战斗执行
battle 战斗入口
match 匹配
season 排位赛季
season_league 赛季联赛
season_activity 赛季活动
pvp_single 单人竞技
rank_challenge 排名挑战
tournament 锦标赛
championship 冠军赛
nat_champ 国家竞赛
nat_match_api 国家竞赛接口
practice 练习
newbie_fight_flow 新手战斗流程
game_room 游戏房间
mvp_result MVP结果
id_fight 身份战斗入口
robot_tower 机器人塔
dungeon_main 主线副本
story 剧情数据
story_level 剧情关卡
story_level_multi 多人剧情
dungeon_team 组队副本
dungeon_material 材料副本
dungeon_tower 爬塔
dungeon_tower_team 组队爬塔
dungeon_stake 木桩挑战
single_boss 单人Boss
rogue 肉鸽挑战
pin_ball_game 弹球闯关
mini_play 休闲小游戏
javelin 标枪
pirate_island 海盗岛
minefield_battle 扫雷战场
pictionary 你画我猜
red_cat_blue_rabbit 红猫蓝兔
custom_shot 自定义射击
map_studio 地图编辑
commander 指挥与支援
level_up 等级提升
attr_point 属性配点
main_weapon_develop 主武器养成
weapon_trans 武器转换
equip 装备
equip_effect 装备表现
pet 宠物
godpet 神宠
stone 石头与套装
skill 通用技能
card 卡牌
toy 玩具
cube 魔方
cultivation 培养
morph 变身
realm 境界
title 称号
reputation 声望
score 评分
astro 星象
dress_up 装扮
pictorial 图鉴
label 标签与徽标
treasure 宝藏
moon_box 月盒
art_number 美术编号
skin 外观渲染
alliance 公会
alliance_raid 公会讨伐
alliance_conquest 公会征战
alliance_battle 公会战
alliance_call_up 公会集结
alliance_party 公会宴会
alliance_treasure 公会宝藏
territory_battle 领地战
friend 好友
chat 聊天
chat_ai_reply 聊天AI回复
real_time_voice 实时语音
marriage 婚姻
tutor 师徒
concentric 同心关系
team 队伍
star_team 明星队伍
red_envelop 红包
party_concert 聚会音乐会
home 家园
home_room 家园房间
farm 农场
camera 相机
gallery 相册
location 位置
bag 背包
shop 商店
trade 贸易与拍卖
recharge 充值
month_card 月卡
advertisement 激励广告
privilege 特权
first_charge 首充
battle_pass 通行证
festival_battle_pass 节日团队通行证
level_gift 等级礼包
strengthen_gift 强化礼包
hook_gift 挂机礼包
lucky_box 幸运箱
raffle 抽奖
pick_gift 任选礼包
activity_bank 活动银行
task 任务
achieve 成就
welfare 福利
seven_day 七日目标
seven_sign 七日签到
open_server_activity 开服活动
activity 活动通用层
activity_role 活动角色数据
activity_spring 春节活动
activity_christmas 圣诞活动
activity_anniversary 周年活动
activity_double_eleven 双十一活动
activity_merge_alliance 合并公会活动
activity_server_merge 合服活动
activity_return 回归活动
activity_may_day 五一活动
activity_childrens_day 儿童节活动
halloween 万圣节
qixi_activity 七夕活动
mid_autumn 中秋活动
spring_painting 春季绘画
festival 节日通用层
galactic_cycle 星系循环活动
dig_star 挖星
catchup_system 追赶系统
sprouts_assist 新芽助力
progress_reward 进度奖励
offline 离线收益
sprint 冲刺活动
config 配置载入
framework 模块框架
base 模块根定义
core 模块根核心
head 模块根入口
init 模块根初始化
scene_manager 场景切换
big_scene 多人场景
guide_system 引导系统
tips 提示
misc 杂项
game_club 游戏俱乐部
feed_back 反馈
entrance 入口
bytegame 字节小游戏
player_proxy 玩家代理
player_portrait 头像
invite 邀请
question 问答
popup 弹窗
violation 违规处理
setting 设置
questionnaire 问卷
broadcast 广播
opening_cutscene 开场演出
main_view 主界面
npc_dialog NPC对话
subscribe 订阅消息
data 玩家数据
cloud_data 云配置与存储
jump_to 功能跳转
common 公共逻辑
common_view 公共视图
gm_panel 编辑器GM面板
game_helper 游戏助手
game_plan 游戏方案
client_active 客户端活跃
time_line 时间线
help 帮助
ticker 跑马灯
notice 公告
newspaper 报纸
preload 预载
block 分块
login 登录
kuaishou 快手平台
open_func 功能开放
'''
DEEP={
 'fight':'02-combat','battle':'02-combat','skill':'03-skills','main_weapon_develop':'04-growth','pet':'04-growth','equip':'04-growth','stone':'04-growth',
 'match':'05-match','season':'05-match','practice':'05-match','team':'05-match','story_level':'06-pve','dungeon_tower':'06-pve','dungeon_material':'06-pve','dungeon_team':'06-pve',
 'rogue':'07-rogue','pin_ball_game':'08-pinball','alliance':'09-guild','alliance_raid':'09-guild','friend':'10-social','tutor':'10-social','marriage':'10-social',
 'home':'11-home','home_room':'11-home','farm':'12-farm','gacha':'13-economy','shop':'13-economy','trade':'13-economy','recharge':'14-monetization','month_card':'14-monetization','advertisement':'14-monetization','battle_pass':'14-monetization','festival_battle_pass':'14-monetization',
 'galactic_cycle':'15-liveops','task':'15-liveops','open_func':'01-product','login':'16-platform','cloud_data':'16-platform',
}
def main():
 inv=json.loads((OUT/'inventory.json').read_text());evidence={r['name']:r for r in json.loads((OUT/'evidence-manifest.json').read_text())}
 labels=dict(line.split(' ',1) for line in LABELS.strip().splitlines());labels['gacha']='抽取';categories={m:k for k,v in GROUPS.items() for m in v.split()};categories['gacha']='经济与付费'
 groups={}
 for r in inv:
  if r['name'].startswith('game.module.'):groups.setdefault(r['module'],[]).append(r)
 tests=json.loads((OUT/'probes.json').read_text());old=json.loads((ROOT/'analysis/data/client_rule_probes.json').read_text())
 tested={r['name'].split('.')[2] for r in tests['sources'] if r['name'].startswith('game.module.')}
 # Legacy cases remain explicitly separate; tested labels here use new cases only.
 rows=[]
 for module,rs in sorted(groups.items()):
  funcs=[]
  for r in rs:
   if '.manager.' in r['name']:
    for f in r.get('functions',[]):
     for n in f['names']:funcs.append({'name':n,'source':r['name'],'path':f['path'],'instructions':f['instructions'],'evidence':r['name'] in evidence})
  symbols=sorted({m for r in rs for m in r['messages'] if re.fullmatch(r'[a-z][a-z0-9_]*_(?:c2s|s2c)',m) and not m.startswith(('on_','on_msg_','after_'))})
  report=DEEP.get(module)
  rows.append({'id':module,'label':labels.get(module,module),'category':categories.get(module,'平台与基础'),'chunks':len(rs),'functions':funcs,'messages':symbols,'level':'有原函数验证' if module in tested else '指令分析' if report else '结构索引','report':report,'sources':[r['name'] for r in rs if r['name'] in evidence]})
 (OUT/'feature-catalog.json').write_text(json.dumps(rows,ensure_ascii=False,separators=(',',':'))+'\n')
 print(f'Catalog: {len(rows)} namespaces; {len(tests["cases"])+len(old["cases"])} cases across both suites')
if __name__=='__main__':main()
