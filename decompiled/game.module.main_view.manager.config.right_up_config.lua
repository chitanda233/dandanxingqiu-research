local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
L0_0 = Game
local L0_0, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17 = L0_0.module, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17
L0_0 = L0_0.open_func
L0_0 = L0_0.const
L1_1 = L0_0.type
L2_2 = Game
L2_2 = L2_2.module
L2_2 = L2_2.open_func
L2_2 = L2_2.event
L3_3 = Game
L3_3 = L3_3.ui_manager
L4_4 = Game
L4_4 = L4_4.ui_const
L5_5 = Game
L5_5 = L5_5.module
L5_5 = L5_5.open_func
L8_8 = assert
L9_9 = DataConfigs
L9_9 = L9_9.language_define
L8_8 = L8_8(L9_9)
L9_9 = DataConfigs
L9_9 = L9_9.misc
L10_10 = DataConfigs
L10_10 = L10_10.language_define
L11_11 = Game
L11_11 = L11_11.module
L11_11 = L11_11.jump_to
L12_12 = Game
L12_12 = L12_12.module
L12_12 = L12_12.main_view
L12_12 = L12_12.event
L13_13 = Game
L13_13 = L13_13.module
L13_13 = L13_13.main_view
L13_13 = L13_13.const
L14_14 = Game
L14_14 = L14_14.events
L15_15 = {}
L16_16 = {}
L17_17 = L0_0.type
L17_17 = L17_17.daily_task
L16_16.open_func_id = L17_17
function L17_17()
	_ENV.jump_to("TaskDailyView")
	local L1_18 = L1_18
end
L16_16.click_handler = L17_17
L17_17 = {}
L17_17[L2_2.update_item] = function(A0_19, A1_20)
	if A1_20 == _ENV.type.daily_task then
		local L3_21 = L3_21
		L3_21(L12_12.main_view_update_btn, L13_13.right_up_btn.daily)
		local L4_22 = L4_22
	end
end
L16_16.event_handler = L17_17
L16_16.redpoint_id = "daily_task_red_point"
L15_15.daily = L16_16
L16_16 = {}
L17_17 = L1_1.shop
L16_16.open_func_id = L17_17
L16_16.redpoint_id = "main_view_shop_btn"
function L17_17()
	_ENV.open_view("ShopView")
	local L1_23 = L1_23
end
L16_16.click_handler = L17_17
L17_17 = {}
L17_17[L2_2.update_item] = function(A0_24, A1_25)
	if A1_25 == _ENV.shop then
		local L3_26 = L3_26
		L3_26(L12_12.main_view_update_btn, "shop")
		local L4_27 = L4_27
	end
end
L16_16.event_handler = L17_17
L15_15.shop = L16_16
L16_16 = {}
L16_16.redpoint_id = "main_view_welfare_red"
function L17_17()
	_ENV.open_view("WelfareMainView")
	local L1_28 = L1_28
end
L16_16.click_handler = L17_17
function L17_17()
	return Game.module.welfare.is_open()
end
L16_16.check_open_func = L17_17
L17_17 = {}
L17_17[L2_2.update_all] = function()
	local L1_29 = L1_29
	L1_29(L12_12.main_view_update_btn, "welfare")
	local L2_30 = L2_30
end
L17_17[L2_2.update_item] = function()
	local L1_31 = L1_31
	L1_31(L12_12.main_view_update_btn, "welfare")
	local L2_32 = L2_32
end
L16_16.event_handler = L17_17
L15_15.welfare = L16_16
L16_16 = {}
function L17_17()
	return Game.module.game_club.is_community_entry_open()
end
L16_16.check_open_func = L17_17
function L17_17()
	if not Game.module.game_club.is_community_entry_open() then
		return
	end
	local L0_33 = Game.module.game_club.should_only_show_player_group()
	local L1_34 = L1_34
	local L2_35 = L2_35
	;({}).type = 4
	if not L0_33 or not 2 then
	end
	local ({}).index, L4_37 = nil, L4_37
	L4_37.only_show_player_group = L0_33
	L1_34(L2_35, L4_37)
end
L16_16.click_handler = L17_17
L16_16.redpoint_id = "main_game_club_red_point"
L17_17 = {}
L17_17[L2_2.update_item] = function(A0_38, A1_39)
	if A1_39 == _ENV.game_club then
		local L3_40 = L3_40
		L3_40(L12_12.main_view_update_btn, "game_circle")
		local L4_41 = L4_41
	end
end
L16_16.event_handler = L17_17
L15_15.game_circle = L16_16
return L15_15
