local L0_0, L2_2, L3_3, L4_4, L10_10, L11_11, L12_12, L13_13, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L25_25, L26_26 = L0_0, ".head", L3_3, L4_4, L10_10, L11_11, L12_12, L13_13, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L25_25, L26_26
L0_0 = L0_0(L2_2)
L2_2 = L0_0.data
L3_3 = L0_0.network
L4_4 = Game
L4_4 = L4_4.ui_manager
L10_10 = Game
L10_10 = L10_10.redpoint_helper
L11_11 = assert
L12_12 = table
L12_12 = L12_12.insert
L11_11 = L11_11(L12_12)
L12_12 = assert
L13_13 = string
L13_13 = L13_13.format
L12_12 = L12_12(L13_13)
L13_13 = assert
L16_16 = string
L16_16 = L16_16.split
L13_13 = L13_13(L16_16)
L16_16 = assert
L17_17 = string
L17_17 = L17_17.gsub
L16_16 = L16_16(L17_17)
L17_17 = Game
L17_17 = L17_17.module
L17_17 = L17_17.team
L18_18 = L17_17.data
L19_19 = L17_17.const
L20_20 = Game
L20_20 = L20_20.module
L20_20 = L20_20.task
L20_20 = L20_20.data
L21_21 = Game
L21_21 = L21_21.module
L21_21 = L21_21.lucky_box
L25_25 = require
L26_26 = "game.other.player_prefs"
L25_25 = L25_25(L26_26)
L26_26 = DataConfigs
L26_26 = L26_26.mainview_btns
function L0_0.init()
	local L4_31 = _ENV.init
	L4_31()
	L4_31 = L3_3
	L4_31 = L4_31.init
	L4_31()
	L4_31 = L0_0
	L4_31 = L4_31.setup_events
	L4_31()
	L4_31 = L0_0
	L4_31 = L4_31.init_redpoint
	L4_31()
	L4_31 = L0_0
	L4_31 = L4_31.register_jump
	L4_31()
	L4_31 = _ENV
	L4_31 = L4_31.add_push
	L4_31(L0_0.notice_type.update_version)
	L4_31 = _ENV
	L4_31 = L4_31.add_push
	L4_31(L0_0.notice_type.bytegame_task_share_info)
	L4_31 = _ENV
	L4_31 = L4_31.add_push
	L4_31(L0_0.notice_type.home_party)
	L4_31 = Game
	L4_31 = L4_31.module
	L4_31 = L4_31.gm_panel
	;({}).name = "\229\188\128\229\144\175\231\186\162\231\130\185\228\188\152\229\133\136\231\186\167\229\164\132\231\144\134"
	;({}).callback = function()
		local L1_32 = L1_32
		L1_32("forbid_red", false)
		local L2_33 = L2_33
		L1_32 = L0_0
		L1_32 = L1_32.update_red_point_order
		L1_32()
	end
	L4_31.register_custom_gm_cmd(L4_31.const.custom_gm_type.gm_button, {})
	;({}).name = "\229\133\179\233\151\173\231\186\162\231\130\185\228\188\152\229\133\136\231\186\167\229\164\132\231\144\134"
	;({}).callback = function()
		local L1_34 = L1_34
		L1_34("forbid_red", true)
		local L2_35 = L2_35
		L1_34 = L0_0
		L1_34 = L1_34.update_red_point_order
		L1_34()
	end
	L4_31.register_custom_gm_cmd(L4_31.const.custom_gm_type.gm_button, {})
	;({}).name = "\229\188\128\229\144\175\231\186\162\231\130\185\228\188\152\229\133\136\231\186\167\230\180\187\232\183\131\229\186\166\229\164\132\231\144\134"
	;({}).callback = function()
		local L1_36 = L1_36
		L1_36("forbid_red_act", false)
		local L2_37 = L2_37
		L1_36 = L0_0
		L1_36 = L1_36.update_red_point_order
		L1_36()
	end
	L4_31.register_custom_gm_cmd(L4_31.const.custom_gm_type.gm_button, {})
	;({}).name = "\229\133\179\233\151\173\231\186\162\231\130\185\228\188\152\229\133\136\231\186\167\230\180\187\232\183\131\229\186\166\229\164\132\231\144\134"
	;({}).callback = function()
		local L1_38 = L1_38
		L1_38("forbid_red_act", true)
		local L2_39 = L2_39
		L1_38 = L0_0
		L1_38 = L1_38.update_red_point_order
		L1_38()
	end
	L4_31.register_custom_gm_cmd(L4_31.const.custom_gm_type.gm_button, {})
	;({}).name = "\230\137\147\229\141\176\230\155\180\229\164\154\231\186\162\231\130\185"
	;({}).callback = function()
		local L3_43 = Game.redpoint_helper
		L3_43 = L3_43._try_get_collection_by_id
		L4_44 = "main_view_pop_btn"
		L3_43 = L3_43(L4_44)
		L4_44 = ipairs
		L5_45 = L3_43.child_nodes
		L4_44, L5_45, L6_46 = L4_44(L5_45)
		for _FORV_4_, _FORV_5_ in L4_44, L5_45, L6_46 do
			local L9_49 = L9_49
			if not _FORV_5_.red then
			end
			local L10_50 = L10_50
			if not _FORV_5_.green then
			end
			local L10_50, L11_51 = L10_50("id %s red %s green %s", _FORV_5_.id, 0, 0)
			L9_49(L10_50, L11_51, L10_50("id %s red %s green %s", _FORV_5_.id, 0, 0))
		end
	end
	L4_31.register_custom_gm_cmd(L4_31.const.custom_gm_type.gm_button, {})
	;({}).name = "\230\181\139\232\175\149\232\174\162\233\152\133\229\143\130\230\149\176"
	;({}).callback = function()
		local L0_52, L3_55 = L0_52, "game.platform.mini_game.mini_game_interface"
		L0_52 = L0_52(L3_55)
		L3_55 = L0_52.get_wx_setting
		L3_55("mainSwitch", function(A0_56)
			local L4_59 = L4_59
			L4_59("mainSwitch" .. table_string(A0_56))
		end)
		L3_55 = L0_52.get_wx_setting
		local L2_54 = L2_54
		L3_55(L2_54, function(A0_60)
			local L4_63 = L4_63
			L4_63("itemSettings " .. table_string(A0_60))
		end)
	end
	L4_31.register_custom_gm_cmd(L4_31.const.custom_gm_type.gm_button, {})
	;({}).name = "\229\144\175\231\148\168\228\184\187\231\149\140\233\157\162\233\128\143\230\152\142\230\142\167\229\136\182\230\140\137\233\146\174"
	;({}).callback = function()
		local L1_64 = L1_64
		L1_64("control_transparent_btn", true)
		local L2_65 = L2_65
	end
	L4_31.register_custom_gm_cmd(L4_31.const.custom_gm_type.gm_button, {})
	;({}).name = "\231\166\129\231\148\168\228\184\187\231\149\140\233\157\162\233\128\143\230\152\142\230\142\167\229\136\182\230\140\137\233\146\174"
	;({}).callback = function()
		local L1_66 = L1_66
		L1_66("control_transparent_btn", false)
		local L2_67 = L2_67
	end
	L4_31.register_custom_gm_cmd(L4_31.const.custom_gm_type.gm_button, {})
	local L1_28 = L1_28
	local L2_29 = L2_29
	;({}).name = "\230\182\136\230\182\136\228\185\144"
	;({}).callback = function()
		_ENV.open_view("PartyConcertPlayView")
		local L1_68 = L1_68
	end
	L1_28(L2_29, {})
	local L3_30 = L3_30
