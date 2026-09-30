local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11
L0_0 = Game
L0_0 = L0_0.module
L0_0 = L0_0.open_func
L0_0 = L0_0.const
L1_1 = Game
L1_1 = L1_1.module
L1_1 = L1_1.open_func
L2_2 = BroadcastTips
L3_3 = DataConfigs
L3_3 = L3_3.misc
L4_4 = Game
L4_4 = L4_4.module
L4_4 = L4_4.main_view
L5_5 = Game
L5_5 = L5_5.module
L5_5 = L5_5.welfare
L6_6 = Game
L6_6 = L6_6.module
L6_6 = L6_6.scene_manager
L7_7 = Game
L7_7 = L7_7.events
function L8_8(A0_12, A1_13)
	local L2_14, L3_15, L4_16
	repeat
		L2_14 = Game
		local L2_14, L9_21, L10_22 = L2_14.module, L9_21, L10_22
		L2_14 = L2_14.team
		L3_15 = L2_14.data
		L4_16 = L2_14.const
		L9_21 = L3_15.is_in_team
		L9_21 = L9_21()
		L10_22 = L3_15.get_teammate_count
		L10_22 = L10_22()
		local L7_19 = L3_15.get_team_member_max_count()
		local L8_20 = L3_15.get_team_type_target_args()
		local L11_23 = L11_23
		if L2_14.get_target_module(L8_20):is_show_exit(L11_23) then
			A0_12.txts.team_num:set_text((string.format("%s/%s", L10_22, L7_19)))
			A0_12.txts.team_num2:set_text((string.format("%s/%s", L10_22, L7_19)))
			A0_12.txts.label_01:set_active(false)
			A0_12.txts.label_02:set_active(false)
			A0_12.objs.team_tag:set_active(true)
			A0_12.objs.team_tag2:set_active(true)
			A0_12.objs.exit_node:set_active(true)
			A0_12.objs.fight_node:set_active(false)
			local L15_27 = L15_27
			break -- pseudo-goto
		end
		A0_12.txts.label_01:set_lan_text(A0_12.__data.name)
		A0_12.txts.label_02:set_lan_text(A0_12.__data.name)
		A0_12.txts.label_01:set_active(true)
		A0_12.txts.label_02:set_active(true)
		A0_12.objs.team_tag:set_active(false)
		A0_12.objs.team_tag2:set_active(false)
		A0_12.objs.exit_node:set_active(false)
		local L13_25 = L13_25
		A0_12.objs.fight_node:set_active(true)
		local L14_26 = L14_26
	until true
end
L9_9 = {}
L10_10 = {}
function L11_11()
	if Game.module.newbie_fight_flow.is_in_multi_player_fly_race_flow() then
		_ENV.broadcast_tips("\230\154\130\230\156\170\229\188\128\230\148\190")
		return
	end
	if L4_4.is_sub_panel_show("weapon") then
		return
	end
	L4_4.show_sub_panel("weapon")
	local L1_28 = L1_28
	L1_28("click_bottom_function_entrance", "weapon")
	local L2_29 = L2_29
end
L10_10.click_handler = L11_11
L10_10.redpoint_id = "main_view_bottom_weapon_btn"
L9_9.weapon = L10_10
L10_10 = {}
function L11_11()
	if Game.module.newbie_fight_flow.is_in_multi_player_fly_race_flow() then
		_ENV.broadcast_tips("\230\154\130\230\156\170\229\188\128\230\148\190")
		return
	end
	if L4_4.is_sub_panel_show("alliance") then
		return
	end
	if not L1_1.is_open(L0_0.type.alliance) then
		_ENV.broadcast_tips((L1_1.get_no_open_tips(L0_0.type.alliance)))
		return
	end
	L4_4.show_sub_panel("alliance")
	local L0_30 = L0_30
	local L1_31 = L1_31
	L0_30(L1_31, "alliance")
	local L2_32 = L2_32
