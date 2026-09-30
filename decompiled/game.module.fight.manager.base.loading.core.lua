local L0_0, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7 = L0_0, "game.utils.events", L3_3, L4_4, L5_5, L6_6, L7_7
L0_0 = L0_0(L2_2)
L2_2 = Mathf
L3_3 = IsObjNil
L4_4 = Game
L4_4 = L4_4.module
L4_4 = L4_4.fight
L5_5 = L4_4.ways
L5_5 = L5_5.base
function L6_6(A0_8)
	if A0_8.load_failed == true then
		return
	end
	A0_8.load_failed = true
	print("~~~~~~~!!!!show_asset_nil_alert")
	local L1_9 = L1_9
	L1_9 = L1_9("game.ui.manager.ui_const")
	local L2_10 = L2_10
	L2_10 = L2_10("game.module.common_view.manager.confirm")
	local L3_11 = L3_11
	;({}).hide_cancel = true
	local ({}).layer, L5_13 = L1_9.sorting_layer_type.GuideView, L5_13
	L5_13.content = "\232\181\132\230\186\144\229\138\160\232\189\189\229\188\130\229\184\184\239\188\140\232\175\183\230\163\128\230\159\165\231\189\145\231\187\156\229\144\142\233\135\141\232\175\149\239\188\129"
	L5_13.order = 9999
	function L5_13.sure_click()
		Game.main.restart_application()
	end
	L3_11(L5_13)
end
L5_5.show_asset_nil_alert = L6_6
function L6_6(A0_14)
	repeat
		A0_14:init_loading_data()
		local L4_18, L5_19 = L4_18, L5_19
		A0_14.unit_skin_progress = 0
		A0_14.other_res_progress = 0
		A0_14.audio_process = 0
		A0_14.load_failed = false
		A0_14.other_local_total_progress = 90
		L5_19 = A0_14
		L4_18 = A0_14.is_ugc
		L4_18 = L4_18(L5_19)
		if L4_18 then
			A0_14.other_ugc_total_progress = 50
			L4_18 = A0_14.other_local_total_progress
			L5_19 = A0_14.other_ugc_total_progress
			L4_18 = L4_18 - L5_19
			A0_14.other_local_total_progress = L4_18
			A0_14.other_ugc_progress = 0
			function L4_18(A0_21)
				_ENV.other_ugc_progress = A0_21 * _ENV.other_ugc_total_progress
				_ENV.other_res_progress = _ENV.other_ugc_progress
				_ENV:update_cur_load_progress()
				local L1_22, L2_23 = L1_22, L2_23
			end
			L5_19 = A0_14.load_ugc_res
			L5_19(A0_14, function()
				_ENV(1)
				A0_14:load_local_res()
				local L1_24 = L1_24
			end, function(A0_25)
				log_error("ugc res load fail->>", A0_25)
				local L3_27 = L3_27
				L3_27 = _ENV
				L3_27 = L3_27.show_asset_nil_alert
				L3_27(L3_27)
			end, L4_18)
			local L6_20 = L6_20
			break -- pseudo-goto
		end
		A0_14.other_ugc_progress = 0
		L5_19 = A0_14
		L4_18 = A0_14.load_local_res
		L4_18(L5_19)
	until true
end
L5_5.start_loading = L6_6
function L6_6(A0_28)
	L7_35 = A0_28.timer
	local L3_31, L7_35, L8_36 = A0_28.timer.get_now_pass_ms, L7_35, L8_36
	L3_31 = L3_31(L7_35)
	A0_28.loading_start_time = L3_31
	L7_35 = A0_28
	L3_31 = A0_28.get_fight_need_load_res
	L3_31 = L3_31(L7_35)
	L7_35 = L3_31.need_wait_loaded_count
	L8_36 = 0
	