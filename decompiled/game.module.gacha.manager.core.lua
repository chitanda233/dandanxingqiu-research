local L0_0, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L15_15, L16_16, L19_19, L20_20, L21_21, L22_22 = L0_0, string, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L15_15, L16_16, L19_19, L20_20, L21_21, L22_22
L2_2 = L2_2.format
L0_0 = L0_0(L2_2)
L2_2 = Game
L3_3 = L2_2.events
L4_4 = L2_2.redpoint_helper
L5_5 = L2_2.module
L5_5 = L5_5.bag
L6_6 = L5_5.const
L7_7 = L2_2.module
L7_7 = L7_7.open_func
L8_8 = L7_7.const
L9_9 = L7_7.event
L10_10 = L2_2.ui_manager
L11_11 = L2_2.ui_const
L12_12 = L2_2.module
L12_12 = L12_12.activity
L15_15 = L2_2.module
L15_15 = L15_15.cloud_data
L16_16 = require
L19_19 = "game.other.server_time"
L16_16 = L16_16(L19_19)
L19_19 = DataConfigs
L20_20 = L19_19.gacha
L21_21 = L19_19.item
L22_22 = import
L22_22 = L22_22(".head")
function L22_22.init()
	_ENV.init()
	_UPVALUE1_.init()
	L22_22.init_red_points()
	L22_22.setup_events()
	L22_22.register_jump_to()
end
function L22_22.clear()
	_ENV.clear_events()
	_ENV.clear_red_points()
	_UPVALUE1_.clear()
	_UPVALUE2_.clear()
end
