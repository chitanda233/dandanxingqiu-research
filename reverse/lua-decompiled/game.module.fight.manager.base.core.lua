local L0_0, L3_3, L8_8, L9_9, L10_10, L11_11, L14_14, L15_15, L16_16, L19_19, L20_20, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29 = L0_0, "game.utils.events", L8_8, L9_9, L10_10, L11_11, L14_14, L15_15, L16_16, L19_19, L20_20, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29
L0_0 = L0_0(L3_3)
L3_3 = require
L8_8 = "game.other.device_fit.init"
L3_3 = L3_3(L8_8)
L8_8 = Game
L8_8 = L8_8.module
L8_8 = L8_8.setting
L9_9 = Game
L9_9 = L9_9.module
L9_9 = L9_9.cloud_data
L10_10 = require
L11_11 = "game.ui.manager.ui_manager.init"
L10_10 = L10_10(L11_11)
L11_11 = require
L14_14 = "game.ui.manager.ui_const"
L11_11 = L11_11(L14_14)
L14_14 = require
L15_15 = "game.utils.timer"
L14_14 = L14_14(L15_15)
L15_15 = IsObjNil
L16_16 = DateTimeUtil
L19_19 = string
L19_19 = L19_19.format
L20_20 = GlobalConst
L20_20 = L20_20.play_type
L24_24 = BroadcastTips
L25_25 = assert
L26_26 = DataConfigs
L25_25 = L25_25(L26_26)
L26_26 = L25_25.battle
L27_27 = L25_25.battle_env
L28_28 = L25_25.fight_map
L29_29 = L25_25.fight_scene
function Game.module.fight.ways.base.enter(A0_30, A1_31)
	A0_30:show_chat_log("<color=#f48a06>\230\136\152\230\150\151\229\188\128\229\167\139</color>")
	GameFunctions.clear_obj_pool_adjust_mark()
	local L2_32 = L2_32
	L2_32 = _ENV
	L2_32 = L2_32.fixed_deltatime
	if not L2_32 then
		L2_32 = 0.03
	end
	A0_30.old_fixed_deltatime = L2_32
	L2_32 = _UPVALUE1_
	L2_32 = L2_32.fight_fixed_deltatime
	L2_32 = L2_32.value
	A0_30.cur_fixed_deltatime_ms = L2_32
	L2_32 = A0_30.cur_fixed_deltatime_ms
	L2_32 = L2_32 * 0.001
	A0_30.cur_fixed_deltatime = L2_32
	_ENV.set_fixed_deltatime(L2_32)
	A0_30.need_stop_fight = false
	A0_30.timer = L7_7.new()
	A0_30.unscale_timer = L7_7.new()
	A0_30.start_fight_time = L13_13.now_millisecond()
	A0_30.play_speed = 1
	A0_30.play_speed_time_line = 0
	A0_30:init_go_root()
	A0_30:init_data(A1_31)
	if A0_30:is_physics_env() then
		A0_30:init_physics()
	end
	if A0_30:is_multi_player_physics_env() then
		A0_30:init_timeline()
	end
	A0_30:check_chat_bullet()
	A0_30:setup_events()
	A0_30:setup_network()
	local L4_33 = L4_33
	L4_33(A0_30, "loading")
	local L5_34 = L5_34
end
function Game.module.fight.ways.base.leave(A0_35)
	if A0_35.old_fixed_deltatime then
		_ENV.set_fixed_deltatime(A0_35.old_fixed_deltatime)
		A0_35.old_fixed_deltatime = nil
	end
	A0_35.force_back_to_view = nil
	A0_35.force_back_to_scene = nil
	A0_35.load_failed = nil
	if A0_35:is_multi_player_physics_env() then
		A0_35:clear_timeline()
	end
	A0_35:try_reset_common_frame_rate()
	A0_35:clear_fly_texts()
	A0_35:close_fight_uis()
	A0_35:revert_chat_bullet()
	A0_35:try_to_uninstall_touch()
	A0_35:clear_events()
	A0_35:clear_network()
	_UPVALUE1_.clear_battle(A0_35)
	A0_35:clear_ending_data()
	xpcall(A0_35.clear_fight_data, A0_35:fight_traceback(), A0_35)
	if A0_35:is_physics_env() then
		A0_35:clear_physics()
	end
	A0_35.timer:del_all_timers()
	A0_35.unscale_timer:del_all_timers()
	if A0_35.land_data then
		A0_35.land_data:clear()
		A0_35.land_data = nil
	end
	A0_35.client_type_handler:clear()
	A0_35.client_type_handler = nil
	A0_35.battle_client_type = nil
	A0_35:destroy_go_root()
	A0_35:clear_loading_data()
	A0_35:clear_data()
	_FOR_, _FOR_, _FOR_ = pairs(A0_35)
	for _FORV_4_, _FORV_5_ in _FOR_, _FOR_, _FOR_ do
		if type(_FORV_5_) ~= "function" and _FORV_4_ ~= "super" then
			A0_35[_FORV_4_] = nil
		end
	end
	L7_42 = GameFunctions
	L7_42 = L7_42.clear_obj_pool_adjust_mark
	L7_42()
	L7_42 = ObjectPoolManager
	L7_42 = L7_42.GetInstance
	L7_42 = L7_42()
	L7_42 = L7_42.AllPoolTryToReduceToMinCapacity
	L7_42(L7_42)
	L7_42 = ObjectPoolManager
	L7_42 = L7_42.GetInstance
	L7_42 = L7_42()
	L7_42 = L7_42.ChangePoolCleanIntervalByTag
	L7_42(L7_42, "fight", 1, true)
	local L5_40 = L5_40
	L7_42 = pcall
	L5_40 = A0_35.try_clear_debug_info
	L7_42(L5_40, A0_35)
	L5_40 = A0_35
	L7_42 = A0_35.show_chat_log_split
	L7_42(L5_40)