end
function L0_0.clear()
	_ENV.clear_events()
	_ENV.clear_red_point()
	L3_3.clear()
	L1_1.clear()
end
function L0_0.register_jump()
	local L3_72 = _ENV.register_info
	;({}).handler = function(A0_73)
		local L1_74
		L1_74 = A0_73.key
		if not L1_74 then
			L1_74 = "team"
		end
		if L1_74 == "rogue" then
			GameLogger.Warning("rogue\229\156\186\230\153\175\233\161\181\231\173\190\228\184\141\232\131\189\232\181\176MainView\232\183\179\232\189\172\230\181\129\231\168\139,\232\175\183\230\137\190\231\168\139\229\186\143\229\141\149\231\139\172\229\174\158\231\142\176\232\175\165\232\130\137\233\184\189\229\156\186\230\153\175\231\154\132\232\183\179\232\189\172")
			return
		end
		if _ENV.the_cur_scene_tp_is("scene") then
			L0_0.show_sub_panel(L1_74, A0_73.sub_args, A0_73.force_selected)
			_UPVALUE2_.brocast("click_bottom_function_entrance", L1_74)
			L4_4.close_unuse_view()
		else
			local L2_75 = L2_75
			local L3_76 = L3_76
			if _ENV.sub_scenes[L1_74] == nil or not L1_74 then
			end
			;({}).sub_scene_type = "team"
			;({}).main_view_sub_key = L1_74
			local ({}).sub_scene_args, L5_78 = A0_73.sub_args, L5_78
			L2_75(L3_76, L5_78)
		end
	end
	L3_72("MainView", {})
	local L2_71 = L2_71
