local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
L0_0 = assert
local L1_1, L14_14, L17_17, L18_18, L21_21 = DataConfigs, L14_14, L17_17, L18_18, L21_21
L2_2 = L1_1.language_define
L3_3 = Game
L3_3 = L3_3.events
L4_4 = Game
L4_4 = L4_4.redpoint_helper
L5_5 = Game
L5_5 = L5_5.ui_manager
L6_6 = Game
L6_6 = L6_6.ui_const
L7_7 = Game
L7_7 = L7_7.server_time
L8_8 = Game
L8_8 = L8_8.module
L8_8 = L8_8.open_func
L9_9 = L8_8.const
L14_14 = require
L17_17 = "game.other.game_time.init"
L14_14 = L14_14(L17_17)
L17_17 = require
L18_18 = "game.other.player_prefs"
L17_17 = L17_17(L18_18)
L18_18 = require
L21_21 = "game.platform.sdk.sdk_manager"
L18_18 = L18_18(L21_21)
L21_21 = Game
L21_21 = L21_21.module
L21_21 = L21_21.data
local L15_15 = L15_15
local L16_16 = import(".head")
local L19_19 = L19_19
local L20_20 = L20_20
function L16_16.init()
	_ENV.init()
	L20_20.init()
	L16_16.setup_events()
	L16_16.init_red_points()
	L16_16.register_jump()
	local L1_22 = L1_22
	L1_22(_UPVALUE4_, L16_16.try_req_data)
	local L2_23 = L2_23
	L1_22 = L16_16
	L1_22 = L1_22.init_gm_btns
	L1_22()
end
function L16_16.init_gm_btns()
	local L0_24
	L0_24 = Game
	local L0_24, L4_28 = L0_24.module, L4_28
	L0_24 = L0_24.gm_panel
	L4_28 = L0_24.register_custom_gm_cmd
	;({}).name = "\233\163\158\232\161\140\231\171\158\232\181\155\229\136\134\228\186\171\230\168\161\230\139\159"
	;({}).callback = function(A0_29)
		local L1_30 = _ENV.is_test_share()
		L1_30 = not L1_30
		_ENV.set_test_share_flag(L1_30)
		local L2_31 = L2_31
		if not L1_30 or not "\233\163\158\232\161\140\231\171\158\232\181\155\229\136\134\228\186\171\230\168\161\230\139\159\229\183\178\229\188\128\229\144\175" then
		end
		L2_31("\233\163\158\232\161\140\231\171\158\232\181\155\229\136\134\228\186\171\230\168\161\230\139\159\229\183\178\229\133\179\233\151\173")
		local L3_32 = L3_32
	end
	L4_28(L0_24.const.custom_gm_type.gm_button, {})
	local L3_27 = L3_27
	L4_28 = L16_16
	L4_28 = L4_28.is_from_share_invite
	L4_28()
end
function L16_16.clear()
	local L1_34 = L1_34
	L1_34(_UPVALUE1_, L16_16.try_req_data)
	local L2_35 = L2_35
	L1_34 = L16_16
	L1_34 = L1_34.cancel_jump_timer
	L1_34()
	L1_34 = L16_16
	L1_34 = L1_34.clear_events
	L1_34()
	L1_34 = L16_16
	L1_34 = L1_34.clear_red_points
	L1_34()
	L1_34 = L20_20
	L1_34 = L1_34.clear
	L1_34()
	L1_34 = L19_19
	L1_34 = L1_34.clear
	L1_34()
	L1_34 = L16_16
	L1_34.is_process_invite = false
end
function L16_16.try_req_data()
	local L1_36 = _ENV.is_open(_UPVALUE1_)
	if not L1_36 then
		return
	end
	L1_36 = L16_16
	L1_36 = L1_36.update_red_point
	L1_36()
end
function L16_16.init_red_points()
	local L4_41 = _ENV.new_red_point
	;({}).parent_ids, ({})[1] = {}, "entrance_game_room_main_rp"
	;({}).id = _UPVALUE1_.rp_type.game_room_once_red_point
	;({}).tp = 1
	;({}).cb = function()
		local L0_42 = L0_42
		L0_42 = L0_42(_UPVALUE1_)
		if not L0_42 then
			L0_42 = 0
			return L0_42
		end
		L0_42 = Game
		L0_42 = L0_42.module
		L0_42 = L0_42.data
		local L1_43 = L0_42.get_player_id()
		local L2_44 = L2_44
		local L3_45 = L3_45
		local L4_46 = L4_46
		local L5_47 = L5_47
		local L2_44, L6_48 = L2_44(L3_45, L4_46, L5_47, L1_43), L6_48
		if L2_44 == 1 then
			L3_45 = 0
			if L3_45 then
				goto lbl_27
			end
		end
		L3_45 = 1
		::lbl_27::
		return L3_45
	end
	local L3_40.point_cb_infos, ({})[1], L3_40 = {}, {}, L3_40
	L4_41(L3_40)