end
function Game.module.fight.ways.base.init_data(A0_43, A1_44)
	local L2_45
	L2_45 = table
	L2_45 = L2_45.insert
	A0_43.table_pools = {}
	_FOR_ = 1
	for _FORV_6_ = _FOR_, _FOR_, _FOR_ do
		L2_45(A0_43.table_pools, {})
	end
	L7_50 = assert
	L9_52 = A1_44
	L7_50 = L7_50(L9_52)
	A0_43.msg = L7_50
	L7_50 = A1_44.room_id
	A0_43.room_id = L7_50
	L7_50 = A1_44.play_type
	A0_43.play_type = L7_50
	L7_50 = A1_44.cf_play_info
	A0_43.cf_play_info = L7_50
	L7_50 = A1_44.nvn
	A0_43.nvn = L7_50
	L7_50 = A1_44.cfg_battle_id
	A0_43.cf_battle_id = L7_50
	L7_50 = A1_44.quit_type
	A0_43.quit_type = L7_50
	L7_50 = A1_44.is_group_action
	A0_43.is_group_action = L7_50
	L7_50 = A1_44.spec_kv_list
	if L7_50 then
		L7_50 = pairs
		L9_52 = A1_44.spec_kv_list
		L7_50, L9_52, _FOR_ = L7_50(L9_52)
		for _FORV_6_, _FORV_7_ in L7_50, L9_52, _FOR_ do
			if _FORV_7_.k == 1 then
				A0_43.activity_theme_id = _FORV_7_.v
			end
		end
	end
	L9_52 = A0_43
	L7_50 = A0_43.init_data_ugc
	L7_50(L9_52)
	L9_52 = A0_43
	L7_50 = A0_43.is_ugc
	L7_50 = L7_50(L9_52)
	if L7_50 then
		L9_52 = A0_43
		L7_50 = A0_43.init_battle_ugc
		L7_50(L9_52)
	else
		L7_50 = assert
		L9_52 = _ENV
		L9_52 = L9_52[A0_43.cf_battle_id]
		L7_50 = L7_50(L9_52, A0_43.cf_battle_id)
		A0_43.cf_battle = L7_50
	end
	L7_50 = A1_44.round_fix_action_list
	A0_43.round_fix_action_list = L7_50
	L7_50 = math
	L7_50 = L7_50.floor
	L9_52 = A1_44.act_time
	if not L9_52 then
		L9_52 = A0_43.cf_battle
		L9_52 = L9_52.act_time
		if not L9_52 then
			L9_52 = 0
		end
	end
	L9_52 = L9_52 * 0.001
	L9_52 = L9_52 + 1.0E-6
	L7_50 = L7_50(L9_52)
	A0_43.act_time = L7_50
	L7_50 = A1_44.battle_client_type
	if not L7_50 then
		L7_50 = _UPVALUE1_
		L7_50 = L7_50.client_type
		L7_50 = L7_50.normal
	end
	A0_43.battle_client_type = L7_50
	L7_50 = _UPVALUE2_
	L7_50 = L7_50.get_inst_by_client_type
	L9_52 = A0_43.battle_client_type
	L7_50 = L7_50(L9_52)
	A0_43.client_type_handler = L7_50
	L7_50 = assert
	L9_52 = A0_43.client_type_handler
	L7_50(L9_52, A1_44.battle_client_type)
	L7_50 = A0_43.client_type_handler
	L9_52 = L7_50
	L7_50 = L7_50.init
	L7_50(L9_52, A0_43, A1_44)
	L7_50 = A1_44.battle_env
	A0_43.battle_env = L7_50
	L7_50 = A0_43.battle_env
	if L7_50 then
		L7_50 = assert
		L9_52 = L27_27
		L9_52 = L9_52[A0_43.battle_env]
		L7_50 = L7_50(L9_52, A0_43.battle_env)
		A0_43.cf_battle_env = L7_50
	end
	L9_52 = A0_43
	L7_50 = A0_43.set_physics_env
	L7_50(L9_52, A1_44.physics_env)
	L7_50 = A1_44.dup_id
	A0_43.dup_id = L7_50
	L7_50 = A1_44.dungeon_main_type
	A0_43.dungeon_main_type = L7_50
	L7_50 = A1_44.is_reward_challenge
	A0_43.is_reward_challenge = L7_50
	L7_50 = pcall
	L9_52 = A0_43.try_init_debug_info
	L7_50(L9_52, A0_43, A1_44)
	L9_52 = A0_43
	L7_50 = A0_43.init_local_player
	L7_50(L9_52)
	L9_52 = A0_43
	L7_50 = A0_43.init_map_data
	L7_50(L9_52, A1_44.cf_map_id)
	L7_50 = xpcall
	L9_52 = A0_43.init_fight_data
	L7_50(L9_52, A0_43:fight_traceback(), A0_43)
	L7_50 = _UPVALUE4_
	L7_50 = L7_50.init_battle
	L9_52 = A0_43
	L7_50(L9_52, A1_44)
	local L5_48 = L5_48