end
L0_0.main_view_panel_func = {}
function L0_0.set_custom_show_func(A0_79, A1_80)
	local L2_81
	L2_81 = _ENV
	L2_81 = L2_81.custom_show_func
	L2_81[A0_79] = A1_80
end
function L0_0.set_custom_hide_func(A0_82, A1_83)
	local L2_84
	L2_84 = _ENV
	L2_84 = L2_84.custom_hide_func
	L2_84[A0_82] = A1_83
end
local L24_24 = L24_24
;({}).offset, ({}).list = Vector2.New(168, -254), GlobalConst.resource_default_list
;({}).font_size = 34
;({}).show_func = function(A0_85)
	A0_85.objs.task_node:set_active(false)
	A0_85.objs.left_up:set_active(false)
	A0_85.objs.right_up:set_active(false)
	A0_85.btns.btn_niudan:set_active(false)
	A0_85.objs.chat_node:set_active(false)
	A0_85.btns.btn_popup:set_active(false)
	A0_85.objs.push_node:set_active(false)
	A0_85.objs.player_info:set_active(false)
	local L2_86 = L2_86
	L2_86(A0_85.objs.championship_node, false)
	local L3_87 = L3_87
	A0_85.open_resource = false
	L2_86 = _ENV
	L2_86 = L2_86.adjust_resource_HUD
	L2_86()
end
L0_0.main_view_panel_func.skill, ({}).hide_func = {}, function(A0_88)
	A0_88.objs.task_node:set_active(true)
	A0_88.objs.left_up:set_active(true)
	A0_88.objs.right_up:set_active(true)
	A0_88.btns.btn_niudan:set_active(true)
	A0_88.objs.chat_node:set_active(true)
	local L2_89 = L2_89
	L2_89(A0_88.objs.championship_node, true)
	local L3_90 = L3_90
end
;({}).show_func = function(A0_91, A1_92)
	local L2_93
	L2_93 = _ENV
	L2_93 = L2_93.custom_show_func
	L2_93 = L2_93.team
	if not A1_92 and L2_93 then
		L2_93()
		return
	end
	A0_91.objs.task_node:set_active(true)
	A0_91.objs.left_up:set_active(true)
	A0_91.objs.right_up:set_active(true)
	A0_91.btns.btn_popup:set_active(true)
	A0_91.objs.player_info:set_active(true)
	A0_91.btns.btn_niudan:set_active(true)
	A0_91.objs.push_node:set_active(true)
	A0_91.objs.chat_node:set_active(true)
	A0_91.objs.championship_node:set_active(true)
	A0_91:update_special_btns()
	A0_91.open_resource = _UPVALUE1_
	L4_4.open_resource_HUD(A0_91.name, _UPVALUE1_)
	L21_21.try_pop_lucky_box()
	local L3_94, L4_95 = L3_94, L4_95
	L3_94(L4_95, true)
	local L5_96 = L5_96
end
L0_0.main_view_panel_func.team, ({}).hide_func = {}, function(A0_97)
	local L1_98
	L1_98 = _ENV
	L1_98 = L1_98.custom_show_func
	L1_98 = L1_98.team
	if L1_98 then
		L1_98()
		A0_97:hide_special_btns()
		return
	end
	local L2_99, L3_100 = L2_99, L3_100
	L2_99(L3_100, false)
	local L4_101 = L4_101