end
function L16_16.set_game_room_once_red_point()
	local L0_49
	L0_49 = Game
	L0_49 = L0_49.module
	L0_49 = L0_49.data
	local L1_50 = L0_49.get_player_id()
	local L3_52 = L3_52
	local L4_53 = L4_53
	local L5_54 = L5_54
	L3_52(L4_53, L5_54, nil, L1_50)
	local L6_55 = L6_55
	L3_52 = L16_16
	L3_52 = L3_52.update_red_point
	L3_52()
end
function L16_16.update_red_point()
	_ENV.update_red_point(_UPVALUE1_.rp_type.game_room_once_red_point)
	local L1_56 = L1_56
end
function L16_16.clear_red_points()
	local L1_57 = L1_57
	L1_57(_UPVALUE1_.rp_type.game_room_once_red_point, true)
	local L2_58 = L2_58
end
function L16_16.setup_events()
	_ENV.listen_events, ({})[1] = {}, "application_focus"
	_ENV.listen_events, ({})[2] = {}, "view_open"
	if _ENV.has_setup then
		return
	end
	_ENV.has_setup = true
	local L0_59 = L0_59
	local L1_60 = L1_60
	local L2_61 = L2_61
	L0_59(L1_60, L2_61, false)
	local L3_62 = L3_62
end
function L16_16.clear_events()
	if not _ENV.has_setup then
		return
	end
	_ENV.has_setup = false
	local L0_63 = L0_63
	local L1_64 = L1_64
	local L2_65 = L2_65
	L0_63(L1_64, L2_65, false)
	local L3_66 = L3_66
end
function L16_16.on_view_open(A0_67)
	if _ENV.is_process_invite then
		return
	end
	if A0_67 == "GameMainView" then
		_ENV.on_application_focus(true)
		local L2_68 = L2_68
	end
end
function L16_16.on_application_focus(A0_69)
	repeat
		local L3_72 = L3_72
		if A0_69 then
			L3_72 = _ENV
			L3_72 = L3_72.is_process_invite
			if L3_72 then
				return
			end
			L3_72 = _ENV
			L3_72 = L3_72.set_process_invite
			L3_72()
			L3_72 = Game
			L3_72 = L3_72.module
			L3_72 = L3_72.newbie_fight_flow
			if not L3_72.is_pass_flow() then
				return
			end
			if _ENV.is_from_share_invite() then
				_ENV.jump_from_invite()
			end
			local L2_71 = _ENV.is_from_share_map()
			if not L2_71 then
				goto lbl_41
			end
			local L4_73 = L4_73
			Game.module.map_studio.try_open_map_detail(L2_71)
			local L5_74 = L5_74
			break -- pseudo-goto
		end
		L3_72 = _ENV
		L3_72.is_process_invite = false
	until true
	::lbl_41::
end
function L16_16.jump_from_invite()
	local L4_79 = _ENV.cancel_jump_timer
	L4_79()
	L4_79 = _ENV
	local L1_76, L2_77 = L1_76, L2_77
	local L3_78 = L3_78
	L1_76 = L1_76(L2_77, L3_78, function()
		local L0_80
		repeat
			L0_80 = _ENV
			L0_80.jump_timer = nil
			L0_80 = Game
			L0_80 = L0_80.module
			L0_80 = L0_80.guide_system
			if L0_80 then
				local L1_81 = L0_80.is_processing_action()
				if L1_81 then
					return
				end
			end
			L1_81 = Game
			L1_81 = L1_81.module
			L1_81 = L1_81.jump_to
			if L1_81.get_is_open_func(L6_6.GameRoomMainView.name) then
				local L2_82 = L2_82
				L2_82(L6_6.GameRoomMainView.name)
				break -- pseudo-goto
			end
			L2_82 = Game
			L2_82 = L2_82.module
			L2_82 = L2_82.main_view
			if L2_82.is_sub_panel_show("entrance") then
				return
			end
			local L3_83 = L3_83
			L3_83("entrance")
			local L4_84 = L4_84
		until true
	end)
	L4_79.jump_timer = L1_76
end
function L16_16.cancel_jump_timer()
	if _ENV.jump_timer then
		local L0_85 = L0_85
		L0_85(_ENV.jump_timer)
		local L1_86 = L1_86
		L0_85 = _ENV
		L0_85.jump_timer = nil
	end
end
function L16_16.set_process_invite()
	local L0_87, L1_88
	L0_87 = _ENV
	L0_87.is_process_invite = true
end