end
function Game.module.fight.ways.base.get_dup_id(A0_53)
	return A0_53.dup_id
end
function Game.module.fight.ways.base.get_dungeon_main_type(A0_54)
	return A0_54.dungeon_main_type
end
function Game.module.fight.ways.base.init_local_player(A0_55)
	local L1_56
	L1_56 = Game
	local L1_56, L5_60 = L1_56.module, L5_60
	L1_56 = L1_56.data
	L5_60 = L1_56.get_player_id
	L5_60 = L5_60()
	A0_55.self_player_id = L5_60
	A0_55.self_unit_id = nil
	A0_55.ctrl_unit_id = nil
	L5_60 = A0_55.msg
	L5_60 = L5_60.self_camp
	if not L5_60 then
		L5_60 = 1
	end
	A0_55.self_camp = L5_60
	L6_61 = A0_55
	L5_60 = A0_55.me_in_fight
	L5_60 = L5_60(L6_61)
	if not L5_60 then
		return
	end
	L5_60 = A0_55.msg
	L5_60 = L5_60.objects
	L6_61 = pairs
	L7_62 = L5_60
	L6_61, L7_62, L8_63 = L6_61(L7_62)
	for L9_64, _FORV_7_ in L6_61, L7_62, L8_63 do
		if not _FORV_7_.role then
		elseif _FORV_7_.role.id ~= A0_55.self_player_id then
		else
			A0_55.self_unit_id = _FORV_7_.object_id
			A0_55.self_camp = _FORV_7_.camp
			A0_55.ctrl_unit_id = _FORV_7_.object_id
			goto lbl_43
		end
		::lbl_43::
		if A0_55.self_unit_id then
			break
		end
	end
end
function Game.module.fight.ways.base.init_map_data(A0_65, A1_66)
	if A0_65:is_ugc() then
		A0_65.cf_map, A0_65.cf_scene = A0_65:init_ugc_map_data(A1_66)
	else
		assert(A1_66)
		A0_65.could_destroy_land = A0_65.msg.destroy_lands and next(A0_65.msg.destroy_lands) ~= nil
		A0_65.cf_map = assert(_ENV[A1_66], A1_66)
		local L2_67 = L2_67
		local L2_67, L4_68 = L2_67(L29_29[A0_65.cf_map.fight_scene], A0_65.cf_map.fight_scene), L4_68
		A0_65.cf_scene = L2_67
	end
end
function Game.module.fight.ways.base.is_loop_map(A0_69)
	return false
end
function Game.module.fight.ways.base.clear_data(A0_70)
	A0_70:clear_smoke_data()
	A0_70.msg = nil
	A0_70.play_type = nil
	A0_70.cf_play_info = nil
	A0_70.cf_battle_id = nil
	A0_70.cf_battle = nil
	A0_70.cf_play_type = nil
	A0_70.cf_nvn = nil
	A0_70.could_destroy_land = nil
	A0_70.fight_result_msg = nil
	A0_70._cached_fight_traceback = nil
	if A0_70:is_ugc() then
		A0_70:clear_ugc()
	end
	A0_70:clear_map_data()
end
function Game.module.fight.ways.base.clear_map_data(A0_71)
	local L1_72
	A0_71.cf_map = nil
	A0_71.cf_scene = nil
end
function Game.module.fight.ways.base.get_cur_battle_id(A0_73)
	return A0_73.cf_battle_id
