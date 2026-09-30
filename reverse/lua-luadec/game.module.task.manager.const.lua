-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua5_573650\game.module.task.manager.const_7842214112707021901.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.const
local l_0_2 = {}
l_0_2.daily = 1
l_0_1.play_type = l_0_2
l_0_2 = {main_task = 1, zhixian_task = 2, daily_task = 3, limit_task = 4}
l_0_1.level_up_jump_to_type = l_0_2
l_0_2 = {main = 102, zhixian = 2, daily = 3, noob = 4, server_open_consume = 8, server_open_target = 9, server_open_daily = 10, open_server_consume = 23, open_server_target = 9, open_server_daily = 22, main_sub = 13, validation = 14, strength_rand = 15, tag = 16, free_build = 17, alliance_invite = 18}
l_0_2.equip_forge = 20
l_0_2.battle_pass = 21
l_0_2.new_return = 24
l_0_2.activity_return = 25
l_0_2.old_return = 26
l_0_2.alliance_daily = 104
l_0_2.career_pve = 201
l_0_2.championship = 202
l_0_2.label = 301
l_0_2.marriage = 401
l_0_2.game_club = 501
l_0_2.physical_challenge = 601
l_0_2.live_stream = 105
l_0_2.mid_autumn_match_daily = 106
l_0_2.morph = 107
l_0_2.season_act_arti = 108
l_0_2.alliance_pk_active = 109
l_0_2.double_eleven = 110
l_0_2.season_pet_trial = 111
l_0_2.activity_limit = 701
l_0_2.activity_daily = 702
l_0_2.activity_merge_alliance = 703
l_0_2.id_fight = 704
l_0_2.id_javelin = 705
l_0_1.task_type = l_0_2
l_0_2 = {weap_readpacket = 22}
l_0_1.sub_task_type = l_0_2
l_0_2 = {pvp = 1, pve = 2, pvp_connect = 11, pve_connect = 12}
l_0_1.main_sub_task_type = l_0_2
l_0_2 = {EVENT_LONGPRESS_TIMES = "EVENT_LONGPRESS_TIMES"}
l_0_1.condition = l_0_2
l_0_2 = {accepttable = 1, is_accepted = 2, can_get = 3, failed = 4, finish = 5}
l_0_1.task_status = l_0_2
l_0_2 = {1 = "\228\184\187\231\186\191", 2 = "\230\148\175\231\186\191", 3 = "\230\151\165\229\184\184", 11 = "\229\133\172\228\188\154", 12 = "\229\133\172\228\188\154", 101 = "\228\184\187\231\186\191"}
l_0_1.task_type_desc = l_0_2
l_0_1.task_red_point_id = "task_red_point"
local l_0_3 = l_0_1.task_type.daily
local l_0_4 = {}
l_0_4.max_daily_task_num = 5
l_0_4.server_data_key = "daily_task_cloud_data_key"
l_0_3 = l_0_1.task_type
l_0_3 = l_0_3.alliance_daily
l_0_4 = {max_daily_task_num = 3, server_data_key = "alliance_task_cloud_data_key"}
l_0_2 = {l_0_3 = l_0_4, l_0_3 = l_0_4}
l_0_1.daily_task_setting = l_0_2
l_0_3 = 203
l_0_4 = 207
l_0_2 = {l_0_3, l_0_4, 401}
l_0_1.daily_client_active = l_0_2
l_0_2 = {not_get = 1, can_get = 2, getted = 3}
l_0_1.award_state = l_0_2
l_0_2 = {change_pve_type_tip = "\230\136\144\229\138\159\229\136\135\230\141\162\232\135\179\229\134\146\233\153\169\231\148\159\230\182\175\239\188\129", change_pvp_type_tip = "\230\136\144\229\138\159\229\136\135\230\141\162\232\135\179\231\171\158\230\138\128\231\148\159\230\182\175\239\188\129"}
l_0_1.localization = l_0_2
l_0_2 = {pvp = "\231\171\158\230\138\128\231\148\159\230\182\175", pve = "\229\134\146\233\153\169\231\148\159\230\182\175"}
l_0_1.player_type_name = l_0_2
l_0_2 = {common = 1, pvp = 2, pve = 3}
l_0_1.task_refresh_type = l_0_2
l_0_1.main_task_priority = 1
l_0_1.zixuan_task_priority = 200
l_0_1.looked_weap_redpack_task_id_save_key = "looked_weap_redpack_task_id"
return l_0_1