end
L10_10.click_handler = L11_11
L10_10.redpoint_id = "main_view_alliance_btn"
L9_9.alliance = L10_10
L10_10 = {}
L10_10.redpoint_id = "main_btn_bookmark"
function L11_11()
	if Game.module.newbie_fight_flow.is_in_multi_player_fly_race_flow() then
		_ENV.broadcast_tips("\230\154\130\230\156\170\229\188\128\230\148\190")
		return
	end
	if L4_4.is_sub_panel_show("skill") then
		return
	end
	L4_4.show_sub_panel("skill")
	local L1_33 = L1_33
	L1_33("click_bottom_function_entrance", "skill")
	local L2_34 = L2_34
end
L10_10.click_handler = L11_11
L9_9.skill = L10_10
L10_10 = {}
L10_10.redpoint_id = "main_btn_entrance"
function L11_11()
	if Game.module.newbie_fight_flow.is_in_multi_player_fly_race_flow() then
		_ENV.broadcast_tips("\230\154\130\230\156\170\229\188\128\230\148\190")
		return
	end
	if L4_4.is_sub_panel_show("entrance") then
		return
	end
	L4_4.show_sub_panel("entrance")
	local L1_35 = L1_35
	L1_35("click_bottom_function_entrance", "entrance")
	local L2_36 = L2_36
end
L10_10.click_handler = L11_11
L9_9.entrance = L10_10
L10_10 = {}
L10_10.redpoint_id = "main_view_bottom_team_btn"
function L11_11(A0_37, A1_38)
	local L2_39, L3_40, L4_41, L5_42, L6_43
	L2_39 = Game
	local L2_39, L9_46, L19_56 = L2_39.module, L9_46, L19_56
	L2_39 = L2_39.team
	L3_40 = L2_39.data
	L4_41 = L2_39.const
	L5_42 = L2_39.network
	L6_43 = L2_39.event
	L9_46 = require
	L19_56 = "game.module.common_view.manager.confirm"
	L9_46 = L9_46(L19_56)
	L19_56 = L2_39.data
	L19_56 = L19_56.get_team_type_target_args
	L19_56 = L19_56()
	local L10_47 = L10_47
	local L11_48 = L11_48
	if _ENV.is_sub_panel_show((L2_39.get_sub_scene_key_by_team_type(L19_56))) then
		if A1_38 then
			if L3_40.is_in_team() then
				if L3_40.get_teammate_count() > 1 then
					if Game.module.newbie_fight_flow.is_in_multi_player_fly_race_flow() then
					else
					end
					;({}).sure_label, ({}).content = "\231\161\174\229\174\154", L11_48:get_exit_node_confirm_content(L10_47)
					;({}).sure_click = function()
						local L1_57 = L1_57
						L1_57(_ENV, L10_47)
						local L2_58 = L2_58
					end
					L9_46.confirm({})
					local L18_55 = L18_55
					break -- pseudo-goto
				end
				L11_48:exit_team(L10_47)
				break -- pseudo-goto
			end
			local L16_53 = L16_53
			L11_48:exit_team(L10_47)
			local L17_54 = L17_54
		end
		repeat
		until true
		return
	end
	L16_53 = _ENV
	L16_53 = L16_53.show_sub_panel
	L17_54 = L18_55
	L16_53(L17_54)
	L16_53 = L7_7
	L16_53 = L16_53.brocast
	L17_54 = "click_bottom_function_entrance"
	L16_53(L17_54, "team")
	L16_53 = Game
	L16_53 = L16_53.module
	L16_53 = L16_53.scene_manager
	L16_53 = L16_53.enter
	L17_54 = "scene"
	;({}).sub_scene_type = L18_55
	L16_53(L17_54, {})
end
L10_10.click_handler = L11_11
L10_10.show_func = L8_8
L11_11 = {}
L11_11.team_update_team_info = L8_8
L11_11.update_team_leave_btn = L8_8
L10_10.event_handler = L11_11
L9_9.team = L10_10
return L9_9