end
function Game.module.fight.ways.base.init_go_root(A0_74)
	local L1_75 = ObjectPoolManager.GetInstance()
	local L2_76 = L2_76
	L2_76 = L2_76(L1_75, "empty_go", false)
	A0_74.empty_go_pool = L2_76
	L2_76 = A0_74.empty_go_pool
	L2_76.capacity = 80
	L2_76 = A0_74.empty_go_pool
	L2_76.clean_pool_interval = 90
	L2_76 = TransformUtils
	local L3_77 = L3_77
	L3_77 = L3_77(A0_74, "FightRoot")
	L3_77 = L3_77.transform
	A0_74.t_fight_root = L3_77
	L3_77:SetParent(nil)
	L2_76.ResetPSR(L3_77)
	A0_74.t_tomb_root = A0_74:get_empty_go("TombRoot").transform
	A0_74.t_tomb_root:SetParent(L3_77)
	L2_76.ResetPSR(A0_74.t_tomb_root)
	A0_74.t_effect_root = A0_74:get_empty_go("EffectRoot").transform
	A0_74.t_effect_root:SetParent(L3_77)
	L2_76.ResetPSR(A0_74.t_effect_root)
	A0_74.t_bullet_root = A0_74:get_empty_go("BulletRoot").transform
	A0_74.t_bullet_root:SetParent(L3_77)
	L2_76.ResetPSR(A0_74.t_bullet_root)
	A0_74.go_unit_root = A0_74:get_empty_go("UnitRoot")
	A0_74.t_unit_root = A0_74.go_unit_root.transform
	A0_74.t_unit_root:SetParent(L3_77)
	L2_76.ResetPSR(A0_74.t_unit_root)
	local L4_78, L5_79 = L4_78, L5_79
	L4_78 = L4_78(L5_79, "HoleRoot")
	L5_79 = L4_78.transform
	L5_79:SetParent(L3_77)
	L2_76.ResetPSR(L5_79)
	A0_74.go_hole_root = L4_78
	A0_74.t_hole_root = L5_79
	local L6_80 = L6_80
	L6_80 = L6_80(A0_74, "HoleDiRoot")
	A0_74.go_hole_di_root = L6_80
	L6_80 = A0_74.go_hole_di_root
	L6_80 = L6_80.transform
	L6_80:SetParent(L5_79)
	L2_76.ResetPSR(L6_80)
	local L7_81 = L7_81
	L7_81 = L7_81(A0_74, "MarkRoot")
	A0_74.t_mark_root = L7_81.transform
	A0_74.t_mark_root:SetParent(L3_77)
	local L10_84 = L10_84
	L10_84 = L2_76.ResetPSR
	L10_84(A0_74.t_mark_root)
	local L9_83 = L9_83
end
function Game.module.fight.ways.base.destroy_go_root(A0_85)
	if A0_85.t_effect_root then
		L5_90 = A0_85
		L4_89 = A0_85.recycle_empty_go
		L4_89(L5_90, A0_85.t_effect_root.gameObject)
		A0_85.t_effect_root = nil
	end
	L4_89 = A0_85.t_scene_root
	if L4_89 then
		L4_89 = GameObject
		L4_89 = L4_89.Destroy
		L5_90 = A0_85.t_scene_root
		L5_90 = L5_90.gameObject
		L4_89(L5_90)
		A0_85.t_scene_root = nil
	end
	A0_85.t_scene_land_root = nil
	L4_89 = A0_85.t_tomb_root
	if L4_89 then
		L5_90 = A0_85
		L4_89 = A0_85.recycle_empty_go
		L4_89(L5_90, A0_85.t_tomb_root.gameObject)
		A0_85.t_tomb_root = nil
	end
	L4_89 = A0_85.t_bullet_root
	if L4_89 ~= nil then
		L5_90 = A0_85
		L4_89 = A0_85.recycle_empty_go
		L4_89(L5_90, A0_85.t_bullet_root.gameObject)
		A0_85.t_bullet_root = nil
	end
	L4_89 = A0_85.go_unit_root
	if L4_89 ~= nil then
		L5_90 = A0_85
		L4_89 = A0_85.recycle_empty_go
		L4_89(L5_90, A0_85.go_unit_root)
		A0_85.go_unit_root = nil
		A0_85.t_unit_root = nil
	end
	L4_89 = A0_85.go_hole_di_root
	if L4_89 ~= nil then
		L5_90 = A0_85
		L4_89 = A0_85.recycle_empty_go
		L4_89(L5_90, A0_85.go_hole_di_root)
		A0_85.go_hole_di_root = nil
	end
	L4_89 = A0_85.str_to_hole_pian_root
	if L4_89 then
		L4_89 = pairs
		L5_90 = A0_85.str_to_hole_pian_root
		L4_89, L5_90, _FOR_ = L4_89(L5_90)
		for _FORV_4_, _FORV_5_ in L4_89, L5_90, _FOR_ do
			A0_85:recycle_empty_go(_FORV_5_.gameObject)
			A0_85.str_to_hole_pian_root[_FORV_4_] = nil
		end
	end
	L4_89 = A0_85.go_hole_root
	if L4_89 ~= nil then
		L5_90 = A0_85
		L4_89 = A0_85.recycle_empty_go
		L7_92 = A0_85.go_hole_root
		L4_89(L5_90, L7_92)
		A0_85.go_hole_root = nil
		A0_85.t_hole_root = nil
	end
	L4_89 = A0_85.t_mark_root
	if L4_89 ~= nil then
		L5_90 = A0_85
		L4_89 = A0_85.recycle_empty_go
		L7_92 = A0_85.t_mark_root
		L7_92 = L7_92.gameObject
		L4_89(L5_90, L7_92)
		A0_85.t_mark_root = nil
	end
	L4_89 = A0_85.t_fight_root
	if L4_89 then
		L5_90 = A0_85
		L4_89 = A0_85.recycle_empty_go
		L7_92 = A0_85.t_fight_root
		L7_92 = L7_92.gameObject
		L4_89(L5_90, L7_92)
		A0_85.t_fight_root = nil
	end
