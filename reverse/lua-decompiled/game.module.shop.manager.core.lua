local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35
L0_0 = assert
local L1_1, L40_40, L41_41, L42_42 = pairs, L40_40, L41_41, L42_42
L2_2 = ipairs
L3_3 = table
L3_3 = L3_3.insert
L4_4 = table
L4_4 = L4_4.remove
L5_5 = table
L5_5 = L5_5.sort
L6_6 = string
L6_6 = L6_6.format
L7_7 = math
L7_7 = L7_7.min
L8_8 = GlobalConst
L9_9 = DataConfigs
L10_10 = L9_9.language_define
L11_11 = L9_9.shop
L12_12 = L9_9.shop_class
L13_13 = L9_9.item
L14_14 = L9_9.avatar_item
L15_15 = L9_9.tasks
L16_16 = BroadcastTips
L17_17 = TimeUtils
L18_18 = Game
L18_18 = L18_18.events
L19_19 = Game
L19_19 = L19_19.redpoint_helper
L20_20 = Game
L20_20 = L20_20.server_time
L21_21 = Game
L21_21 = L21_21.module
L21_21 = L21_21.activity_role
L22_22 = L21_21.data
L23_23 = Game
L23_23 = L23_23.module
L23_23 = L23_23.misc
L24_24 = Game
L24_24 = L24_24.module
L24_24 = L24_24.data
L25_25 = Game
L25_25 = L25_25.module
L25_25 = L25_25.recharge
L26_26 = Game
L26_26 = L26_26.module
L26_26 = L26_26.open_func
L27_27 = L26_26.event
L28_28 = Game
L28_28 = L28_28.module
L28_28 = L28_28.advertisement
L29_29 = Game
L29_29 = L29_29.ui_manager
L30_30 = Game
L30_30 = L30_30.module
L30_30 = L30_30.season
L31_31 = Game
L31_31 = L31_31.module
L31_31 = L31_31.common_view
L32_32 = Game
L32_32 = L32_32.module
L32_32 = L32_32.catchup_system
L33_33 = Game
L33_33 = L33_33.module
L33_33 = L33_33.activity_return
L34_34 = Game
L34_34 = L34_34.module
L34_34 = L34_34.task
L35_35 = Game
L35_35 = L35_35.module
L35_35 = L35_35.bag
L40_40 = require
L41_41 = "game.module.tips.view.try_to_cost.core"
L40_40 = L40_40(L41_41)
L41_41 = Game
L41_41 = L41_41.module
L41_41 = L41_41.bag
L41_41 = L41_41.item_type_manager
L42_42 = import
local L42_42, L39_39 = L42_42(".head"), L39_39
L39_39 = L42_42.data
function L42_42.init()
	_ENV.init()
	_UPVALUE1_.init()
	L38_38.setup_events()
	L38_38.init_red_points()
	L38_38.init_black_market()
end
function L42_42.clear()
	_ENV.clear_events()
	_ENV.clear_red_points()
	_UPVALUE1_.clear()
	L39_39.clear()
	_ENV.clear_refresh_timer()
	_ENV.clear_black_market()
end
function L42_42.clear_refresh_timer()
	if _ENV.shop_refresh_timer then
		local L0_43, L1_44 = L0_43, L1_44
		L0_43(L1_44, _ENV.shop_refresh_timer)
		local L2_45 = L2_45
		L0_43 = _ENV
		L0_43.shop_refresh_timer = nil
	end
