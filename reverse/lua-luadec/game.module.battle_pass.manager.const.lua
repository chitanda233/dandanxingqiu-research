-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua1_573660\game.module.battle_pass.manager.const_5064127223299831189.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.const
l_0_1.exp_item_id = 1002010009
l_0_1.exp_item_id2 = 1002010013
l_0_1.recharge_cd = 5
local l_0_2 = {}
l_0_2.weapon = 2
l_0_2.equip = 3
l_0_2.level = 301
l_0_1.common_type = l_0_2
l_0_2 = {l_0_1.common_type.weapon, l_0_1.common_type.equip, l_0_1.common_type.level}
l_0_1.init_req_common_type = l_0_2
l_0_2 = {l_0_1.common_type.weapon = "fund_weapon_red_point", l_0_1.common_type.equip = "fund_equip_red_point", l_0_1.common_type.level = "fund_level_red_point"}
l_0_1.common_red_point = l_0_2
l_0_1.common_single_normal = 1
l_0_1.common_single_advance = 2
l_0_2 = {l_0_1.common_type.level, l_0_1.common_type.weapon, l_0_1.common_type.equip}
l_0_1.welfare_fund_type = l_0_2
l_0_2 = {l_0_1.common_type.level = 1, l_0_1.common_type.weapon = 2, l_0_1.common_type.equip = 3}
l_0_1.welfare_fund_type_to_view_index = l_0_2
local l_0_3 = {}
l_0_3.bg_res = "fund_bg1"
l_0_3.title_res = "fund_title1"
local l_0_4 = {}
local l_0_5 = {}
l_0_5.left = "#fdf1ff"
l_0_5.right = "#e3d4fd"
local l_0_6 = {}
l_0_6.left = "#f8e7fc"
l_0_6.right = "#d7caff"
 -- DECOMPILER ERROR: Unhandled construct in list

l_0_3.list_bg_color = l_0_4
l_0_5 = {left = "#f1fff4", right = "#c3f2ca"}
l_0_6 = {left = "#e3f6e2", right = "#b5e4bb"}
l_0_4 = {l_0_5, l_0_6}
l_0_3 = {bg_res = "fund_bg2", title_res = "fund_title2", list_bg_color = l_0_4}
l_0_5 = {left = "#fff1f8", right = "#fdd4fc"}
l_0_6 = {left = "#fce7f2", right = "#facaff"}
l_0_4 = {l_0_5, l_0_6}
l_0_3 = {bg_res = "fund_bg3", title_res = "fund_title3", list_bg_color = l_0_4}
l_0_2 = {1 = l_0_3, 2 = l_0_3, 3 = l_0_3}
l_0_1.welfare_fund_view_config = l_0_2
return l_0_1