end
function Game.module.fight.ways.base.get_empty_go(A0_94, A1_95, A2_96)
	local L3_97 = A0_94.empty_go_pool:PopGameObject()
	local L5_99 = _ENV(L3_97)
	if L5_99 then
		L5_99 = GameObject
		L5_99 = L5_99.New
		L5_99 = L5_99()
		L3_97 = L5_99
	end
	if not A1_95 then
		return L3_97
	end
	if not A2_96 then
		L5_99 = GameEnv
		L5_99 = L5_99.is_editor
		if not L5_99 then
			goto lbl_23
		end
	end
	L3_97.name = A1_95
	::lbl_23::
	return L3_97
end
function Game.module.fight.ways.base.recycle_empty_go(A0_100, A1_101)
	if _ENV(A1_101) then
		A0_100:fight_log_error("recycle_empty_go,go is nil," .. debug.traceback())
		return
	end
	if not A0_100.empty_go_pool:PushGameObject(A1_101, "empty_go") then
		GameObject.Destroy(A1_101)
	else
		local L3_102, L4_103 = L3_102, L4_103
		L4_103(A1_101, true)
		local L5_104 = L5_104
	end
end
function Game.module.fight.ways.base.try_to_init_scene_root(A0_105)
	if A0_105.t_scene_root then
		return
	end
	A0_105:init_scene_root()
	local L2_106 = L2_106
end
function Game.module.fight.ways.base.init_scene_root(A0_107)
	local L1_108 = A0_107:get_scene_root_asset_path()
	local L2_109 = L2_109
	L2_109 = L2_109(A0_107, L1_108)
	if not L2_109 or IsObjNil(L2_109) then
		A0_107.load_failed = false
		A0_107:show_asset_nil_alert()
		return
	end
	if A0_107:is_ugc() and not A0_107:check_ugc_scene_res() then
		A0_107.load_failed = false
		A0_107:show_asset_nil_alert()
		return
	end
	local L3_110 = L3_110
	local L3_110, L4_111 = L3_110(L2_109), L4_111
	L4_111 = A0_107.cf_scene
	L4_111 = L4_111.id
	L3_110.name = L4_111
	L4_111 = L3_110.transform
	A0_107.t_scene_root = L4_111
	A0_107.t_scene_land_root = L4_111:Find("land")
	L4_111:SetParent(A0_107.t_fight_root)
	local L7_114 = L7_114
	L7_114 = TransformUtils
	L7_114 = L7_114.ResetPSR
	L7_114(L4_111)
	L7_114 = A0_107.is_ugc
	L7_114 = L7_114(A0_107)
	if L7_114 then
		L7_114 = A0_107.init_ugc_scene
		L7_114(A0_107)
		local L6_113 = L6_113
	end
	return L3_110
end
function Game.module.fight.ways.base.get_scene_root_asset_path(A0_115)
	local L1_116
	L1_116 = A0_115.cf_scene
	L1_116 = L1_116.id
	local L2_117 = L2_117
	local L3_118 = L3_118
	do return L2_117(L3_118, L1_116) end
	local L4_119 = L4_119
end
function Game.module.fight.ways.base.show_round_state(A0_120)
	return false
end
function Game.module.fight.ways.base.change_game_state(A0_121, A1_122, A2_123, A3_124, A4_125)
	local L5_126
	L5_126 = print
	L5_126(">>>>>>>>>>>>>>  on_change_state_ :", A1_122, debug.traceback())
	L5_126 = A0_121.game_state
	assert(L5_126 ~= A1_122, A1_122)
	if L5_126 and _UPVALUE1_[_ENV("on_exit_game_state_%s", L5_126)] then
		xpcall(_UPVALUE1_[_ENV("on_exit_game_state_%s", L5_126)], A0_121:fight_traceback(), A0_121, A1_122, A2_123, A3_124, A4_125)
	end
	A0_121.game_state = A1_122
	local L6_127 = L6_127
	local L7_128 = L7_128
	L6_127 = L6_127(L7_128, A1_122)
	L7_128 = _UPVALUE1_
	L7_128 = L7_128[L6_127]
	if L7_128 then
		local L8_129 = L8_129
		local L9_130 = L9_130
		local L10_131 = L10_131
		local L11_132 = L11_132
		local L12_133 = L12_133
		local L13_134 = L13_134
		local L14_135 = L14_135
		L8_129(L9_130, L10_131, L11_132, L12_133, L13_134, L14_135, A4_125)
		local L15_136 = L15_136
	end