end
;({}).show_func = function(A0_102)
	A0_102.objs.task_node:set_active(false)
	A0_102.objs.left_up:set_active(false)
	A0_102.objs.right_up:set_active(false)
	A0_102.btns.btn_popup:set_active(false)
	A0_102.objs.player_info:set_active(false)
	A0_102.btns.btn_niudan:set_active(false)
	A0_102.objs.chat_node:set_active(false)
	A0_102.objs.push_node:set_active(false)
	local L2_103 = L2_103
	L2_103(A0_102.objs.championship_node, false)
	local L3_104 = L3_104
end
L0_0.main_view_panel_func.alliance, ({}).hide_func = {}, function(A0_105)
	A0_105.objs.task_node:set_active(true)
	A0_105.objs.left_up:set_active(true)
	A0_105.objs.right_up:set_active(true)
	A0_105.objs.player_info:set_active(true)
	A0_105.btns.btn_popup:set_active(true)
	A0_105.btns.btn_niudan:set_active(true)
	A0_105.objs.chat_node:set_active(true)
	local L2_106 = L2_106
	L2_106(A0_105.objs.championship_node, true)
	local L3_107 = L3_107
end
;({}).show_func = function(A0_108)
	A0_108.objs.task_node:set_active(false)
	A0_108.objs.left_up:set_active(false)
	A0_108.objs.right_up:set_active(false)
	A0_108.btns.btn_popup:set_active(false)
	A0_108.objs.player_info:set_active(false)
	A0_108.btns.btn_niudan:set_active(false)
	A0_108.objs.chat_node:set_active(false)
	A0_108.objs.push_node:set_active(false)
	local L2_109 = L2_109
	L2_109(A0_108.objs.championship_node, false)
	local L3_110 = L3_110
	A0_108.open_resource = false
	L2_109 = _ENV
	L2_109 = L2_109.adjust_resource_HUD
	L2_109()
end
L0_0.main_view_panel_func.alliance_join_in, ({}).hide_func = {}, function(A0_111)
	A0_111.objs.task_node:set_active(true)
	A0_111.objs.left_up:set_active(true)
	A0_111.objs.right_up:set_active(true)
	A0_111.objs.player_info:set_active(true)
	A0_111.btns.btn_popup:set_active(true)
	A0_111.btns.btn_niudan:set_active(true)
	A0_111.objs.chat_node:set_active(true)
	local L2_112 = L2_112
	L2_112(A0_111.objs.championship_node, true)
	local L3_113 = L3_113
end
;({}).show_func = function(A0_114)
	A0_114.objs.player_info:set_active(false)
	A0_114.objs.task_node:set_active(false)
	A0_114.objs.left_up:set_active(false)
	A0_114.objs.right_up:set_active(false)
	A0_114.btns.btn_niudan:set_active(false)
	A0_114.btns.btn_popup:set_active(false)
	A0_114.objs.chat_node:set_active(false)
	A0_114.objs.push_node:set_active(false)
	local L2_115 = L2_115
	L2_115(A0_114.objs.championship_node, false)
	local L3_116 = L3_116
	A0_114.open_resource = false
	L2_115 = _ENV
	L2_115 = L2_115.adjust_resource_HUD
	L2_115()
end
L0_0.main_view_panel_func.weapon, ({}).hide_func = {}, function(A0_117)
	A0_117.objs.player_info:set_active(true)
	A0_117.objs.task_node:set_active(true)
	A0_117.objs.left_up:set_active(true)
	A0_117.objs.right_up:set_active(true)
	A0_117.btns.btn_niudan:set_active(true)
	A0_117.btns.btn_popup:set_active(true)
	A0_117.objs.chat_node:set_active(true)
	local L2_118 = L2_118
	L2_118(A0_117.objs.championship_node, true)
	local L3_119 = L3_119
end
;({}).show_func = function(A0_120)
	A0_120.objs.player_info:set_active(false)
	A0_120.objs.task_node:set_active(false)
	A0_120.objs.left_up:set_active(false)
	A0_120.objs.right_up:set_active(false)
	A0_120.btns.btn_niudan:set_active(false)
	A0_120.btns.btn_popup:set_active(false)
	A0_120.objs.chat_node:set_active(false)
	A0_120.objs.push_node:set_active(false)
	local L2_121 = L2_121
	L2_121(A0_120.objs.championship_node, false)
	local L3_122 = L3_122
	A0_120.open_resource = false
	L2_121 = _ENV
	L2_121 = L2_121.adjust_resource_HUD
	L2_121()
