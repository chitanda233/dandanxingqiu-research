local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8
L0_0 = Game
local L0_0, L12_12, L13_13, L14_14 = L0_0.module, L12_12, L13_13, L14_14
L0_0 = L0_0.open_func
L1_1 = L0_0.const
L2_2 = L1_1.type
L3_3 = Game
L3_3 = L3_3.ui_manager
L4_4 = Game
L4_4 = L4_4.ui_const
L5_5 = Game
L5_5 = L5_5.module
L5_5 = L5_5.jump_to
L6_6 = Game
L6_6 = L6_6.module
L6_6 = L6_6.questionnaire
L7_7 = Game
L7_7 = L7_7.module
L7_7 = L7_7.data
L8_8 = Game
L8_8 = L8_8.module
L8_8 = L8_8.chat
L12_12 = require
L13_13 = "game.platform.fnsdk.fnsdk_interface"
L12_12 = L12_12(L13_13)
L13_13 = require
L14_14 = "game.audit.init"
L13_13 = L13_13(L14_14)
L14_14 = {}
;({}).click_handler = function()
	_ENV.open_view("NoticeView")
	local L1_15 = L1_15
end
L14_14.notice, ({}).redpoint_id = {}, "notice_zhu_red_point"
L14_14.settings, ({}).click_handler = {}, function()
	_ENV.open_view("SysSettingMainView")
	local L1_16 = L1_16
end
;({}).open_func_id = L2_2.mail
;({}).click_handler = function()
	_ENV.open_view("MailMainView")
	local L1_17 = L1_17
end
L14_14.mail, ({}).redpoint_id = {}, "main_view_mail_btn"
;({}).open_func_id = L2_2.marriage
;({}).click_handler = function()
	_ENV.jump_to("SocialMarriageView")
	local L1_18 = L1_18
end
L14_14.qingyuan, ({}).redpoint_id = {}, "marriage_red_point"
;({}).check_open_func = function()
	local L1_19
	L1_19 = false
	return L1_19
end