end
;({})[L20_20.national_match_audition] = true
;({})[L20_20.national_match_eliminator] = true
;({})[L20_20.national_match_final] = true
;({})[L20_20.season_league_audition] = true
;({})[L20_20.pvp_season_league_eliminator] = true
;({})[L20_20.pvp_season_league_peak] = true
function Game.module.fight.ways.base.on_enter_game_state_loading(A0_137, A1_138)
	if not GameEnv.is_editor and _ENV[A0_137.play_type] then
		GameEnv.init_is_simulator()
	end
	A0_137:start_loading()
	local L3_139 = L3_139
end
function Game.module.fight.ways.base.on_exit_game_state_loading(A0_140, A1_141)
	A0_140:enter_fight_close_ui()
end
function Game.module.fight.ways.base.enter_fight_close_ui(A0_142)
	local L1_143 = L1_143
	L1_143 = L1_143(A0_142)
	if not L1_143 then
		return
	end
	L1_143 = Game
	L1_143 = L1_143.module
	L1_143 = L1_143.scene_manager
	L1_143.cur_scene:hide_loading_view()
	local L2_144 = A0_142:get_retain_view_names()
	L5_5.close_unuse_view(L2_144)
	local L4_146 = L4_146
	L4_146 = L5_5
	L4_146 = L4_146.remove_all_sub_view_cache
	L4_146()
end
function Game.module.fight.ways.base.get_retain_view_names(A0_147)
	local L1_148
	L1_148 = {}
	L1_148.GameMainView = true
	L1_148.BrocastView = true
	L1_148.AfficheTipView = true
	L1_148.CommonConfirmView = true
	L1_148.TransitionView = true
	L1_148.FightUI = true
	local L2_149, L3_150 = L2_149, L3_150
	L2_149(L3_150, L1_148)
	local L4_151 = L4_151
	return L1_148
end
function Game.module.fight.ways.base.on_enter_game_state_fighting(A0_152, A1_153, A2_154)
	local L6_158 = A0_152:need_brocast_fight_start()
	if L6_158 then
		L6_158 = _ENV
		L6_158 = L6_158.brocast
		L6_158("fight_start")
	end
	L6_158 = _UPVALUE1_
	L6_158 = L6_158(A0_152)
	if not L6_158 then
		L6_158 = require
		L6_158 = L6_158("game.module.common_view.manager.confirm")
		;({}).content = "PC\231\171\175\230\151\160\230\179\149\229\143\130\228\184\142\229\133\168\229\155\189\233\148\166\230\160\135\232\181\155\239\188\140\232\175\183\229\136\135\230\141\162\231\167\187\229\138\168\231\171\175\239\188\129"
		;({}).hide_close = true
		;({}).hide_cancel = true
		;({}).not_sure_hide = true
		;({}).sure_click = function()
			BroadcastTips.broadcast_tips("PC\231\171\175\230\151\160\230\179\149\229\143\130\228\184\142\229\133\168\229\155\189\233\148\166\230\160\135\232\181\155\239\188\140\232\175\183\229\136\135\230\141\162\231\167\187\229\138\168\231\171\175\239\188\129")
			local L1_159 = L1_159
		end
		;({}).hide_cb = function()
			BroadcastTips.broadcast_tips("PC\231\171\175\230\151\160\230\179\149\229\143\130\228\184\142\229\133\168\229\155\189\233\148\166\230\160\135\232\181\155\239\188\140\232\175\183\229\136\135\230\141\162\231\167\187\229\138\168\231\171\175\239\188\129")
			local L1_160 = L1_160
		end
		L6_158.confirm({})
	end
	L6_158 = A0_152.need_stop_fight
	if L6_158 then
		L6_158 = A0_152.stop_fight
		L6_158(A0_152)
		return
	end
	L6_158 = A0_152.init_play_speed
	L6_158(A0_152, A2_154)
	L6_158 = A0_152.try_to_install_touch
	L6_158(A0_152)
	L6_158 = A0_152.change_fight_state
	L6_158(A0_152, "preview")
	L6_158 = A0_152.play_fight_bgm
	L6_158(A0_152, A0_152.cf_scene.bgm)
	L6_158 = A0_152.req_battle_show_force_info_c2s
	L6_158(A0_152)
	L6_158 = A0_152.is_reconnecting
	if not L6_158 then
		L6_158 = A0_152.play_type
		if L6_158 == "season" then
			L6_158 = Game
			L6_158 = L6_158.module
			L6_158 = L6_158.newbie_fight_flow
			L6_158.try_to_update_to_next_flow()
			local L4_156 = L4_156
		end
	end
end
function Game.module.fight.ways.base.need_brocast_fight_start(A0_161)
	return true