end
L0_0.main_view_panel_func.entrance, ({}).hide_func = {}, function(A0_123)
	A0_123.objs.player_info:set_active(true)
	A0_123.objs.task_node:set_active(true)
	A0_123.objs.left_up:set_active(true)
	A0_123.objs.right_up:set_active(true)
	A0_123.btns.btn_niudan:set_active(true)
	A0_123.btns.btn_popup:set_active(true)
	A0_123.objs.chat_node:set_active(true)
	local L2_124 = L2_124
	L2_124(A0_123.objs.championship_node, true)
	local L3_125 = L3_125
end
;({}).show_func = function(A0_126)
	A0_126.objs.task_node:set_active(true)
	A0_126.objs.left_up:set_active(true)
	A0_126.objs.right_up:set_active(true)
	A0_126.btns.btn_popup:set_active(true)
	A0_126.objs.player_info:set_active(true)
	A0_126.btns.btn_niudan:set_active(true)
	A0_126.objs.chat_node:set_active(true)
	A0_126.objs.push_node:set_active(true)
	A0_126.objs.championship_node:set_active(false)
	A0_126.open_resource = _ENV
	local L2_127 = L2_127
	L2_127(A0_126.name, _ENV)
	local L3_128 = L3_128
end
L0_0.main_view_panel_func.dungeon_main, ({}).hide_func = {}, function(A0_129)
	A0_129.objs.task_node:set_active(true)
	A0_129.objs.left_up:set_active(true)
	A0_129.objs.right_up:set_active(true)
	A0_129.objs.player_info:set_active(true)
	A0_129.btns.btn_popup:set_active(true)
	A0_129.btns.btn_niudan:set_active(true)
	A0_129.objs.chat_node:set_active(true)
	local L2_130 = L2_130
	L2_130(A0_129.objs.championship_node, true)
	local L3_131 = L3_131
end
;({}).show_func = function(A0_132)
	A0_132.objs.player_info:set_active(false)
	A0_132.objs.task_node:set_active(false)
	A0_132.objs.left_up:set_active(false)
	A0_132.objs.right_up:set_active(false)
	A0_132.btns.btn_niudan:set_active(false)
	A0_132.btns.btn_popup:set_active(false)
	A0_132.objs.push_node:set_active(false)
	A0_132.objs.chat_node:set_active(false)
	local L2_133 = L2_133
	L2_133(A0_132.objs.championship_node, false)
	local L3_134 = L3_134
	A0_132.open_resource = false
	L2_133 = _ENV
	L2_133 = L2_133.adjust_resource_HUD
	L2_133()
end
L0_0.main_view_panel_func.seven_day_weapon, ({}).hide_func = {}, function(A0_135)
	A0_135.objs.task_node:set_active(true)
	A0_135.objs.left_up:set_active(true)
	A0_135.objs.right_up:set_active(true)
	A0_135.objs.player_info:set_active(true)
	A0_135.btns.btn_popup:set_active(true)
	A0_135.btns.btn_niudan:set_active(true)
	A0_135.objs.chat_node:set_active(true)
	local L2_136 = L2_136
	L2_136(A0_135.objs.championship_node, true)
	local L3_137 = L3_137
end
function L0_0.adjust_resouce(A0_138)
	local L1_139 = L1_139
	L1_139 = L1_139("GameMainView")
	if not L1_139 then
		return
	end
	L1_139.open_resource = A0_138
	_ENV.adjust_resource_HUD()
	local L2_140 = L2_140
end
function L0_0.show_sub_panel(A0_141, A1_142, A2_143)
	repeat
		if A0_141 == "rogue" then
			return
		end
		local L3_144 = L3_144
		L3_144 = L3_144("GameMainView")
		if L3_144 then
			local L7_148 = L7_148
			local L8_149 = L8_149
			L7_148(L8_149, A0_141, A1_142, nil, A2_143)
			local L9_150 = L9_150
			break -- pseudo-goto
		end
		L7_148 = _ENV
		L7_148 = L7_148.open_view
		L8_149 = "GameMainView"
		L9_150 = {}
		L9_150.key = A0_141
		L9_150.sub_args = A1_142
		L7_148(L8_149, L9_150)
	until true
