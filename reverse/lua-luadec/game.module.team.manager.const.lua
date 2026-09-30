-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.const_2787929070977719809.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.const
local l_0_2 = {}
l_0_2.normal = 0
l_0_2.teammate = 1
l_0_2.captain = 2
l_0_2.matching = 3
l_0_1.role_status = l_0_2
l_0_2 = {normal = 0, recruiting = 1, matching = 2, fighting = 3}
l_0_1.team_status = l_0_2
l_0_2 = {"\231\174\128\229\141\149", "\230\153\174\233\128\154", "\229\155\176\233\154\190", "\232\139\177\233\155\132"}
l_0_1.dif_desc = l_0_2
l_0_2 = {stranger = 0, recent = 1}
l_0_2.alliance = 2
l_0_2.friend = 3
l_0_2.shitu = 4
l_0_2.partner = 5
l_0_2.online = 6
l_0_2.nat_champ_match = 8
l_0_2.season_league_match = 9
l_0_1.relation_type = l_0_2
l_0_1.relation_source, l_0_2 = l_0_2, {normal = 0, team_invite = 1, marriage = 2, nat_champ_team_invite = 3, nat_champ_team_invite_fight = 4, season_league_team_invite = 5, season_league_team_invite_fight = 6, qixi_team_invite = 1000}
l_0_2 = {offline = 0, free = 1, team = 2, match = 3, fight = 4, watch = 5}
l_0_1.relation_status = l_0_2
l_0_2 = {none = 0, ready = 1, in_fight = 2}
l_0_1.teammate_status = l_0_2
l_0_2 = {team = 0, room = 1}
l_0_1.target_view_type = l_0_2
l_0_2 = {pvp = 1, pve = 2, dig_star = 3, pirate_island = 4, hero_pve = 5, dungeon_rogue = 6, dungeon_star = 7, hero_dungeon_star = 8, pve_tower = 9, season_2v2 = 10, pve_material = 11, pve_material_hard = 12, season_3v3 = 13, story_level = 2, custom = 14, physical_challenge = 15, alliancce_bobo = 16, alliance_pvp = 17, nat_champion = 18, morph = 19, paper_air_panel = 20, red_cat_martial_marriage = 21, alliance_trial = 22, sword_fly = 23, support_rank = 24, pvp_season_league = 25, id_fight = 26, id_javelin = 27}
l_0_2.spring_line_game = 28
l_0_1.target_main_type = l_0_2
l_0_2 = {match = 2, pvp_2v2 = 3, pvp_3v3 = 4}
l_0_1.pvp_target_type = l_0_2
l_0_2 = {level = 1, server_day = 2, power = 3}
l_0_1.limit_type = l_0_2
l_0_2 = {room = 1, party = 2, pvp_2v2 = 3}
l_0_1.scene_type = l_0_2
l_0_2 = {normal = 0, one_dragon = 1}
l_0_1.extend_type = l_0_2
l_0_2 = {pirate_island = 1, dig_star = 2, pve = 3, gold = 4}
l_0_1.step_type = l_0_2
l_0_2 = {"fightroom_icon_nightmare", "fightroom_icon_dig_star", "fightroom_icon_pve", "fightroom_icon_gold"}
l_0_1.one_dragon_icon = l_0_2
l_0_2 = {2, 1, 3, 4, 5}
l_0_1.team_recruit_label = l_0_2
local l_0_3 = {}
l_0_3[1] = DataConfigs.misc.avatar_ui_model_args_TeamView_role_1.val
l_0_3 = {1 = DataConfigs.misc.avatar_ui_model_args_TeamView_role_9.val, 2 = DataConfigs.misc.avatar_ui_model_args_TeamView_role_8.val}
l_0_3 = {1 = DataConfigs.misc.avatar_ui_model_args_TeamView_role_1.val, 2 = DataConfigs.misc.avatar_ui_model_args_TeamView_role_3.val}
l_0_3 = {1 = DataConfigs.misc.avatar_ui_model_args_TeamView_role_1.val, 2 = DataConfigs.misc.avatar_ui_model_args_TeamView_role_2.val, 3 = DataConfigs.misc.avatar_ui_model_args_TeamView_role_3.val}
l_0_3 = {1 = DataConfigs.misc.avatar_ui_model_args_TeamView_role_4.val, 2 = DataConfigs.misc.avatar_ui_model_args_TeamView_role_5.val, 3 = DataConfigs.misc.avatar_ui_model_args_TeamView_role_6.val, 4 = DataConfigs.misc.avatar_ui_model_args_TeamView_role_7.val}
l_0_2 = {1 = l_0_3, 22 = l_0_3, 21 = l_0_3, 3 = l_0_3, 4 = l_0_3}
l_0_1.avatar_ui_model_args_team_view_map = l_0_2
l_0_3 = {1 = 1}
l_0_3 = {1 = 1, 2 = 1}
l_0_3 = {1 = 1, 2 = 1}
l_0_3 = {1 = 1, 2 = 1, 3 = 1}
l_0_3 = {1 = 1.1, 2 = 1, 3 = 0.9, 4 = 0.85}
l_0_2 = {1 = l_0_3, 22 = l_0_3, 21 = l_0_3, 3 = l_0_3, 4 = l_0_3}
l_0_1.ui_scale_map = l_0_2
l_0_1.scroll_page_count = 10
l_0_1.req_max_count = 300
l_0_1.alone_team_type_key = "alone_team_type_key"
l_0_1.alone_team_target_key = "alone_team_target_key"
l_0_1.alone_team_args_key = "alone_team_args_key"
l_0_2 = {job = 1, rank = 2, cup = 3, pass_word = 4}
l_0_1.pvp_condition_type = l_0_2
l_0_1.job_max_same_num = 2
l_0_2 = {team_normal = 1, team_2v2 = 2, team_custom = 3, team_paper_air_plane = 4}
l_0_1.panel_type = l_0_2
l_0_2 = {level_limit = 1, server_day = 2, pre_dungeon = 3, lock = 4}
l_0_1.target_lock_type = l_0_2
l_0_2 = {blue = 1, red = 2}
l_0_1.custom_camp = l_0_2
l_0_2 = {open = 1, password = 2}
l_0_1.custom_room_type = l_0_2
l_0_2 = {is_balance = 1, not_balance = 2}
l_0_1.custom_balance_type = l_0_2
l_0_2 = {junior = 1, mid = 2, senior = 3}
l_0_1.map_level = l_0_2
l_0_2 = {compete = 1, wood = 2}
l_0_1.wood_robot_type = l_0_2
l_0_2 = {lock_pos = 1, map = 2, env = 3, balance = 4}
l_0_2.turn_cd = 5
l_0_2.name = 6
l_0_2.custom_map = 7
l_0_2.air_race_round_count = 8
l_0_2.air_race_battle_ids = 9
l_0_2.anim_type = 10
l_0_1.custom_setting_type = l_0_2
l_0_2 = {none = 0, desc = 1, tips = 2}
l_0_1.team_target_desc_type = l_0_2
l_0_2 = {newbie_fight_flow = 1, open_main_view = 2, on_application_focus = 3}
l_0_1.invite_answer_from_where = l_0_2
l_0_1.demo_plan_type, l_0_2 = l_0_2, {weapon = 1, equip = 2, pet = 3, skill = 4, equip_effect = 5, stone = 6, block = 7, add_att = 8}
l_0_3 = "\231\178\190\231\161\174\231\158\132\229\135\134"
l_0_2 = {l_0_3, "\231\178\151\231\149\165\231\158\132\229\135\134", "\230\181\139\232\183\157\231\158\132\229\135\134"}
l_0_1.anim_type_name = l_0_2
l_0_2 = {backup = 1, fight = 2, support = 3}
l_0_1.team_pos_type = l_0_2
l_0_3 = l_0_1.team_pos_type
l_0_3 = l_0_3.backup
l_0_3 = l_0_1.team_pos_type
l_0_3 = l_0_3.fight
l_0_3 = l_0_1.team_pos_type
l_0_3 = l_0_3.support
l_0_2 = {l_0_3 = "\232\161\165\228\189\141", l_0_3 = "\230\136\152\230\150\151", l_0_3 = "\230\148\175\230\143\180"}
l_0_1.team_pos_type_name = l_0_2
l_0_3 = l_0_1.team_pos_type
l_0_3 = l_0_3.backup
l_0_3 = l_0_1.team_pos_type
l_0_3 = l_0_3.fight
l_0_3 = l_0_1.team_pos_type
l_0_3 = l_0_3.support
l_0_2 = {l_0_3 = "main_zhihuiguan_img_buwei", l_0_3 = "main_zhihuiguan_img_zhandou", l_0_3 = "main_zhihuiguan_img_zhiyuan"}
l_0_1.team_pos_type_icon = l_0_2
l_0_3 = l_0_1.target_main_type
l_0_3 = l_0_3.nat_champion
l_0_3 = l_0_1.target_main_type
l_0_3 = l_0_3.pvp_season_league
l_0_2 = {l_0_3 = true, l_0_3 = true}
l_0_1.nat_champ_team_target_dict = l_0_2
return l_0_1