end
function Game.module.fight.ways.base.on_exit_game_state_fighting(A0_162, A1_163)
	A0_162:clear_all_round_timers()
	local L2_164, L3_165, L4_166 = L2_164, L3_165, L4_166
	L2_164 = A0_162.round
	L2_164 = L2_164.cur_attacker_infos
	if not L2_164 then
		return
	end
	L3_165 = nil
	L4_166 = _ENV
	L4_166 = L4_166.unit_round_status
	L4_166 = L4_166.done
	L7_169 = ipairs
	L8_170 = L2_164
	L7_169, L8_170, L9_171 = L7_169(L8_170)
	for _FORV_8_, _FORV_9_ in L7_169, L8_170, L9_171 do
		L3_165 = A0_162:get_unit_by_id(_FORV_9_.obj_id, true)
		if L3_165 then
			local L12_174 = L12_174
			L12_174(A0_162, L3_165, L4_166)
			local L13_175 = L13_175
		end
	end
end
function Game.module.fight.ways.base.get_event_names(A0_176)
	local L1_177
	L1_177 = {}
	local L2_178 = L2_178
	local L3_179 = L3_179
	local L4_180 = L4_180
	local L5_181 = L5_181
	local L6_182 = L6_182
	local L7_183 = L7_183
	local L8_184 = L8_184
	local L9_185 = L9_185
	L1_177[1] = L2_178
	L1_177[2] = L3_179
	L1_177[3] = L4_180
	L1_177[4] = L5_181
	L1_177[5] = L6_182
	L1_177[6] = L7_183
	L1_177[7] = L8_184
	L1_177[8] = L9_185
	local L1_177[9], L10_186 = "scene_camera_pos_changed", L10_186
	return L1_177
end
function Game.module.fight.ways.base.get_csharp_event_names(A0_187)
	local L1_188
	L1_188 = {}
	local L2_189 = A0_187:is_physics_env()
	if L2_189 then
		L2_189 = table
		L2_189 = L2_189.insert
		L2_189(L1_188, "BulletCollision")
		L2_189(L1_188, "BulletEnterWind")
		L2_189(L1_188, "BulletExitWind")
		L2_189(L1_188, "BulletEnterFreeFly")
		L2_189(L1_188, "UnitCollisionWithUnit")
		L2_189(L1_188, "UnitCollisionWithObstacle")
		L2_189(L1_188, "UnitCollisionWithLand")
		L2_189(L1_188, "SceneUnitPosChange")
		L2_189(L1_188, "SceneUnitPosChangeEnd")
		L2_189(L1_188, "SceneUnitObstacleDie")
		L2_189(L1_188, "SceneUnitObstacleDestroy")
		L2_189(L1_188, "SceneUnitObstacleBoom")
		L2_189(L1_188, "SceneUnitVolcanoFire")
		L2_189(L1_188, "SceneObjPosChange")
		L2_189(L1_188, "SceneObjPosChangeEnd")
		L2_189(L1_188, "SceneBodyHpChanged")
		L2_189(L1_188, "SceneBodyHpZero")
		L2_189(L1_188, "Box2DCollisionEnter")
		L2_189(L1_188, "Box2DCollisionExit")
		L2_189(L1_188, "SceneBalloonOverTop")
		L2_189(L1_188, "SnowballCollisionEnter")
		L2_189(L1_188, "SnowballConsume")
		local L3_190 = L3_190
		local L4_191 = L4_191
		L3_190(L4_191, "SnowballDie")
		local L5_192 = L5_192
	end
	return L1_188
end
function Game.module.fight.ways.base.on_scene_camera_pos_changed(A0_193)
	A0_193:fit_touch_ground_collider()
end
function Game.module.fight.ways.base.setup_events(A0_194)
	local L1_195
	L1_195 = A0_194.event_names
	if L1_195 then
		return
	end
	L1_195 = Game
	L1_195 = L1_195.events
	A0_194.event_names = A0_194:get_event_names()
	L1_195.add_listeners(A0_194.event_names, A0_194, true)
	A0_194.csharp_events = A0_194:get_csharp_event_names()
	L1_195.add_csharp_event_listeners(A0_194.csharp_events, A0_194, true)
	UpdateBeat:Add(A0_194.update, A0_194)
	local L2_196, L3_197 = L2_196, L3_197
	local L4_198 = L4_198
	L2_196(L3_197, L4_198, A0_194)
	local L5_199 = L5_199
end
function Game.module.fight.ways.base.clear_events(A0_200)
	local L1_201
	L1_201 = A0_200.event_names
	if not L1_201 then
		return
	end
	L1_201 = Game
	L1_201 = L1_201.events
	L1_201.remove_listeners(A0_200.event_names, A0_200, true)
	A0_200.event_names = nil
	L1_201.remove_csharp_event_listeners(A0_200.csharp_events, A0_200, true)
	A0_200.csharp_events = nil
	UpdateBeat:Remove(A0_200.update, A0_200)
	local L2_202, L3_203 = L2_202, L3_203
	local L4_204 = L4_204
	L2_202(L3_203, L4_204, A0_200)
	local L5_205 = L5_205