end
function L0_0.is_sub_panel_show(A0_151)
	local L1_152 = L1_152
	local L1_152, L2_153 = L1_152("GameMainView"), L2_153
	if L1_152 then
		L2_153 = L1_152.sub_view_panel
		if L2_153 then
			L2_153 = L1_152.sub_view_panel
			L2_153 = L2_153.select_index
			L2_153 = L2_153 == A0_151
			return L2_153
		end
	end
	L2_153 = false
	return L2_153
end
L0_0.redpoint_id_list = {}
function L0_0.init_redpoint()
	local L0_154
	L0_154 = {}
	L0_154.id = "main_view_red_point"
	L0_154.tp = 1
	_ENV.new_red_point(L0_154)
	L6_6(L0_0.redpoint_id_list, "main_view_red_point")
	local L1_155 = L1_155
	L1_155(L0_0.redpoint_id_list, "main_view_pop_btn")
	L1_155 = {}
	L1_155.id = "main_view_bottom_weapon_btn"
	L1_155.tp = 1
	_ENV.new_red_point(L1_155)
	local L2_156 = L2_156
	L2_156(L0_0.redpoint_id_list, "main_view_bottom_weapon_btn")
	L2_156 = {}
	L2_156.id = "main_btn_entrance"
	L2_156.tp = 1
	L2_156.update_event = "main_btn_entrance_redpoint_update"
	_ENV.new_red_point(L2_156)
	local L3_157 = L3_157
	L3_157(L0_0.redpoint_id_list, "main_btn_entrance")
	L3_157 = {}
	L3_157.id = "entrance_tab_adventure_no_parent"
	L3_157.tp = 1
	L3_157.update_event = "entrance_tab_adventure_redpoint_update"
	_ENV.new_red_point(L3_157)
	local L4_158 = L4_158
	L4_158(L0_0.redpoint_id_list, "entrance_tab_adventure_no_parent")
	L4_158 = {}
	L4_158.parent_ids, ({})[1] = {}, "main_btn_entrance"
	L4_158.parent_ids, ({})[2] = {}, "entrance_tab_adventure_no_parent"
	L4_158.id = "entrance_tab_adventure"
	L4_158.tp = 1
	L4_158.update_event = "entrance_tab_adventure_redpoint_update"
	_ENV.new_red_point(L4_158)
	local L5_159 = L5_159
	L5_159(L0_0.redpoint_id_list, "entrance_tab_adventure")
	L5_159 = {}
	L5_159.id = "pvp_tab_red_point_no_parent"
	L5_159.tp = 1
	_ENV.new_red_point(L5_159)
	local L6_160 = L6_160
	L6_160(L0_0.redpoint_id_list, "pvp_tab_red_point_no_parent")
	L6_160 = {}
	L6_160.parent_ids, ({})[1] = {}, "main_btn_entrance"
	L6_160.parent_ids, ({})[2] = {}, "pvp_tab_red_point_no_parent"
	L6_160.id = "pvp_tab_red_point"
	L6_160.tp = 1
	_ENV.new_red_point(L6_160)
	local L7_161 = L7_161
	L7_161(L0_0.redpoint_id_list, "pvp_tab_red_point")
	L7_161 = {}
	L7_161.id = "main_view_bottom_team_btn"
	L7_161.tp = 1
	_ENV.new_red_point(L7_161)
	local L8_162 = L8_162
	L8_162(L0_0.redpoint_id_list, "main_view_bottom_team_btn")
	L8_162 = {}
	L8_162.id = "pve_tab_red_point_no_parent"
	L8_162.tp = 1
	_ENV.new_red_point(L8_162)
	local L9_163 = L9_163
	L9_163(L0_0.redpoint_id_list, "pve_tab_red_point_no_parent")
	L9_163 = {}
	L9_163.parent_ids, ({})[1] = {}, "main_btn_entrance"
	L9_163.parent_ids, ({})[2] = {}, "pve_tab_red_point_no_parent"
	L9_163.id = "pve_tab_red_point"
	L9_163.tp = 1
	_ENV.new_red_point(L9_163)
	local L10_164 = L10_164
	L10_164(L0_0.redpoint_id_list, "pve_tab_red_point")
	L10_164 = {}
	L10_164.id = "main_btn_bookmark"
	L10_164.tp = 1
	_ENV.new_red_point(L10_164)
	local L11_165 = L11_165
	L11_165(L0_0.redpoint_id_list, "main_btn_bookmark")
	L11_165 = {}
	L11_165.parent_ids, ({})[1] = {}, "main_view_pop_btn"
	L11_165.id = "main_view_rating_add_btn"
	L11_165.tp = 1
	;({}).cb = function(A0_170, A1_171)
		local L2_172
		L2_172 = Game
		L2_172 = L2_172.module
		L2_172 = L2_172.score
		if not _ENV.is_open(_UPVALUE1_.type.grow_up_redpoint_btn) then
			return 0
		end
		local L4_174 = L4_174
		local L5_175 = L5_175
		local L4_174, L6_176 = L4_174(L5_175, "number", 0), L6_176
		if L4_174 == 1 then
			L4_174 = 0
			return L4_174
		end
		L4_174 = L2_172.get_score_rating_add_redpoint_num
		L4_174, L5_175 = L4_174()
		return L4_174
	end
	;({}).is_green = true
	L11_165.point_cb_infos, ({})[1] = {}, {}
	_ENV.new_red_point(L11_165)
	local L12_166 = L12_166
	L12_166(L0_0.redpoint_id_list, "main_view_rating_add_btn")
	L12_166 = {}
	L12_166.id = "update_version_red_point"
	L12_166.tp = 1
	;({}).cb = function()
		local L0_177, L1_178
		L0_177 = _ENV
		L0_177 = L0_177.need_hot_update
		if L0_177 then
			L0_177 = 1
			return L0_177
		end
		L0_177 = 0
		return L0_177
	end
	L12_166.point_cb_infos, ({})[1] = {}, {}
	_ENV.new_red_point(L12_166)
	local L13_167 = L13_167
	local L14_168 = L14_168
	L13_167(L14_168, "update_version_red_point")
	local L15_169 = L15_169