end
function L42_42.is_shop_open(A0_46, A1_47)
	local L6_52 = _ENV.get_config
	L7_53 = A0_46
	L6_52 = L6_52(L7_53)
	if not L6_52 then
		L7_53 = GameDefine
		L7_53 = L7_53.UNITY_EDITOR
		if L7_53 then
			L7_53 = GameLogger
			L7_53 = L7_53.Error
			L8_54 = "\230\178\161\230\156\137\229\156\168shop\232\161\168\230\137\190\229\136\176id\228\184\186{0}\231\154\132\233\133\141\231\189\174"
			L9_55 = A0_46
			L7_53(L8_54, L9_55)
		end
		L7_53 = false
		return L7_53
	end
	L7_53 = L2_2
	L8_54 = L6_52.open
	L7_53, L8_54, L9_55 = L7_53(L8_54)
	for L10_56, _FORV_7_ in L7_53, L8_54, L9_55 do
		if _FORV_7_[1] == 1 then
			if L23_23.get_world_lvl() < _FORV_7_[2][1] or L23_23.get_world_lvl() > _FORV_7_[2][2] then
				return false
			end
		elseif _FORV_7_[1] == 2 then
			if L24_24.get_player_lv() < _FORV_7_[2][1] or L24_24.get_player_lv() > _FORV_7_[2][2] then
				if L24_24.get_player_lv() < _FORV_7_[2][1] then
					if not L39_39.need_check_player_lv then
					end
					L39_39.need_check_player_lv = {}
					L39_39.need_check_player_lv[_FORV_7_[2][1]] = true
				end
				return false, L24_24.get_player_lv() < _FORV_7_[2][1] and L6_6("\231\142\169\229\174\182\231\173\137\231\186\167\232\190\190\229\136\176%s\229\144\142\228\184\138\230\158\182", _FORV_7_[2][1])
			end
		else
			if _FORV_7_[1] == 3 then
				local L22_68 = L22_68
				if not (L20_20.get_server_time() < L17_17.GetIntervalInTwoTime("1970-01-01 08:00:00", (L6_6("%04d-%02d-%02d %02d:%02d:%02d", _FORV_7_[2][1][1], _FORV_7_[2][1][2], _FORV_7_[2][1][3], _FORV_7_[2][1][4], _FORV_7_[2][1][5], _FORV_7_[2][1][6]))) or L20_20.get_server_time() > L17_17.GetIntervalInTwoTime("1970-01-01 08:00:00", (L6_6("%04d-%02d-%02d %02d:%02d:%02d", _FORV_7_[2][2][1], _FORV_7_[2][2][2], _FORV_7_[2][2][3], _FORV_7_[2][2][4], _FORV_7_[2][2][5], _FORV_7_[2][2][6])))) then
					goto lbl_385
				end
				do return false end
				break -- pseudo-goto
			end
			if L22_68 == 4 then
				if not (_FORV_7_[2] and _FORV_7_[2][1]) or not _FORV_7_[2][2] then
					log_error(L6_6("shop manager: shop_id %d, open type is 4 but no open day info! setting {0,999}!", A0_46))
					;({})[1] = 0
					;({})[2] = 999
				end
				if L20_20.get_server_open_day() < ({})[1] or L20_20.get_server_open_day() > ({})[2] then
					return false, L20_20.get_server_open_day() < ({})[1] and L6_6("\229\188\128\230\156\141\231\172\172%s\229\164\169\228\184\138\230\158\182", ({})[1])
				end
			elseif L22_68 == 5 and not A1_47 then
				if not L22_22.is_activity_open(({})[1]) then
					return false
				end
			elseif L22_68 == 6 then
				if not ({} and type({}) == "table" and 0 < #{}) then
					goto lbl_385
				end
				_FOR_, _FOR_, _FOR_ = L2_2({})
				for _FORV_16_, _FORV_17_ in _FOR_, _FOR_, _FOR_ do
					if L34_34.data.get_task_data_by_id(_FORV_17_) and L34_34.data.get_task_data_by_id(_FORV_17_).status == L34_34.const.task_status.finish then
						break
					end
				end
				if true then
					if L39_39.need_check_task_id then
						_FOR_, _FOR_, _FOR_ = L2_2({})
						for _FORV_16_, _FORV_17_ in _FOR_, _FOR_, _FOR_ do
							L39_39.need_check_task_id[_FORV_17_] = nil
						end
					end
				else
					if not L39_39.need_check_task_id then
					end
					L39_39.need_check_task_id = {}
					_FOR_, _FOR_, _FOR_ = L2_2({})
					for _FORV_16_, _FORV_17_ in _FOR_, _FOR_, _FOR_ do
						L39_39.need_check_task_id[_FORV_17_] = true
					end
					do return false end
					do break end -- pseudo-goto
					if L22_68 == 7 then
						if type({}) == "table" and ({})[1] and ({})[2] then
							if L38_38.get_cur_season_id() < ({})[1] or L38_38.get_cur_season_id() > ({})[2] then
								return false
							end
						elseif type({}) == "number" and L38_38.get_cur_season_id() ~= {} then
							return false
						end
					elseif L22_68 == 11 then
						if {} > L32_32.get_lose_day() or _FORV_7_[3] < L32_32.get_lose_day() then
							return false
						end
					else
						if L22_68 == 12 then
							if L33_33.get_old_return_is_open() then
								goto lbl_385
							end
							do return false end
							break -- pseudo-goto
						end
						if L22_68 == 13 then
							if not L39_39.need_check_group_lv then
							end
							L39_39.need_check_group_lv = {}
							L39_39.need_check_group_lv[{}] = true
							if not ({} > Game.module.star_team.data.get_star_team_lv()) then
								goto lbl_385
							end
							do return false end
							break -- pseudo-goto
						end
						if L22_68 == 14 then
							if not L39_39.shop_dict[A0_46] then
								return false
							end
						elseif L22_68 == 15 and L32_32.get_trigger_time() then
							local L14_60 = L14_60
							;({}).year = ({})[1]
							;({}).month = ({})[2]
							;({}).day = ({})[3]
							;({}).hour = ({})[4]
							;({}).min = ({})[5]
							;({}).sec = ({})[6]
							local L15_61 = L15_61
							;({}).year = _FORV_7_[3][1]
							;({}).month = _FORV_7_[3][2]
							;({}).day = _FORV_7_[3][3]
							;({}).hour = _FORV_7_[3][4]
							;({}).min = _FORV_7_[3][5]
							local ({}).sec, L17_63 = _FORV_7_[3][6], L17_63
							repeat
								if L32_32.get_trigger_time() < os.time({}) or L32_32.get_trigger_time() > os.time({}) then
									return false
								end
							until true
						end
					end
				end
			end
		end
		::lbl_385::
	end
	L7_53 = true
	return L7_53
end
function L42_42.get_shop_info_by_id(A0_69)
	local L1_70
	L1_70 = _ENV
	L1_70 = L1_70.shop_dict
	L1_70 = L1_70[A0_69]
	if L1_70 then
		return L1_70
	end
end
function L42_42.get_shop_item_info_by_id(A0_71)
	local L1_72
	L1_72 = _ENV
	L3_74 = L38_38
	L3_74 = L3_74.get_shop_list
	L3_74, L6_75 = L3_74()
	L1_72, L3_74, L6_75 = L1_72(L3_74, L6_75, L3_74())
	for _FORV_4_, _FORV_5_ in L1_72, L3_74, L6_75 do
		if _FORV_5_.shop_id == A0_71 then
			return _FORV_5_
		end
	end
	L1_72 = nil
	return L1_72
end
function L42_42.get_sorted_shop_items_by_type(A0_76, A1_77)
	local L2_78
	L2_78 = {}
	L6_82 = _ENV
	L7_83 = L38_38
	L7_83 = L7_83.get_shop_list
	L7_83 = L7_83()
	L6_82, L7_83, _FOR_ = L6_82(L7_83, L7_83())
	for _FORV_6_, _FORV_7_ in L6_82, L7_83, _FOR_ do
		local L11_87 = L11_87
		if L11_11.get_config(_FORV_7_.shop_id).type and L11_11.get_config(_FORV_7_.shop_id).type ~= A0_76 then
			break -- pseudo-goto
		end
		if L11_11.get_config(_FORV_7_.shop_id).subtype and A1_77 and L11_11.get_config(_FORV_7_.shop_id).subtype ~= A1_77 then
		elseif not L38_38.is_shop_open(L11_87) then
		else
			local L12_88 = L12_88
			local L13_89 = L13_89
			L3_3(L2_78, _FORV_7_)
			local L14_90 = L14_90
		end
		repeat
		until true
	end
	L6_82 = L5_5
	L7_83 = L2_78
	function L8_84(A0_91, A1_92)
		local L7_98, L8_99, L9_100 = _ENV.is_sold_out, L8_99, L9_100
		L8_99 = A0_91.shop_id
		L7_98 = L7_98(L8_99)
		L8_99 = _ENV
		L8_99 = L8_99.is_sold_out
		L9_100 = A1_92.shop_id
		L8_99 = L8_99(L9_100)
		if L7_98 ~= L8_99 then
			L9_100 = not L7_98
			return L9_100
		end
		L9_100 = L11_11
		L9_100 = L9_100.get_config
		L9_100 = L9_100(A0_91.shop_id)
		local L5_96 = L5_96
		local L5_96, L6_97 = L5_96(A1_92.shop_id), L6_97
		L6_97 = L9_100.sort
		if L6_97 ~= L5_96.sort then
			return L6_97 < L5_96.sort
		end
		return A0_91.shop_id < A1_92.shop_id
	end
	L6_82(L7_83, L8_84)
	return L2_78
end
function L42_42.is_sold_out(A0_101)
	local L4_105 = _ENV.get_shop_info_by_id
	L4_105 = L4_105(A0_101)
	if not L4_105 then
		return false
	end
	if L4_105.number_limit and L4_105.number_limit == 0 then
		return false
	end
	local L2_103 = L2_103
	local L2_103, L3_104 = L2_103(A0_101), L3_104
	if L2_103 then
		L3_104 = L2_103.num
		if L3_104 ~= nil then
			L3_104 = L2_103.num
			if L3_104 ~= 0 then
				goto lbl_31
			end
		end
		L3_104 = false
		return L3_104
	end
	::lbl_31::
	L3_104 = L4_105.number
	if L3_104 then
		L3_104 = L4_105.number
		if not L4_105.number_limit then
		end
		L3_104 = L3_104 >= L2_103.num
	end
	return L3_104
end
function L42_42.get_shop_list(A0_106)
	local L1_107
	local L7_113 = L7_113
	if not A0_106 then
		L1_107 = _ENV
		L1_107 = L1_107.cache_shop_list
		if L1_107 then
			L1_107 = _ENV
			L1_107 = L1_107.cache_shop_list
			return L1_107
		end
	end
	L1_107 = {}
	L7_113 = L11_11
	L7_113 = L7_113.get_all_configs
	L7_113 = L7_113()
	local L3_109 = L20_20.get_server_time()
	L4_110, _FOR_, _FOR_ = L4_110(L7_113)
	for _FORV_7_, _FORV_8_ in L4_110, _FOR_, _FOR_ do
		if _ENV.shop_dict[_FORV_8_.id] then
		end
		if not clone(_ENV.shop_dict[_FORV_8_.id]) then
			if not _ENV.cache_shop_dict[_FORV_8_.id] then
				({}).shop_id = _FORV_8_.id
				;({}).number = 0
			end
			_ENV.cache_shop_dict[_FORV_8_.id] = {}
			_ENV.cache_shop_dict[_FORV_8_.id].remove_flag = nil
		end
		L3_3(L1_107, _ENV.cache_shop_dict[_FORV_8_.id])
	end
	L4_110 = #L1_107
	_FOR_ = -1
	for _FORV_7_ = L4_110, _FOR_, _FOR_ do
		if L7_113[L1_107[_FORV_7_].shop_id].before_id and not L38_38.is_sold_out(L7_113[L1_107[_FORV_7_].shop_id].before_id) then
			L4_4(L1_107, _FORV_7_)
		elseif L7_113[L1_107[_FORV_7_].shop_id].pay_limit and L24_24.get_recharge_num() < L7_113[L1_107[_FORV_7_].shop_id].pay_limit then
			L4_4(L1_107, _FORV_7_)
		elseif L7_113[L1_107[_FORV_7_].shop_id].open_days_limit and L1_107[_FORV_7_].put_time and L3_109 > L1_107[_FORV_7_].put_time + L7_113[L1_107[_FORV_7_].shop_id].open_days_limit * 86400 then
			L4_4(L1_107, _FORV_7_)
		elseif not L38_38.is_shop_open(L1_107[_FORV_7_].shop_id, true) then
			L1_107[_FORV_7_].remove_flag = true
		elseif L7_113[L1_107[_FORV_7_].shop_id] and L7_113[L1_107[_FORV_7_].shop_id].refresh_type and L7_113[L1_107[_FORV_7_].shop_id].refresh_type[1] and L7_113[L1_107[_FORV_7_].shop_id].refresh_type[1] ~= 0 then
			L0_0(L7_113[L1_107[_FORV_7_].shop_id].num, L6_6("shop: shop_id %d \233\153\144\232\180\173, \228\189\134\230\152\175\230\178\161\230\156\137\233\153\144\232\180\173\230\149\176\233\135\143\239\188\129", L1_107[_FORV_7_].shop_id))
			if L38_38.is_sold_out(L1_107[_FORV_7_].shop_id) then
				if L7_113[L1_107[_FORV_7_].shop_id].sold_out_show and L7_113[L1_107[_FORV_7_].shop_id].sold_out_show == 0 then
					L1_107[_FORV_7_].remove_flag = true
				elseif L7_113[L1_107[_FORV_7_].shop_id].sold_out_show and 0 < L7_113[L1_107[_FORV_7_].shop_id].sold_out_show and L38_38.get_sold_out_days(L1_107[_FORV_7_].buy_time) and L38_38.get_sold_out_days(L1_107[_FORV_7_].buy_time) > L7_113[L1_107[_FORV_7_].shop_id].sold_out_show then
					L1_107[_FORV_7_].remove_flag = true
				end
				if L7_113[L1_107[_FORV_7_].shop_id].refresh_type[1] == 5 and L3_109 - L1_107[_FORV_7_].buy_time >= L7_113[L1_107[_FORV_7_].shop_id].refresh_type[2] * 60 then
					L1_107[_FORV_7_].remove_flag = false
					L1_107[_FORV_7_].number = 0
				end
			end
		end
	end
	L4_110 = nil
	L9_115 = L2_2
	L15_121 = L1_107
	L9_115, L15_121, _FOR_ = L9_115(L15_121)
	for _FORV_8_, _FORV_9_ in L9_115, L15_121, _FOR_ do
		L4_110 = L7_7(L4_110, (L38_38.get_shop_item_refresh_time(_FORV_9_))) or L4_110
		if L38_38.get_shop_item_refresh_time(_FORV_9_) and (not L4_110 or not L7_7(L4_110, (L38_38.get_shop_item_refresh_time(_FORV_9_)))) then
			L4_110 = L38_38.get_shop_item_refresh_time(_FORV_9_)
		end
		if L38_38.get_shop_item_on_off_shelf_time(_FORV_9_) then
			if L4_110 then
				if L7_7(L4_110, (L38_38.get_shop_item_on_off_shelf_time(_FORV_9_))) then
					goto lbl_221
					L4_110 = L7_7(L4_110, (L38_38.get_shop_item_on_off_shelf_time(_FORV_9_))) or L4_110
				end
			end
			L4_110 = L38_38.get_shop_item_on_off_shelf_time(_FORV_9_)
		end
		::lbl_221::
	end
	L9_115 = #L1_107
	L15_121 = 1
	L13_119 = -1
	for L14_120 = L9_115, L15_121, L13_119 do
		if L1_107[L14_120].remove_flag then
			L4_4(L1_107, L14_120)
			local L12_118 = L12_118
		end
	end
	L9_115 = L1_107
	L15_121 = L4_110
	return L9_115, L15_121
end
function L42_42.cache_shop_list()
	local L0_122
	local L5_127 = L5_127
	L5_127.cache_shop_list, L0_122 = L38_38.get_shop_list(true)
	L5_127 = L18_18
	L5_127 = L5_127.brocast
	L5_127("shop_refresh")
	L0_122 = L0_122 + 3
	L5_127 = L38_38
	L5_127 = L5_127.clear_refresh_timer
	L5_127()
	L5_127 = L38_38
	local L3_125 = L3_125
	local L4_126 = L4_126
	L3_125 = L3_125(L4_126, L0_122 * 1000, function()
		_ENV.cache_shop_list()
	end)
	L5_127.shop_refresh_timer = L3_125
	L5_127 = _ENV
	L3_125 = L38_38
	L3_125 = L3_125.get_cur_season_id
	L3_125 = L3_125()
	L5_127.cache_season_id = L3_125
end
function L42_42.get_sold_out_days(A0_128)
	local L1_129 = L1_129
	L1_129 = L1_129(A0_128)
	local L2_130 = L2_130
	L2_130 = L2_130("%04d-%02d-%02d 05:00:00", L1_129.Year, L1_129.Month, L1_129.Day)
	local L3_131 = L3_131
	L3_131 = L3_131("1970-01-01 08:00:00", L2_130)
	local L4_132 = L20_20.get_server_time()
	local L5_133 = L5_133
	L5_133 = L5_133(L4_132)
	local L6_134 = L6_134
	local L6_134, L10_138 = L6_134("%04d-%02d-%02d 05:00:00", L5_133.Year, L5_133.Month, L5_133.Day), L10_138
	L10_138 = _ENV
	L10_138 = L10_138.GetIntervalInTwoTime
	local L8_136 = L8_136
	local L10_138, L9_137 = L10_138(L8_136, L6_134), L9_137
	L8_136 = L10_138 - L3_131
	L8_136 = L8_136 / 86400
	if A0_128 < L3_131 then
		L8_136 = L8_136 + 1
	end
	if L4_132 < L10_138 then
		L8_136 = L8_136 - 1
	end
	return L8_136
end
function L42_42.get_shop_item_refresh_time(A0_139)
	local L1_140
	L1_140 = A0_139.shop_id
	local L2_141 = L2_141
	L2_141 = L2_141(L1_140)
	if not (L2_141 and L2_141.refresh_type and L2_141.refresh_type[1]) or L2_141.refresh_type[1] == 0 then
		return nil
	end
	local L3_142 = L20_20.get_server_time()
	local L4_143 = L4_143
	L4_143 = L4_143(L3_142)
	local L5_144 = L5_144
	L5_144 = L5_144("%04d-%02d-%02d 05:00:00", L4_143.Year, L4_143.Month, L4_143.Day)
	local L6_145 = L6_145
	L6_145 = L6_145("1970-01-01 08:00:00", L5_144)
	if L3_142 < L6_145 then
		L6_145 = L6_145 - 86400
	end
	local L7_146 = L7_146
	local L7_146, L8_147 = L7_146(L6_145), L8_147
	L8_147 = L2_141.refresh_type
	L8_147 = L8_147[1]
	if L8_147 == 1 then
		return L6_145 + 86400 - L3_142
	else
		if L8_147 == 2 then
			local L16_155 = L16_155
			if L20_20.get_server_open_time() < L17_17.GetIntervalInTwoTime("1970-01-01 08:00:00", (L6_6("%04d-%02d-%02d 05:00:00", L17_17.getDateTime((L20_20.get_server_open_time())).Year, L17_17.getDateTime((L20_20.get_server_open_time())).Month, L17_17.getDateTime((L20_20.get_server_open_time())).Day))) then
			end
			if L17_17.GetDayOfWeek(L17_17.GetIntervalInTwoTime("1970-01-01 08:00:00", (L6_6("%04d-%02d-%02d 05:00:00", L17_17.getDateTime((L20_20.get_server_open_time())).Year, L17_17.getDateTime((L20_20.get_server_open_time())).Month, L17_17.getDateTime((L20_20.get_server_open_time())).Day))) - 86400) ~= 0 and L17_17.GetDayOfWeek(L17_17.GetIntervalInTwoTime("1970-01-01 08:00:00", (L6_6("%04d-%02d-%02d 05:00:00", L17_17.getDateTime((L20_20.get_server_open_time())).Year, L17_17.getDateTime((L20_20.get_server_open_time())).Month, L17_17.getDateTime((L20_20.get_server_open_time())).Day))) - 86400) ~= 6 then
			else
				if L17_17.GetDayOfWeek(L17_17.GetIntervalInTwoTime("1970-01-01 08:00:00", (L6_6("%04d-%02d-%02d 05:00:00", L17_17.getDateTime((L20_20.get_server_open_time())).Year, L17_17.getDateTime((L20_20.get_server_open_time())).Month, L17_17.getDateTime((L20_20.get_server_open_time())).Day))) - 86400) == 0 then
				end
				local L15_154 = L15_154
				repeat
					if L3_142 >= L17_17.GetIntervalInTwoTime("1970-01-01 08:00:00", (L6_6("%04d-%02d-%02d 05:00:00", L17_17.getDateTime((L20_20.get_server_open_time())).Year, L17_17.getDateTime((L20_20.get_server_open_time())).Month, L17_17.getDateTime((L20_20.get_server_open_time())).Day))) - 86400 + (8 - 7) * 86400 then
						break -- pseudo-goto
					end
					L16_155 = true
				until true
			end
			L15_154 = L17_17
			L15_154 = L15_154.GetDayOfWeek
			L15_154 = L15_154(L6_145)
			if L15_154 == 0 then
				L15_154 = 7
			end
			if L16_155 then
			end
			do return L6_145 + (8 - L15_154 + 7) * 86400 - L3_142 end
			break -- pseudo-goto
		end
		if L8_147 == 3 then
			L16_155 = nil
			L15_154 = L7_146.Month
			if L15_154 == 12 then
				L15_154 = L6_6
				L15_154 = L15_154("%04d-01-01 05:00:00", L7_146.Year + 1)
				L16_155 = L15_154
			else
				L15_154 = L6_6
				L15_154 = L15_154("%04d-%02d-01 05:00:00", L7_146.Year, L7_146.Month + 1)
				L16_155 = L15_154
			end
			L15_154 = L17_17
			L15_154 = L15_154.GetIntervalInTwoTime
			L15_154 = L15_154("1970-01-01 08:00:00", L16_155)
			do return L15_154 - L3_142 end
			break -- pseudo-goto
		end
		if L8_147 == 5 then
			L16_155 = L2_141.refresh_type
			L16_155 = L16_155[2]
			L15_154 = A0_139.buy_time
			if not L15_154 then
				L15_154 = nil
				return L15_154
			end
			L15_154 = A0_139.buy_time
			L15_154 = L15_154 + L16_155 * 60
			if L3_142 > L15_154 then
				return nil
			end
			return L15_154 - L3_142
		elseif L8_147 == 7 then
			L16_155 = L38_38
			L16_155 = L16_155.get_cur_season_id
			L16_155 = L16_155()
			L15_154 = L30_30
			L15_154 = L15_154.get_season_time_stamp
			local L15_154, L11_150 = L15_154(L16_155 + 1), L11_150
			repeat
				if not L15_154 or L3_142 > L15_154 then
					L11_150 = nil
					return L11_150
				end
				L11_150 = L15_154 - L3_142
				return L11_150
			until true
		end
	end
	L16_155 = nil
	return L16_155
end
function L42_42.get_shop_item_on_off_shelf_time(A0_156)
	local L1_157, L2_158
	L2_158 = A0_156.shop_id
	local L6_162, L13_169, L14_170 = _ENV, L13_169, L14_170
	L6_162 = L6_162.get_config
	L7_163 = L2_158
	L6_162 = L6_162(L7_163)
	L7_163 = L2_2
	L8_164 = L6_162.open
	L7_163, L8_164, L9_165 = L7_163(L8_164)
	for L10_166, L12_168 in L7_163, L8_164, L9_165 do
		L13_169 = L12_168[1]
		L14_170 = L12_168[2]
		if L13_169 == 3 then
			local L23_179 = L23_179
			local L24_180 = L24_180
			L24_180 = L17_17.GetIntervalInTwoTime("1970-01-01 08:00:00", (L6_6("%04d-%02d-%02d %02d:%02d:%02d", L14_170[1][1], L14_170[1][2], L14_170[1][3], L14_170[1][4], L14_170[1][5], L14_170[1][6])))
			break -- pseudo-goto
		end
		if L13_169 == 4 then
			if 5 > L17_17.getDateTime(L23_179).Hour then
			end
			L24_180 = L17_17.GetIntervalInTwoTime("1970-01-01 08:00:00", (L6_6("%04d-%02d-%02d 05:00:00", L17_17.getDateTime(L23_179).Year, L17_17.getDateTime(L23_179).Month, L17_17.getDateTime(L23_179).Day))) - 86400 + (L14_170[1] - L20_20.get_server_open_day()) * 86400
			local L20_176 = L17_17.GetIntervalInTwoTime("1970-01-01 08:00:00", (L6_6("%04d-%02d-%02d 05:00:00", L17_17.getDateTime(L23_179).Year, L17_17.getDateTime(L23_179).Month, L17_17.getDateTime(L23_179).Day))) - 86400 + (L14_170[2] - L20_20.get_server_open_day() + 1) * 86400
		end
		repeat
		until true
		L20_176 = L7_7(L20_176, A0_156.put_time + L6_162.open_days_limit * 86400) or L20_176
		if L6_162.open_days_limit and A0_156.put_time and (not L20_176 or not L7_7(L20_176, A0_156.put_time + L6_162.open_days_limit * 86400)) then
			L20_176 = A0_156.put_time + L6_162.open_days_limit * 86400
		end
		if L24_180 and L23_179 < L24_180 then
			L1_157 = L24_180 - L23_179
		elseif L20_176 and L23_179 < L20_176 then
			L1_157 = L20_176 - L23_179
		end
	end
	return L1_157
end
function L42_42.try_request_recharge(A0_181)
	if _ENV.recharge_time > L20_20.get_server_time() then
		local L3_184 = L3_184
		local L4_185 = L4_185
		local L6_187 = L6_187
		L4_185, L6_187 = L4_185(L6_187, math.ceil(_ENV.recharge_time - L20_20.get_server_time()))
		L3_184(L4_185, L6_187, L4_185(L6_187, math.ceil(_ENV.recharge_time - L20_20.get_server_time())))
		return
	end
	L3_184 = _ENV
	L4_185 = L20_20
	L4_185 = L4_185.get_server_time
	L4_185 = L4_185()
	L4_185 = L4_185 + 5
	L3_184.recharge_time = L4_185
	L3_184 = L25_25
	L3_184 = L3_184.recharge
	L4_185 = A0_181
	L3_184(L4_185)
end
function L42_42.try_to_buy(A0_188, A1_189)
	local L2_190
	repeat
		L2_190 = A0_188.shop_id
		local L7_195, L8_196 = _ENV, L8_196
		L7_195 = L7_195.is_sold_out
		L8_196 = L2_190
		L7_195 = L7_195(L8_196)
		if L7_195 then
			L7_195 = L16_16
			L7_195 = L7_195.broadcast_tips
			L8_196 = L10_10
			L8_196 = L8_196.get_string
			L8_196 = L8_196("TID_shop_sold_out_tip")
			L7_195(L8_196, L8_196("TID_shop_sold_out_tip"))
			return
		end
		L7_195 = _ENV
		L7_195 = L7_195.is_buy_limit
		L8_196 = L2_190
		L7_195, L8_196 = L7_195(L8_196)
		if L7_195 then
			L16_16.broadcast_tips(L8_196)
			return
		end
		local L5_193 = L5_193
		local L5_193, L6_194 = L5_193(L2_190), L6_194
		L6_194 = L5_193.charge_id
		if L5_193.price then
		end
		if L6_194 then
			_ENV.try_request_recharge(L6_194)
		elseif L5_193.ad_id then
			L28_28.show_advert(L5_193.ad_id)
		elseif L5_193.price[1] then
			if A1_189 then
				({}).buy_type = _UPVALUE6_.buy_type.shop
				;({}).shop_info = A0_188
				L29_29.open_view("ShopDressUpBuyView", {})
			else
				local ({}).buy_type, L12_200 = _UPVALUE6_.buy_type.shop, L12_200
				;({}).shop_info = A0_188
				L29_29.open_view("ShopBuyView", {})
				do break end -- pseudo-goto
				local L10_198 = L10_198
				_UPVALUE7_.shop_buy_c2s(L2_190, 1)
				local L11_199 = L11_199
			end
		end
	until true
end
function L42_42.is_buy_limit(A0_201)
	local L4_205 = _ENV.get_config
	L5_206 = A0_201
	L4_205 = L4_205(L5_206)
	L5_206 = L2_2
	L6_207 = L4_205.buy_limit
	L5_206, L6_207, L7_208 = L5_206(L6_207)
	for L8_209, _FORV_6_ in L5_206, L6_207, L7_208 do
		if _FORV_6_[1] == 1 then
			if _FORV_6_[2] > L24_24.get_player_lv() then
				({}).level = _FORV_6_[2]
				return true, L10_10.get_string("ERR_SHOP_LEVEL_LIMIT", {}), (L6_6("<color=#E55348>%d\231\186\167</color>\232\167\163\233\148\129", _FORV_6_[2]))
			end
		elseif _FORV_6_[1] == 2 then
			if not L30_30.data.get_player_info() or not L30_30.data.get_player_info().rank then
			end
			if not nil or not L30_30.data.get_player_info().rank.cup then
			end
			if _FORV_6_[2] > 0 then
				({}).cup = _FORV_6_[2]
				return true, L10_10.get_string("ERR_SHOP_CUP_LIMIT", {}), (L6_6("\230\142\146\228\189\141\232\181\155<color=#E55348>%s</color>\230\157\175\232\167\163\233\148\129", _FORV_6_[2]))
			end
		elseif _FORV_6_[1] == 3 then
			if not Game.module.dungeon_main.is_dungeon_passed(_FORV_6_[2]) then
				if not DataConfigs.dungeon.get_config(_FORV_6_[2]) or not DataConfigs.dungeon.get_config(_FORV_6_[2]).number then
				end
				;({}).dungeon = _FORV_6_[2]
				if not DataConfigs.dungeon.get_config(_FORV_6_[2]) or not DataConfigs.dungeon.get_config(_FORV_6_[2]).number then
				end
				return true, L10_10.get_string("ERR_SHOP_DUNGEON_LIMIT", {}), (L6_6("<color=#E55348>\233\128\154\229\133\179\228\184\187\231\186\191%s</color>\232\167\163\233\148\129", _FORV_6_[2]))
			end
		else
			if _FORV_6_[1] == 5 then
				if not L39_39.collect_list[_FORV_6_[2][1]] then
				end
				if not (_FORV_6_[2][2] > 0) then
					goto lbl_252
				end
				local L17_218 = L17_218
				local L18_219 = L18_219
				do return true, L6_6("\229\134\141\232\142\183\229\190\151%s%s\229\144\142\232\167\163\233\148\129", string.num_to_short_format_by_str(_FORV_6_[2][2] - 0, true, "num_short_format_cur2"), (L35_35.get_item_name(_FORV_6_[2][1]))), (L6_6("\232\142\183\229\190\151<oitem=%s><color=#E55348>%s</color> \232\167\163\233\148\129", _FORV_6_[2][1], (string.num_to_short_format_by_str(_FORV_6_[2][2], true, "num_short_format_cur2")))) end
				local L19_220 = L19_220
				break -- pseudo-goto
			end
			if L17_218 == 7 then
				L19_220 = L38_38
				L19_220 = L19_220.get_cur_season_id
				L19_220 = L19_220()
				if type(L18_219) == "table" and L18_219[1] and L18_219[2] then
					if L19_220 < L18_219[1] or L19_220 > L18_219[2] then
						if not (L19_220 < L18_219[1]) or not L18_219[1] then
						end
						return true, L6_6("\231\172\172%s\232\181\155\229\173\163\229\143\175\232\180\173\228\185\176", L18_219[2]), (L6_6("<color=#E55348>\231\172\172%s\232\181\155\229\173\163</color>\232\167\163\233\148\129", L18_219[2]))
					end
				else
					if type(L18_219) ~= "number" or L19_220 == L18_219 then
						goto lbl_252
					end
					if not (L19_220 + 1 == L18_219) or not "\228\184\139\232\181\155\229\173\163\229\143\175\232\180\173\228\185\176" then
					end
					if not (L19_220 + 1 == L18_219) or not "<color=#E55348>\228\184\139\232\181\155\229\173\163</color>\232\167\163\233\148\129" then
					end
					do return true, L6_6("\231\172\172%s\232\181\155\229\173\163\229\143\175\232\180\173\228\185\176", L18_219), (L6_6("<color=#E55348>\231\172\172%s\232\181\155\229\173\163</color>\232\167\163\233\148\129", L18_219)) end
					do break end -- pseudo-goto
					if L17_218 == 13 then
						L19_220 = Game
						L19_220 = L19_220.module
						L19_220 = L19_220.star_team
						L19_220 = L19_220.data
						L19_220 = L19_220.get_star_team_lv
						L19_220 = L19_220()
						if L18_219 > L19_220 then
							local L13_214 = L13_214
							repeat
								return true, L13_214, (L6_6("\230\152\159\229\155\162\231\173\137\231\186\167<color=#E55348>%s\231\186\167</color>\232\167\163\233\148\129", L18_219))
							until true
						end
					end
				end
			end
		end
		::lbl_252::
	end
	L5_206 = false
	return L5_206
end
function L42_42.get_shop_type_is_open(A0_221)
	local L6_227, L7_228, L8_229 = Game.module, L7_228, L8_229
	L6_227 = L6_227.cloud_data
	L6_227 = L6_227.is_audit_close_for_recharge
	L6_227 = L6_227()
	if L6_227 then
		L7_228 = _ENV
		L7_228 = L7_228.recharge_close_shop_type
		L7_228 = L7_228[A0_221]
		if L7_228 then
			L7_228 = false
			return L7_228
		end
	end
	L7_228 = L12_12
	L7_228 = L7_228.get_config
	L8_229 = A0_221
	L7_228 = L7_228(L8_229)
	L8_229 = L7_228.open_id
	if L8_229 and 0 < L8_229 then
		L9_230 = L26_26
		L9_230 = L9_230.is_open
		return L9_230(L8_229)
	end
	L9_230 = L38_38
	L9_230 = L9_230.is_recharge_shop
	L9_230 = L9_230(A0_221)
	if L9_230 then
		L9_230 = L1_1
		L9_230, L5_226, _FOR_ = L9_230(L7_228.subtype)
		for _FORV_7_, _FORV_8_ in L9_230, L5_226, _FOR_ do
			if _FORV_8_.open_id and _FORV_8_.open_id > 0 then
				if L26_26.is_open(_FORV_8_.open_id) then
					return true
				end
			end
		end
		L9_230 = false
		return L9_230
	end
	L9_230 = true
	return L9_230
end
function L42_42.get_shop_sub_type_is_open(A0_232, A1_233)
	local L5_237 = _ENV.get_shop_type_is_open
	L6_238 = A0_232
	L5_237 = L5_237(L6_238)
	if not L5_237 then
		L5_237 = false
		return L5_237
	end
	L5_237 = L12_12
	L5_237 = L5_237.get_config
	L6_238 = A0_232
	L5_237 = L5_237(L6_238)
	L6_238 = L1_1
	L7_239 = L5_237.subtype
	L6_238, L7_239, L8_240 = L6_238(L7_239)
	for _FORV_6_, _FORV_7_ in L6_238, L7_239, L8_240 do
		if _FORV_7_.sub_id == A1_233 then
			if not _FORV_7_.open_id or _FORV_7_.open_id == 0 then
				return true
			end
			return L26_26.is_open(_FORV_7_.open_id)
		end
	end
	L6_238 = true
	return L6_238
end
function L42_42.is_black_market_shop(A0_243, A1_244)
	local L2_245
	L2_245 = _ENV
	L2_245 = L2_245.shop_type
	L2_245 = L2_245.discount
	L2_245 = A0_243 == L2_245 and A1_244 == 4
	return L2_245
end
function L42_42.is_looks_shop(A0_246)
	local L1_247
	L1_247 = _ENV
	L1_247 = L1_247.shop_type
	L1_247 = L1_247.looks
	L1_247 = A0_246 == L1_247
	return L1_247
end
function L42_42.is_recharge_shop(A0_248)
	local L1_249
	L1_249 = _ENV
	L1_249 = L1_249.shop_type
	L1_249 = L1_249.recharge
	L1_249 = A0_248 == L1_249
	return L1_249
end
function L42_42.is_recharge_diamond_shop(A0_250, A1_251)
	local L2_252
	L2_252 = _ENV
	L2_252 = L2_252.shop_type
	L2_252 = L2_252.recharge
	L2_252 = A0_250 == L2_252 and A1_251 == 2
	return L2_252
end
function L42_42.is_recharge_crystal_shop(A0_253, A1_254)
	local L2_255
	L2_255 = _ENV
	L2_255 = L2_255.shop_type
	L2_255 = L2_255.recharge
	L2_255 = A0_253 == L2_255 and A1_254 == 3
	return L2_255
end
function L42_42.is_recharge_coin_shop(A0_256, A1_257)
	return false
end
function L42_42.is_exchange_point_shop(A0_258, A1_259)
	return false
end
function L42_42.is_auction_shop(A0_260)
	local L1_261
	L1_261 = _ENV
	L1_261 = L1_261.shop_type
	L1_261 = L1_261.auction
	L1_261 = A0_260 == L1_261
	return L1_261
end
function L42_42.is_show_item_classify(A0_262, A1_263)
	local L2_264
	L2_264 = _ENV
	L2_264 = L2_264.item_type
	L2_264 = L2_264.ornament
	if A0_262 == L2_264 then
		L2_264 = true
		return L2_264
	else
		L2_264 = _ENV
		L2_264 = L2_264.item_type
		L2_264 = L2_264.normal
		if A0_262 == L2_264 and (A1_263 == 8 or A1_263 == 9 or A1_263 == 10) then
			L2_264 = true
			return L2_264
		end
	end
	L2_264 = false
	return L2_264
end
function L42_42.get_fashion_point(A0_265)
	local L7_272, L8_273, L9_274, L10_275 = _ENV.get_config, L8_273, L9_274, L10_275
	L8_273 = A0_265
	L7_272 = L7_272(L8_273)
	L8_273 = L14_14
	L9_274 = L7_272.item_id
	L8_273 = L8_273[L9_274]
	L9_274 = L13_13
	L9_274 = L9_274.get_item
	L10_275 = L7_272.item_id
	L9_274 = L9_274(L10_275)
	L10_275 = L9_274.use
	if L10_275 then
		L10_275 = L9_274.use
		L10_275 = L10_275.get_item
		if L10_275 then
			L10_275 = 0
			L11_276 = L1_1
			L11_276, L6_271, _FOR_ = L11_276(L9_274.use.get_item)
			repeat
				for _FORV_8_, _FORV_9_ in L11_276, L6_271, _FOR_ do
					if L14_14[_FORV_9_[1]] and L14_14[_FORV_9_[1]].fashion_point then
						L10_275 = L14_14[_FORV_9_[1]].fashion_point + L10_275
					end
				end
				do return L10_275 end
				do break end -- pseudo-goto
				if L8_273 then
					L10_275 = L8_273.fashion_point
					return L10_275
				end
			until true
		end
	end
	L10_275 = 0
	return L10_275
end
function L42_42.is_trade_shop(A0_277)
	local L1_278
	L1_278 = _ENV
	L1_278 = L1_278.shop_type
	L1_278 = L1_278.trade_shop
	L1_278 = A0_277 == L1_278
	return L1_278
end
function L42_42.trade_shop_try_to_buy(A0_279)
	local L1_280
	repeat
		L1_280 = Game
		local L1_280, L5_284, L6_285, L13_292 = L1_280.module, L5_284, L6_285, L13_292
		L1_280 = L1_280.trade
		L5_284 = L1_280.get_trade_shop_cfg
		L6_285 = A0_279
		L5_284 = L5_284(L6_285)
		if not L5_284 then
			return
		end
		L6_285 = L1_280.get_shop_item_data
		L13_292 = A0_279
		L6_285 = L6_285(L13_292)
		L13_292 = L6_285.number
		if L5_284.stock and L5_284.stock == 1 and L13_292 == 0 then
			_ENV.brocast_lan_tips("TID_trade_system_sell_out_tips")
			return
		end
		if L1_280.is_limit_up_ratio(L6_285) then
			local L11_290 = L11_290
			;({}).content = string.format(L10_10.get_string("TID_trade_system_price_limit_up_confirm"), (L1_280.get_ratio_keep_one_decimal_digit(L1_280.get_trade_shop_price_increase_premium(), 100)))
			;({}).sure_click = function()
				local L0_293 = L0_293
				local L1_294 = L1_294
				;({}).buy_type = _UPVALUE1_.buy_type.trade_shop
				local ({}).shop_id, L3_296 = A0_279, L3_296
				L0_293(L1_294, L3_296)
			end
			L31_31.confirm({})
			local L12_291 = L12_291
			break -- pseudo-goto
		end
		local ({}).buy_type, L10_289 = _UPVALUE4_.buy_type.trade_shop, L10_289
		;({}).shop_id = A0_279
		L10_289("ShopBuyView", {})
	until true
end
function L42_42.get_cur_season_id()
	local L1_298 = _ENV.data
	L1_298 = L1_298.get_player_info
	L1_298 = L1_298()
	if not L1_298 or not L1_298.season_id then
	end
	return 0
end
function L42_42.get_item_is_owned(A0_299, A1_300)
	local L3_301, L4_302 = L3_301, L4_302
	local L5_303 = L5_303
	do return L4_302(L5_303, A0_299, A1_300) end
	local L6_304 = L6_304
end
function L42_42.get_item_is_part_owned(A0_305, A1_306)
	local L3_307, L4_308 = L3_307, L4_308
	local L5_309 = L5_309
	do return L4_308(L5_309, A0_305, A1_306) end
	local L6_310 = L6_310
end
function L42_42.init_red_points()
	L4_315 = _ENV.new_red_point
	;({}).parent_ids, ({})[1] = {}, "main_view_red_point"
	;({}).id = "main_view_shop_btn"
	;({}).tp = 1
	;({}).point_cb_infos = {}
	L4_315({})
	L4_315 = _ENV
	L4_315 = L4_315.new_red_point
	;({}).parent_ids, ({})[1] = {}, "main_view_shop_btn"
	;({}).id = "shop_red_point"
	;({}).tp = 1
	;({}).point_cb_infos = {}
	L4_315({})
	L4_315 = L1_1
	L4_315, _FOR_, _FOR_ = L4_315(L12_12.get_configs())
	for _FORV_3_, _FORV_4_ in L4_315, _FOR_, _FOR_ do
		if _FORV_4_.shop_show and _FORV_4_.shop_show > 0 then
			({}).parent_ids, ({})[1] = {}, "shop_red_point"
			;({}).id = L6_6("shop_type_red_point_%s", _FORV_4_.type)
			;({}).tp = 1
			;({}).cb = function()
				local L0_321 = L0_321
				local L0_321, L1_322 = L0_321(_UPVALUE1_.type), L1_322
				if 0 < L0_321 then
					L0_321 = 1
					return L0_321
				end
				L0_321 = 0
				return L0_321
			end
			;({}).point_cb_infos, ({})[1] = {}, {}
			_ENV.new_red_point({})
		end
	end
	L4_315 = _ENV
	L4_315 = L4_315.new_red_point
	L5_316 = {}
	L9_320 = {}
	L5_316.parent_ids = L9_320
	L5_316.id = "exchange_coin_all"
	L5_316.tp = 1
	L9_320 = {}
	L8_319 = {}
	function L8_319.cb()
		local L0_323 = L0_323
		local L0_323, L1_324 = L0_323(_UPVALUE1_.shop_type.coin), L1_324
		if 0 < L0_323 then
			L0_323 = 1
			return L0_323
		end
		L0_323 = 0
		return L0_323
	end
	L9_320[1] = L8_319
	L5_316.point_cb_infos = L9_320
	L4_315(L5_316)
	L4_315 = _ENV
	L4_315 = L4_315.new_red_point
	L5_316 = {}
	L9_320 = {}
	L5_316.parent_ids = L9_320
	L5_316.id = "exchange_point_all"
	L5_316.tp = 1
	L9_320 = {}
	L8_319 = {}
	function L8_319.cb()
		local L0_325 = L0_325
		local L0_325, L1_326 = L0_325(_UPVALUE1_.shop_type.point), L1_326
		if 0 < L0_325 then
			L0_325 = 1
			return L0_325
		end
		L0_325 = 0
		return L0_325
	end
	L9_320[1] = L8_319
	L5_316.point_cb_infos = L9_320
	L4_315(L5_316)
end
function L42_42.clear_red_points()
	L3_330 = _ENV.destroy_red_point
	L4_331 = "main_view_shop_btn"
	L3_330(L4_331, true)
	L3_330 = _ENV
	L3_330 = L3_330.destroy_red_point
	L4_331 = "shop_red_point"
	L3_330(L4_331, true)
	L3_330 = L1_1
	L4_331 = L12_12
	L4_331 = L4_331.get_configs
	L4_331 = L4_331()
	L3_330, L4_331, _FOR_ = L3_330(L4_331, L4_331())
	for _FORV_3_, _FORV_4_ in L3_330, L4_331, _FOR_ do
		if _FORV_4_.shop_show and _FORV_4_.shop_show > 0 then
			_ENV.destroy_red_point(L6_6("shop_type_red_point_%s", _FORV_4_.type), true)
		end
	end
	L3_330 = _ENV
	L3_330 = L3_330.destroy_red_point
	L4_331 = "exchange_coin_all"
	L5_332 = true
	L3_330(L4_331, L5_332)
	L3_330 = _ENV
	L3_330 = L3_330.destroy_red_point
	L4_331 = "exchange_point_all"
	L5_332 = true
	L3_330(L4_331, L5_332)
end
function L42_42.update_shop_red_points()
	L4_340 = L12_12
	L4_340 = L4_340.get_configs
	L4_340 = L4_340()
	L3_339, L4_340, _FOR_ = L3_339(L4_340, L4_340())
	for _FORV_3_, _FORV_4_ in L3_339, L4_340, _FOR_ do
		if _FORV_4_.shop_show and _FORV_4_.shop_show > 0 then
			local L8_344 = L8_344
			L8_344(L6_6("shop_type_red_point_%s", _FORV_4_.type))
		end
	end
	L3_339 = L18_18
	L3_339 = L3_339.brocast
	L4_340 = "update_shop_red_point"
	L3_339(L4_340)
end
function L42_42.set_cache_shop_red_point(A0_345)
	local L5_350 = L5_350
	if A0_345 then
		L5_350 = _ENV
		L5_350 = L5_350.cache_shop_red_point
		L5_350 = L5_350[A0_345]
		if not L5_350 then
			goto lbl_10
		end
	end
	L5_350 = false
	do return L5_350 end
	::lbl_10::
	L5_350 = L11_11
	L5_350 = L5_350.get_config
	L6_351 = A0_345
	L5_350 = L5_350(L6_351)
	if not L5_350 then
		L6_351 = false
		return L6_351
	end
	L6_351 = L5_350.is_red_point
	if L6_351 then
		L6_351 = type
		L6_351 = L6_351(L5_350.is_red_point)
		if L6_351 == "table" then
			L6_351 = next
			L6_351 = L6_351(L5_350.is_red_point)
			if L6_351 then
				L6_351 = L2_2
				L6_351, _FOR_, _FOR_ = L6_351(L5_350.is_red_point)
				for _FORV_5_, _FORV_6_ in L6_351, _FOR_, _FOR_ do
					if not L26_26.is_open(_FORV_6_[1]) then
						return false
					end
				end
			end
		end
	end
	L6_351 = L38_38
	L6_351 = L6_351.is_buy_limit
	L8_353 = A0_345
	L6_351 = L6_351(L8_353)
	if L6_351 then
		L8_353 = false
		return L8_353
	end
	L8_353 = _ENV
	L8_353 = L8_353.cache_shop_red_point
	L8_353[A0_345] = true
	L8_353 = true
	return L8_353
end
function L42_42.update_cache_shop_red_point()
	_ENV.update_red_point("exchange_point_all")
	_ENV.update_red_point("exchange_coin_all")
	local L1_354 = L1_354
	L1_354 = L38_38
	L1_354 = L1_354.update_shop_red_points
	L1_354()
end
function L42_42.get_shop_type_red_point(A0_355)
	local L5_360, L6_361 = _ENV.get_config, L6_361
	L6_361 = A0_355
	L5_360 = L5_360(L6_361)
	L6_361 = L5_360.shop_show
	if L6_361 == 0 then
		L6_361 = 0
		return L6_361
	end
	L6_361 = L38_38
	L6_361 = L6_361.get_shop_type_is_open
	L7_362 = A0_355
	L6_361 = L6_361(L7_362)
	if not L6_361 then
		L7_362 = 0
		return L7_362
	end
	L7_362 = L5_360.subtype
	if L7_362 then
		L7_362 = L1_1
		L7_362, L4_359, _FOR_ = L7_362(L5_360.subtype)
		for _FORV_6_, _FORV_7_ in L7_362, L4_359, _FOR_ do
			if 0 < L38_38.get_shop_sub_type_red_point(L5_360.type, _FORV_7_.sub_id) then
				return 1
			end
		end
	end
	L7_362 = 0
	return L7_362
end
function L42_42.get_shop_sub_type_red_point(A0_366, A1_367)
	local L7_373, L8_374, L9_375 = _ENV.get_config, L8_374, L9_375
	L8_374 = A0_366
	L7_373 = L7_373(L8_374)
	L8_374 = L7_373.shop_show
	if L8_374 == 0 then
		L8_374 = 0
		return L8_374
	end
	L8_374 = L38_38
	L8_374 = L8_374.get_shop_type_is_open
	L9_375 = A0_366
	L8_374 = L8_374(L9_375)
	if not L8_374 then
		L9_375 = 0
		return L9_375
	end
	L9_375 = L38_38
	L9_375 = L9_375.is_black_market_shop
	L9_375 = L9_375(A0_366, A1_367)
	if L9_375 then
		L9_375 = L38_38
		L9_375 = L9_375.black_market_has_red_point
		L9_375 = L9_375()
		if L9_375 then
			L9_375 = 1
			if L9_375 then
				goto lbl_34
			end
		end
		L9_375 = 0
		::lbl_34::
		return L9_375
	end
	L9_375 = L38_38
	L9_375 = L9_375.is_recharge_shop
	L9_375 = L9_375(A0_366)
	if L9_375 then
		L9_375 = L38_38
		L9_375 = L9_375.is_recharge_coin_shop
		L9_375 = L9_375(A0_366, A1_367)
		if L9_375 then
			L9_375 = L38_38
			L9_375 = L9_375.get_exchange_red_point
			L9_375 = L9_375(_UPVALUE2_.shop_type.coin)
			if 0 < L9_375 then
				L9_375 = 1
				if L9_375 then
					goto lbl_60
				end
			end
			L9_375 = 0
			::lbl_60::
			return L9_375
		else
			L9_375 = L38_38
			L9_375 = L9_375.is_exchange_point_shop
			L9_375 = L9_375(A0_366, A1_367)
			if L9_375 then
				L9_375 = L38_38
				L9_375 = L9_375.get_exchange_red_point
				L9_375 = L9_375(_UPVALUE2_.shop_type.point)
				if 0 < L9_375 then
					L9_375 = 1
					if L9_375 then
						goto lbl_81
					end
				end
				L9_375 = 0
				::lbl_81::
				return L9_375
			else
				L9_375 = 0
				return L9_375
			end
		end
	end
	L9_375 = L38_38
	L9_375 = L9_375.get_sorted_shop_items_by_type
	L9_375 = L9_375(A0_366, A1_367)
	L5_371, L6_372, _FOR_ = L5_371(L9_375)
	for _FORV_8_, _FORV_9_ in L5_371, L6_372, _FOR_ do
		if 0 < L38_38.get_shop_item_red_point(_FORV_9_) then
			return 1
		end
	end
	L5_371 = 0
	return L5_371
end
function L42_42.get_shop_item_red_point(A0_378)
	local L1_379
	L1_379 = A0_378.shop_id
	local L7_385 = _ENV
	L7_385 = L7_385.get_config
	L7_385 = L7_385(L1_379)
	if not L7_385 then
		return 0
	end
	if not L7_385.is_red_point or type(L7_385.is_red_point) == "number" and L7_385.is_red_point == 0 or type(L7_385.is_red_point) == "table" and not next(L7_385.is_red_point) then
		return 0
	end
	if type(L7_385.is_red_point) == "table" and next(L7_385.is_red_point) then
		_FOR_, _FOR_, _FOR_ = L2_2(L7_385.is_red_point)
		for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
			if not L26_26.is_open(_FORV_7_[1]) then
				return 0
			end
		end
	end
	L9_387 = L39_39
	L9_387 = L9_387.cache_shop_red_point
	L9_387 = L9_387[L1_379]
	if L9_387 then
		L9_387 = type
		L9_387 = L9_387(L7_385.is_red_point)
		if L9_387 == "number" then
			L9_387 = L7_385.is_red_point
			if L9_387 == 1 then
				L9_387 = 0
				return L9_387
		end
		else
			L9_387 = type
			L9_387 = L9_387(L7_385.is_red_point)
			if L9_387 == "table" then
				L9_387 = next
				L9_387 = L9_387(L7_385.is_red_point)
				if L9_387 then
					L9_387 = L2_2
					L9_387, _FOR_, _FOR_ = L9_387(L7_385.is_red_point)
					for _FORV_6_, _FORV_7_ in L9_387, _FOR_, _FOR_ do
						if _FORV_7_[2] == 1 then
							return 0
						end
					end
				end
			end
		end
	end
	L9_387 = L38_38
	L9_387 = L9_387.is_buy_limit
	L9_387 = L9_387(L1_379)
	if L9_387 then
		return 0
	end
	if L38_38.is_sold_out(L1_379) then
		L39_39.set_shop_buy_check_info(L1_379, nil)
		local L6_384 = L6_384
		L6_384 = 0
		do return L6_384 end
		break -- pseudo-goto
	end
	L6_384 = L38_38
	L6_384 = L6_384.check_shop_buy_red_point
	local L6_384, L5_383 = L6_384(L1_379), L5_383
	repeat
		if not L6_384 then
			L6_384 = 0
			return L6_384
		end
	until true
	L6_384 = 1
	return L6_384
end
function L42_42.check_shop_buy_red_point(A0_388)
	local L3_391, L8_396 = _ENV.get_config, L8_396
	L8_396 = A0_388
	L3_391 = L3_391(L8_396)
	L8_396 = true
	if L3_391.price then
	end
	if L3_391.price[1] and L3_391.price[1][1] and L3_391.price[1][2] then
		local L7_395 = L7_395
		L8_396 = L3_391.price[1][2] <= L36_36.get_item_count(L3_391.price[1][1])
	end
	if type(L3_391.is_red_point) == "number" and L3_391.is_red_point == 2 then
		if L8_396 or not L7_395 then
		end
		L39_39.set_shop_buy_check_info(A0_388, nil)
		if not L8_396 then
			return false
		end
	end
	if type(L3_391.is_red_point) == "table" and next(L3_391.is_red_point) then
		L5_393, _FOR_, _FOR_ = L2_2(L3_391.is_red_point)
		for _FORV_7_, _FORV_8_ in L5_393, _FOR_, _FOR_ do
			if _FORV_8_[2] == 2 then
				if L8_396 or not L7_395 then
				end
				L39_39.set_shop_buy_check_info(A0_388, nil)
				if not L8_396 then
					return false
				end
			end
		end
	end
	L5_393 = true
	return L5_393
end
function L42_42.get_exchange_red_point(A0_400)
	local L5_405, L6_406 = _ENV.get_shop_type_is_open, L6_406
	L6_406 = A0_400
	L5_405 = L5_405(L6_406)
	if not L5_405 then
		L6_406 = 0
		return L6_406
	end
	L6_406 = _ENV
	L6_406 = L6_406.get_sorted_shop_items_by_type
	L7_407 = A0_400
	L6_406 = L6_406(L7_407)
	L7_407 = L1_1
	L7_407, L4_404, _FOR_ = L7_407(L6_406)
	for _FORV_6_, _FORV_7_ in L7_407, L4_404, _FOR_ do
		if 0 < _ENV.get_shop_item_red_point(_FORV_7_) then
			return 1
		end
	end
	L7_407 = 0
	return L7_407
end
function L42_42.get_shop_item_is_free(A0_410)
	if _ENV.is_sold_out(A0_410) then
		return false
	end
	if not _ENV.is_shop_open(A0_410) then
		return false
	end
	local L1_411 = L1_411
	L1_411 = L1_411(A0_410)
	if L1_411 then
		return false
	end
	local L2_412 = L2_412
	L2_412 = L2_412(A0_410)
	if not L2_412 then
		if GameDefine.UNITY_EDITOR then
			local L3_413 = L3_413
			local L4_414 = L4_414
			L3_413(L4_414, A0_410)
			local L5_415 = L5_415
		end
		L3_413 = false
		return L3_413
	end
	L3_413 = L2_412.charge_id
	if L3_413 then
		L3_413 = L2_412.charge_id
		if 0 < L3_413 then
			L3_413 = false
			return L3_413
		end
	end
	L3_413 = L2_412.price
	L3_413 = not L3_413
	return L3_413
end
function L42_42.get_free_red_point(A0_416, A1_417)
	local L5_421 = _ENV.get_sorted_shop_items_by_type
	L6_422 = A0_416
	L7_423 = A1_417
	L5_421 = L5_421(L6_422, L7_423)
	L6_422 = L2_2
	L7_423 = L5_421
	L6_422, L7_423, _FOR_ = L6_422(L7_423)
	for _FORV_6_, _FORV_7_ in L6_422, L7_423, _FOR_ do
		if _ENV.get_shop_item_is_free(_FORV_7_.shop_id) then
			return 1
		end
	end
	L6_422 = 0
	return L6_422
end
function L42_42.setup_events()
	local L4_430 = L4_430
	local L5_431 = L5_431
	local L6_432 = L6_432
	local L7_433 = L7_433
	local L8_434 = L8_434
	local L9_435 = L9_435
	local L10_436 = L10_436
	local L11_437 = L11_437
	L5_431[1] = L6_432
	L5_431[2] = L7_433
	L5_431[3] = L8_434
	L5_431[4] = L9_435
	L5_431[5] = L10_436
	L5_431[6] = L11_437
	L5_431[7] = "after_task_info_s2c"
	L5_431[8] = "season_player_info_changed"
	L5_431[9] = "bag_items_changed"
	L5_431[10] = "shop_buy"
	local L5_431[11], L12_438 = "star_team_update_team_lv", L12_438
	L4_430.listen_events = L5_431
	L4_430 = _ENV
	L4_430 = L4_430.has_setup
	if L4_430 then
		return
	end
	L4_430 = _ENV
	L4_430.has_setup = true
	L4_430 = L18_18
	L4_430 = L4_430.add_listeners
	L5_431 = _ENV
	L5_431 = L5_431.listen_events
	L6_432 = _ENV
	L7_433 = false
	L4_430(L5_431, L6_432, L7_433)
end
function L42_42.clear_events()
	if not _ENV.has_setup then
		return
	end
	_ENV.has_setup = false
	local L0_439 = L0_439
	local L1_440 = L1_440
	local L2_441 = L2_441
	L0_439(L1_440, L2_441, false)
	local L3_442 = L3_442
end
function L42_42.on_open_func_event_update_all()
	_ENV.shop_info_c2s()
end
function L42_42.on_open_func_event_update_item_list(A0_443)
	L3_446 = A0_443
	L1_444, L3_446, L4_447 = L1_444(L3_446)
	for L5_448, L6_449 in L1_444, L3_446, L4_447 do
		if L6_449 then
			L9_452 = _ENV
			L10_453 = L12_12
			L10_453 = L10_453.get_configs
			L10_453, L15_458 = L10_453()
			L9_452, L10_453, L15_458 = L9_452(L10_453, L15_458, L10_453())
			for _FORV_9_, _FORV_10_ in L9_452, L10_453, L15_458 do
				if _FORV_10_.open_id == L5_448 then
					L38_38.update_cache_shop_red_point()
					return
				end
			end
			L9_452 = L2_2
			L10_453 = L38_38
			L10_453 = L10_453.get_shop_list
			L10_453, L15_458 = L10_453()
			L9_452, L10_453, L15_458 = L9_452(L10_453, L15_458, L10_453())
			for _FORV_9_, _FORV_10_ in L9_452, L10_453, L15_458 do
				if L11_11.get_config(_FORV_10_.shop_id).is_red_point and type(L11_11.get_config(_FORV_10_.shop_id).is_red_point) == "table" and next(L11_11.get_config(_FORV_10_.shop_id).is_red_point) then
					local _FOR_, _FOR_, _FOR_, L14_457 = L2_2(L11_11.get_config(_FORV_10_.shop_id).is_red_point)
					for _FORV_16_, _FORV_17_ in _FOR_, _FOR_, _FOR_ do
						if _FORV_17_[1] == L5_448 then
							L38_38.update_cache_shop_red_point()
							local L18_459 = L18_459
							return
						end
					end
				end
			end
		end
	end
end
function L42_42.on_update_new_day()
	local _ENV.cache_shop_red_point, L1_461 = {}, L1_461
	L1_461 = _UPVALUE1_
	L1_461 = L1_461.shop_info_c2s
	L1_461()
end
function L42_42.on_player_level_up(A0_462, A1_463)
	local L2_464, L3_465, L4_466
	L2_464 = _ENV
	L2_464 = L2_464.need_check_player_lv
	if not L2_464 then
		return
	end
	L2_464 = A1_463 + 1
	L3_465 = A0_462
	L4_466 = 1
	for _FORV_5_ = L2_464, L3_465, L4_466 do
		if _ENV.need_check_player_lv[_FORV_5_] then
			_UPVALUE1_.shop_info_c2s()
			return
		end
	end
end
function L42_42.on_player_recharge_num_update()
	_ENV.shop_info_c2s()
end
function L42_42.on_task_update_task_info(A0_468)
	if A0_468 then
		L3_471 = _ENV
		L3_471 = L3_471.need_check_task_id
		if L3_471 then
			goto lbl_8
		end
	end
	do return end
	::lbl_8::
	L3_471 = L1_1
	L4_472 = A0_468
	L3_471, L4_472, L5_473 = L3_471(L4_472)
	for _FORV_4_, _FORV_5_ in L3_471, L4_472, L5_473 do
		if _FORV_5_.id then
			if _ENV.need_check_task_id[_FORV_5_.id] then
				_UPVALUE2_.shop_info_c2s()
				break
			end
		end
	end
end
function L42_42.on_after_task_info_s2c(A0_476)
	if A0_476 then
		L3_479 = _ENV
		L3_479 = L3_479.need_check_task_id
		if L3_479 then
			goto lbl_8
		end
	end
	do return end
	::lbl_8::
	L3_479 = L1_1
	L4_480 = _ENV
	L4_480 = L4_480.need_check_task_id
	L3_479, L4_480, L5_481 = L3_479(L4_480)
	for _FORV_4_, _FORV_5_ in L3_479, L4_480, L5_481 do
		if _FORV_5_ then
			if L15_15.get_task_cfg(_FORV_4_) and L15_15.get_task_cfg(_FORV_4_).task_tp == A0_476 then
				_UPVALUE3_.shop_info_c2s()
				break
			end
		end
	end
end
function L42_42.on_season_player_info_changed()
	local L1_484 = L1_484
	if _ENV.get_cur_season_id() ~= L39_39.cache_season_id then
		L1_484 = _UPVALUE2_
		L1_484 = L1_484.shop_info_c2s
		L1_484()
	end
end
function L42_42.check_bag_item(A0_485)
	L3_488 = _ENV.const
	L3_488 = L3_488.bag_type
	L3_488 = L3_488.asset
	if A0_485 ~= L3_488 then
		return
	end
	L3_488 = L39_39
	L3_488 = L3_488.shop_buy_check_info
	if not L3_488 then
		return
	end
	L3_488 = L1_1
	L4_489 = L39_39
	L4_489 = L4_489.shop_buy_check_info
	L3_488, L4_489, L5_490 = L3_488(L4_489)
	for L6_491, L7_492 in L3_488, L4_489, L5_490 do
		if L7_492 then
			local L8_493 = L8_493
			if L7_492[2] <= L36_36.get_item_count(L7_492[1]) then
				L38_38.update_shop_red_points()
				local L9_494 = L9_494
				return
			end
		end
	end
end
function L42_42.on_bag_items_changed(A0_495)
	_ENV.check_bag_item(A0_495)
	local L2_496 = L2_496
end
function L42_42.on_shop_buy(A0_497)
	if not A0_497.shop then
		return
	end
	_ENV.remove_from_shop_car(A0_497.shop)
	L18_18.brocast("update_shop_car")
	local L2_498 = L2_498
end
function L42_42.on_star_team_update_team_lv(A0_499, A1_500)
	local L6_505, L7_506 = _ENV.need_check_group_lv, L7_506
	if not L6_505 then
		return
	end
	if not A0_499 then
		A0_499 = 0
	end
	if not A1_500 then
		A1_500 = 0
	end
	L6_505 = math
	L6_505 = L6_505.max
	L7_506 = A0_499
	L6_505 = L6_505(L7_506, A1_500)
	L7_506 = math
	L7_506 = L7_506.min
	L7_506 = L7_506(A0_499, A1_500)
	L4_503, L5_504, _FOR_ = L4_503(_ENV.need_check_group_lv)
	for _FORV_7_, _FORV_8_ in L4_503, L5_504, _FOR_ do
		if _FORV_7_ >= L7_506 and _FORV_7_ <= L6_505 then
			_UPVALUE2_.shop_info_c2s()
			break
		end
	end
end
return L42_42