end
function Game.module.fight.ways.base.update(A0_206, A1_207, A2_208)
	local L3_209
	L3_209 = A0_206.frame_count
	if not L3_209 then
		L3_209 = 0
	end
	A0_206.frame_count = L3_209 + 1
	if A0_206.game_state == "fighting" then
		A0_206:on_every_frame(A1_207, A2_208)
		if L3_209 % 2 == 0 then
			A0_206:on_every_two_frame(A1_207, A2_208)
		end
		if L3_209 % 5 == 0 then
			A0_206:on_every_five_frame(A1_207, A2_208)
		end
		if L3_209 % 10 == 0 then
			A0_206:on_every_ten_frame(A1_207, A2_208)
		end
	end
	if A0_206.game_state == "ending" then
		A0_206:update_units()
		if L3_209 % 5 == 0 then
			local L4_210, L5_211 = L4_210, L5_211
			local L6_212 = L6_212
			L4_210(L5_211, L6_212, A2_208)
			local L7_213 = L7_213
		end
	end
end
function Game.module.fight.ways.base.on_every_frame(A0_214, A1_215)
	A0_214:update_units()
	A0_214:update_bullets(A1_215)
	A0_214:update_tombs()
	A0_214:update_holes()
	A0_214:update_souls()
	A0_214:update_drops()
	A0_214:update_camera_btree(A1_215)
	local L4_216 = L4_216
end
function Game.module.fight.ways.base.on_every_two_frame(A0_217, A1_218)
	A0_217:update_recommand_forces()
end
function Game.module.fight.ways.base.on_every_five_frame(A0_219, A1_220)
	A0_219:update_units_five_frame()
end
function Game.module.fight.ways.base.on_every_ten_frame(A0_221, A1_222)
	A0_221:try_gpt_say_active()
	if A0_221.need_check_transfer_direction and A0_221.need_check_transfer_direction > 0 and A0_221:try_to_show_transfer_direction_tips() then
		A0_221.need_check_transfer_direction = 0
	end
end
function Game.module.fight.ways.base.fixed_update(A0_223, A1_224)
	local L5_228, L6_229, L7_230 = L5_228, L6_229, L7_230
	if not A0_223.play_speed then
		return
	end
	A1_224 = A0_223.cur_fixed_deltatime
	L5_228 = _UPVALUE1_
	L5_228 = L5_228.play_speed_to_time_scale_per_frame
	L6_229 = A0_223.play_speed
	L5_228 = L5_228[L6_229]
	if not L5_228 then
		L5_228 = 1
	end
	_ENV = L5_228
	L5_228 = _ENV
	L5_228 = A1_224 * L5_228
	_UPVALUE2_ = L5_228
	L5_228 = A0_223.client_type_handler
	L6_229 = L5_228
	L5_228 = L5_228.get_play_speed
	L5_228 = L5_228(L6_229)
	if not L5_228 then
		L5_228 = 1
	end
	L6_229 = A0_223.play_speed_time_line
	L6_229 = L6_229 + L5_228
	A0_223.play_speed_time_line = L6_229
	L6_229 = math
	L6_229 = L6_229.floor
	L7_230 = A0_223.play_speed_time_line
	L6_229 = L6_229(L7_230)
	L7_230 = A0_223.play_speed_time_line
	L7_230 = L7_230 - L6_229
	A0_223.play_speed_time_line = L7_230
	L7_230 = 0
	L8_231 = 1
	_FOR_ = 1
	for _FORV_8_ = L8_231, _FOR_, _FOR_ do
		L7_230 = 0
		if not A0_223.timeline_speed then
		end
		while L7_230 < 1 do
			L7_230 = L7_230 + 1
			if A0_223:is_multi_player_physics_env() and not A0_223:is_timeline_running() then
				break
			end
			A0_223.timer:update(_UPVALUE2_, A1_224)
			if A0_223.unscale_timer and _FORV_8_ == 1 then
				A0_223.unscale_timer:update(_UPVALUE2_, A1_224)
			end
			if A0_223:is_multi_player_physics_env() then
				A0_223:fixed_update_timeline(_UPVALUE2_)
			end
			if A0_223.game_state == "fighting" then
				A0_223:fixed_update_cmds()
				if _FORV_8_ == 1 then
					A0_223:fixed_update_units(A1_224)
					A0_223:fixed_update_tombs(A1_224)
					A0_223:fixed_update_souls(A1_224)
					A0_223:fixed_update_drops(A1_224)
				end
				if not A0_223:is_physics_env() or _FORV_8_ == 1 then
					A0_223:fixed_update_bullets(_UPVALUE2_)
					A0_223:camera_update_follow_bullet(_UPVALUE2_)
				end
				if _FORV_8_ == 1 then
					A0_223:fixed_update_physics(A1_224)
				end
			end
			if A0_223.game_state == "ending" and _FORV_8_ == 1 then
				A0_223:fixed_update_units(A1_224)
			end
		end
	end
end
function Game.module.fight.ways.base.set_is_pause(A0_236, A1_237)
	A0_236:raw_set_is_pause(A1_237)
	local L2_238, L3_239 = L2_238, L3_239
	local L4_240 = L4_240
	;({}).is_pause = A1_237
	L2_238(L3_239, L4_240, {})
	local L5_241 = L5_241
end