end
function L0_0.setup_events()
	L4_183 = _ENV.has_setup
	if L4_183 then
		return
	end
	L4_183 = _ENV
	L4_183.has_setup = true
	L4_183 = _ENV
	;({}).update_new_day = _ENV.on_update_new_day
	;({})[_UPVALUE1_.event.update_item] = _ENV.on_open_func_event_update_item
	;({})[_UPVALUE1_.event.update_all] = _ENV.on_open_func_event_update_all
	;({}).update_red_point = _ENV.tag_update_red_point_order
	L4_183.event_handler, ({}).task_update_daily_liveness_info = {}, _ENV.tag_update_red_point_order
	L4_183 = pairs
	L4_183, L1_180, _FOR_ = L4_183(_ENV.event_handler)
	for _FORV_3_, _FORV_4_ in L4_183, L1_180, _FOR_ do
		L24_24.add_listener(_FORV_3_, _FORV_4_)
	end
end
function L0_0.clear_events()
	L2_189 = _ENV.has_setup
	if not L2_189 then
		return
	end
	L2_189 = _ENV
	L2_189.has_setup = false
	L2_189 = pairs
	L3_190 = _ENV
	L3_190 = L3_190.event_handler
	L2_189, L3_190, L4_191 = L2_189(L3_190)
	for _FORV_3_, _FORV_4_ in L2_189, L3_190, L4_191 do
		L24_24.remove_listener(_FORV_3_, _FORV_4_)
		local L7_194 = L7_194
	end
end
function L0_0.clear_red_point()
	local L0_195, L1_196, L2_197, L3_198
	L0_195 = 1
	L1_196 = _ENV
	L1_196 = L1_196.redpoint_id_list
	L1_196 = #L1_196
	L2_197 = 1
	for L3_198 = L0_195, L1_196, L2_197 do
		local L4_199 = L4_199
		local L5_200 = L5_200
		L4_199(L5_200, true)
		local L6_201 = L6_201
	end
	L0_195 = _ENV
	L1_196 = {}
	L0_195.redpoint_id_list = L1_196
end
