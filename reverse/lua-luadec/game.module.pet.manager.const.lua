-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua2_573512\game.module.pet.manager.const_7110416959179061418.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.const
l_0_1.sepcial_pet_race = 2
l_0_1.god_pet_race = 1
l_0_1.rare_pet_race = 2
l_0_1.rare_pet_race_2 = 3
local l_0_2 = {}
l_0_2[1] = "\231\136\134\229\143\145"
l_0_2[2] = "\229\133\139\230\128\170"
l_0_2[3] = "\231\169\191\233\152\178"
l_0_2[4] = "\229\135\143\228\188\164"
l_0_1.pet_tag_name = l_0_2
l_0_2 = {2 = "#0ca738", 3 = "#00a8ff", 4 = "#c455f8", 5 = "#f48a06", 6 = "#e55348", 7 = "#ff69b4"}
l_0_1.pet_name_color = l_0_2
l_0_2 = {1 = "#F06D65", 2 = "#F06D65", 3 = "#47A5E6", 4 = "#EDB222"}
l_0_1.pet_tag_bg_color = l_0_2
l_0_2 = {attr = 1, talent = 2, skill = 3, evolution = 4, equip = 5}
l_0_1.page_type = l_0_2
l_0_2 = {reshape = 1, train = 2}
l_0_1.reshape_page_type = l_0_2
l_0_2 = {train = 1, reshape = 2, up_class = 3}
l_0_1.talent_page_type = l_0_2
l_0_2 = {main_skill = 1, department_skill = 2}
l_0_2.passive_skill = 3
l_0_2.learn_skill = 4
l_0_2.equip_skill = 5
l_0_2.extra_skill = 6
l_0_2.reshape_skill = 7
l_0_2.zhanhou_skill = 8
l_0_2.wangyu_skill = 9
l_0_1.pet_skill_type = l_0_2
l_0_2 = {default = 1, extra = 2}
l_0_1.server_skill_grid_type = l_0_2
l_0_2 = {1 = l_0_1.pet_skill_type.passive_skill, 2 = l_0_1.pet_skill_type.learn_skill, 3 = l_0_1.pet_skill_type.reshape_skill}
l_0_1.server_skill_type = l_0_2
l_0_2 = {yongyou = 1, zhongji = 2, gaoji = 3, chaoji = 4}
l_0_1.skill_learn_page_type = l_0_2
l_0_2 = {putong = 1, zhongji = 2, gaoji = 3, chaoji = 4}
l_0_1.skill_learn_quality_type = l_0_2
l_0_2 = {zhongji = 2, gaoji = 3, chaoji = 4}
l_0_1.skill_quality = l_0_2
local l_0_3 = l_0_1.skill_learn_page_type.zhongji
l_0_3 = l_0_1.skill_learn_page_type
l_0_3 = l_0_3.gaoji
l_0_3 = l_0_1.skill_learn_page_type
l_0_3 = l_0_3.chaoji
l_0_2 = {l_0_3 = l_0_1.skill_quality.zhongji, l_0_3 = l_0_1.skill_quality.gaoji, l_0_3 = l_0_1.skill_quality.chaoji}
l_0_1.skill_learn_page_to_quality = l_0_2
l_0_3 = l_0_1.skill_learn_page_type
l_0_3 = l_0_3.yongyou
local l_0_4 = {}
 -- DECOMPILER ERROR: Unhandled construct in list

 -- DECOMPILER ERROR: Overwrote pending register.

 -- DECOMPILER ERROR: Overwrote pending register.

 -- DECOMPILER ERROR: Overwrote pending register.

l_0_4, l_0_3 = {"pet_xuexi_tabbtn_yiyongyou_00", "pet_xuexi_tabbtn_yiyongyou_01"}, l_0_1.skill_learn_page_type
l_0_3 = l_0_1.skill_learn_page_type
l_0_3 = l_0_3.gaoji
l_0_4 = {"pet_xuexi_tabbtn_gaoji00", "pet_xuexi_abbtn_gaoji01"}
l_0_3 = l_0_1.skill_learn_page_type
l_0_3 = l_0_3.chaoji
l_0_4 = {"pet_xuexi_tabbtn_chaoji00", "pet_xuexi_tabbtn_chaoji01"}
l_0_2 = {l_0_3 = l_0_4, l_0_3 = l_0_4, l_0_3 = l_0_4, l_0_3 = l_0_4}
l_0_1.skill_learn_page_to_page_icon = l_0_2
l_0_3 = l_0_1.skill_learn_page_type
l_0_3 = l_0_3.yongyou
l_0_3 = l_0_1.skill_learn_page_type
l_0_3 = l_0_3.zhongji
l_0_3 = l_0_1.skill_learn_page_type
l_0_3 = l_0_3.gaoji
l_0_3 = l_0_1.skill_learn_page_type
l_0_3 = l_0_3.chaoji
l_0_2 = {l_0_3 = "\229\183\178\230\139\165\230\156\137", l_0_3 = "\228\184\173\231\186\167", l_0_3 = "\233\171\152\231\186\167", l_0_3 = "\232\182\133\231\186\167"}
l_0_1.skill_learn_page_to_page_name = l_0_2
l_0_3 = l_0_1.skill_learn_quality_type
l_0_3 = l_0_3.putong
l_0_3 = l_0_1.skill_learn_quality_type
l_0_3 = l_0_3.zhongji
l_0_3 = l_0_1.skill_learn_quality_type
l_0_3 = l_0_3.gaoji
l_0_3 = l_0_1.skill_learn_quality_type
l_0_3 = l_0_3.chaoji
l_0_2 = {l_0_3 = "\230\153\174\233\128\154", l_0_3 = "\228\184\173\231\186\167", l_0_3 = "\233\171\152\231\186\167", l_0_3 = "\232\182\133\231\186\167"}
l_0_1.skill_learn_quality_to_quality_name = l_0_2
l_0_2 = {had = 1, on_sell = 2, from_activity = 3, sold_out = 4, no_ways = 5}
l_0_1.skill_book_come_from = l_0_2
l_0_2 = {normal = 1, evo = 2, break_through = 3, roll = 4, skill_learn = 5, skill_learn_and_confirm = 6, inherit = 7, reset = 8}
l_0_2.level = 9
l_0_2.class = 10
l_0_2.department = 11
l_0_2.add_point = 12
l_0_2.unlock_point_plan = 13
l_0_2.set_point_plan = 14
l_0_2.change_point_plan = 15
l_0_2.reset_point_plan = 16
l_0_2.change_plan_name = 17
l_0_2.acquire_skill = 18
l_0_2.level_limit_upgrade = 19
l_0_1.pet_data_type = l_0_2
l_0_2 = {new = 1, fight = 2, lock = 3, dispatch = 4}
l_0_1.pet_bit_state = l_0_2
l_0_2 = {first_reset = 1, first_switch = 2}
l_0_1.pet_bit_point = l_0_2
l_0_2 = {_evo = 1, _break = 2}
l_0_1.pet_result_panel_type = l_0_2
l_0_2 = {physical_attack = 1, magic_attack = 2}
l_0_1.pet_attack_type = l_0_2
l_0_2 = {pill_item = 1, amber_item = 19}
l_0_1.item_sub_type = l_0_2
l_0_2 = {1 = "common_grid_0", 2 = "common_grid_1", 3 = "common_grid_2", 4 = "common_grid_3", 5 = "common_grid_4", 6 = "common_grid_5", 7 = "common_grid_6"}
l_0_1.pet_star2img = l_0_2
l_0_2 = {1 = "common_grid_5", 2 = "common_grid_4", 3 = "common_grid_4"}
l_0_1.pet_race_img = l_0_2
l_0_2 = {2 = "common_pet_2green", 3 = "common_pet_2blue", 4 = "common_pet_2purple", 5 = "common_pet_2orange", 6 = "common_pet_2red", 7 = "common_pet_2pink"}
l_0_1.pet_tips_star2fg = l_0_2
l_0_2 = {1 = "common_pet_2red", 2 = "common_pet_2orange", 3 = "common_pet_2orange"}
l_0_1.pet_race_tips_star2fg = l_0_2
l_0_2 = {2 = "\231\187\191\232\137\178", 3 = "\232\147\157\232\137\178", 4 = "\231\180\171\232\137\178", 5 = "\230\169\153\232\137\178", 6 = "\231\186\162\232\137\178", 7 = "\231\178\137\232\137\178"}
l_0_1.pet_star2color_txt = l_0_2
l_0_2 = {2 = "daoju_img2_green", 3 = "daoju_img2_blue", 4 = "daoju_img2_purple", 5 = "daoju_img2_orange", 6 = "daoju_img2_red", 7 = "daoju_img2_pink"}
l_0_1.pet_tips_star2big_fg = l_0_2
l_0_2 = {1 = "daoju_img2_red", 2 = "daoju_img2_orange", 3 = "daoju_img2_orange"}
l_0_1.pet_race_tips_star2big_fg = l_0_2
l_0_2 = {2 = "common_pet_img_green", 3 = "common_pet_img_blue", 4 = "common_pet_img_purple", 5 = "common_pet_img_orange", 6 = "common_pet_img_red", 7 = "common_pet_img_pink"}
l_0_1.pet_star2fg = l_0_2
l_0_2 = {1 = "common_pet_img_red", 2 = "common_pet_img_orange", 3 = "common_pet_img_orange"}
l_0_1.pet_race_fg = l_0_2
l_0_2 = {1 = "common_grid_0", 2 = "common_grid_1", 3 = "common_grid_2", 4 = "common_grid_3", 5 = "common_grid_4", 6 = "common_grid_5", 7 = "common_grid_6"}
l_0_1.pet_head_quality_type = l_0_2
l_0_2 = {1 = "common_grid_5", 2 = "common_grid_4", 3 = "common_grid_4"}
l_0_1.pet_race_head_quality_type = l_0_2
l_0_2 = {1 = "common_grid_xiaohao_null", 2 = "common_grid_xiaohao_1", 3 = "common_grid_xiaohao_2", 4 = "common_grid_xiaohao_3", 5 = "common_grid_xiaohao_4", 6 = "common_grid_xiaohao_5", 7 = "common_grid_xiaohao_6"}
l_0_1.pet_head_quality_type_round = l_0_2
l_0_2 = {1 = "common_grid_xiaohao_5", 2 = "common_grid_xiaohao_4", 3 = "common_grid_xiaohao_4"}
l_0_1.pet_race_head_quality_type_round = l_0_2
l_0_2 = {1 = "pet_icon_xunchangi01", 2 = "pet_icon_shangdeng01", 3 = "pet_icon_hanjian01", 4 = "pet_icon_zhenxi01", 5 = "pet_icon_zhuoyue01", 6 = "pet_icon_jueshi01"}
l_0_1.pet_class_level2fg = l_0_2
l_0_2 = {1 = "pet_icon_xunchangi02", 2 = "pet_icon_shangdeng02", 3 = "pet_icon_hanjian02", 4 = "pet_icon_zhenxi02", 5 = "pet_icon_zhuoyue02", 6 = "pet_icon_jueshi02"}
l_0_1.pet_class_level2label = l_0_2
l_0_2 = {1 = "#5aaf7c", 2 = "#7d98ed", 3 = "#ba85ea", 4 = "#e89b41", 5 = "#f18365", 6 = "#e95858"}
l_0_1.pet_class_level2color = l_0_2
l_0_2 = {1 = "pet_txt_xunchangi01", 2 = "pet_txt_shangdeng01", 3 = "pet_txt_hanjian01", 4 = "pet_txt_zhenxi01", 5 = "pet_txt_zhuoyue01", 6 = "pet_txt_jueshi01"}
l_0_1.pet_class_level2txt_img = l_0_2
l_0_2 = {1 = "pet_icon_younian", 2 = "pet_icon_shengzhang", 3 = "pet_icon_chengshu", 4 = "pet_icon_juexing", 5 = "pet_icon_jiuji"}
l_0_1.pet_stage2label = l_0_2
l_0_2 = {1 = "\229\185\188\229\185\180\230\156\159", 2 = "\231\148\159\233\149\191\230\156\159", 3 = "\230\136\144\231\134\159\230\156\159", 4 = "\232\167\137\233\134\146\230\156\159", 5 = "\231\169\182\230\158\129\230\156\159"}
l_0_1.pet_stage2txt = l_0_2
l_0_2 = {1 = "#5ec546", 2 = "#4292ff", 3 = "#d942ff", 4 = "#ffa200", 5 = "#fe402c"}
l_0_1.pet_stage2bg_color = l_0_2
l_0_2 = {1 = "#5ec546", 2 = "#6d95ef", 3 = "#c468d5", 4 = "#e5af29", 5 = "#f58532", 6 = "#ea5c45"}
l_0_1.pet_class_level2bg_color = l_0_2
l_0_2 = {1 = "\232\137\175\229\165\189", 2 = "\228\188\152\231\167\128", 3 = "\231\168\128\230\156\137", 4 = "\229\141\147\232\182\138", 5 = "\229\143\178\232\175\151", 6 = "\228\188\160\229\165\135"}
l_0_1.pet_class_level2txt = l_0_2
l_0_2 = {2 = "#3f8f3c", 3 = "#4064ca", 4 = "#744bbf", 5 = "#b46a11", 6 = "#d53636", 7 = "#d5369b"}
l_0_1.pet_star_bg_1_color = l_0_2
l_0_3 = 5
l_0_4 = "#fdc44e"
l_0_3 = 6
l_0_4 = "#f9b191"
l_0_3 = 7
l_0_4 = "#ffb6c1"
l_0_2 = {2 = "#7df2a0", 3 = "#74bbf4", 4 = "#c28cfe", l_0_3 = l_0_4, l_0_3 = l_0_4, l_0_3 = l_0_4}
l_0_1.pet_star_bg_2_color = l_0_2
l_0_2 = "toggle_force_quit_key"
l_0_3 = "reshape_view_force_quit_skip_confirm_toggle"
l_0_1[l_0_2] = l_0_3
l_0_2 = "event"
l_0_4 = "list_pet_select"
l_0_4 = "switch_to_pet_subview"
l_0_4 = "update_pet_info"
l_0_4 = "delete_pet_info"
l_0_4 = "list_pet_temp_select_id"
l_0_4 = "list_pet_confirm_evo_material"
l_0_4 = "list_pet_select_resolve_material"
l_0_4 = "show_mainview_pet_model"
l_0_3 = {l_0_4 = "list_pet_select", l_0_4 = "switch_to_pet_subview", l_0_4 = "update_pet_info", l_0_4 = "delete_pet_info", l_0_4 = "list_pet_temp_select_id", l_0_4 = "list_pet_confirm_evo_material", l_0_4 = "list_pet_select_resolve_material", l_0_4 = "show_mainview_pet_model"}
l_0_4 = "show_trainmainview_pet_model"
l_0_3[l_0_4] = "show_trainmainview_pet_model"
l_0_4 = "show_recomment_item_tip"
l_0_3[l_0_4] = "show_recomment_item_tip"
l_0_4 = "list_select_inherit_pet"
l_0_3[l_0_4] = "list_select_inherit_pet"
l_0_4 = "list_pill_select"
l_0_3[l_0_4] = "list_pill_select"
l_0_4 = "list_skill_select"
l_0_3[l_0_4] = "list_skill_select"
l_0_4 = "skill_book_get_from"
l_0_3[l_0_4] = "skill_book_get_from"
l_0_4 = "update_pet_flash_list"
l_0_3[l_0_4] = "update_pet_flash_list"
l_0_4 = "update_pet_equip_red_point"
l_0_3[l_0_4] = "update_pet_equip_red_point"
l_0_4 = "list_flash_select"
l_0_3[l_0_4] = "list_flash_select"
l_0_4 = "list_flash_reset"
l_0_3[l_0_4] = "list_flash_reset"
l_0_4 = "pet_skill_synthesis"
l_0_3[l_0_4] = "pet_skill_synthesis"
l_0_4 = "pet_up_insight_teacher_lv"
l_0_3[l_0_4] = "pet_up_insight_teacher_lv"
l_0_1[l_0_2] = l_0_3
l_0_2 = "pet_equip_type"
l_0_4 = "linghuan"
l_0_4 = "fangju"
l_0_4 = "hufu"
l_0_3 = {l_0_4 = 1, l_0_4 = 2, l_0_4 = 3}
l_0_1[l_0_2] = l_0_3
l_0_2 = "pet_equip_data_type"
l_0_4 = "add"
l_0_4 = 2
l_0_4 = "confirm_roll"
l_0_4 = "extra_roll"
l_0_4 = "confirm_extra_roll"
l_0_4 = "amulet_roll"
l_0_4 = "confirm_amulet_roll"
l_0_4 = "amulet_skill_roll"
l_0_4 = "confirm_amulet_skill_roll"
l_0_4 = "bind"
l_0_4 = "confirm_bind"
l_0_4 = "synthesis"
l_0_3 = {l_0_4 = 1, roll = l_0_4, l_0_4 = 3, l_0_4 = 4, l_0_4 = 5, l_0_4 = 6, l_0_4 = 7, l_0_4 = 8, l_0_4 = 9, l_0_4 = 10, l_0_4 = 11, l_0_4 = 12}
l_0_4 = "take_on"
l_0_3[l_0_4] = 13
l_0_4 = "take_off"
l_0_3[l_0_4] = 14
l_0_1[l_0_2] = l_0_3
l_0_2 = "pet_equip_reshape_type"
l_0_4 = "noraml_reshape"
l_0_4 = "extra_reshape"
l_0_4 = "gaizhuang"
l_0_3 = {l_0_4 = 1, l_0_4 = 2, l_0_4 = 3}
l_0_1[l_0_2] = l_0_3
l_0_2 = "equip_event"
l_0_4 = "select_synthesis_pet_equip"
l_0_4 = "select_bind_pet_equip"
l_0_4 = "update_pet_equip_info"
l_0_4 = "delete_pet_equip_info"
l_0_4 = "update_pet_equip_suit_info"
l_0_3 = {l_0_4 = "select_synthesis_pet_equip", l_0_4 = "select_bind_pet_equip", l_0_4 = "update_pet_equip_info", l_0_4 = "delete_pet_equip_info", l_0_4 = "update_pet_equip_suit_info"}
l_0_1[l_0_2] = l_0_3
l_0_2 = "red_point"
l_0_4 = "pet_equip_item_red_point"
l_0_4 = "pet_skill_red_point"
l_0_4 = "pet_main_train_btn_red_point"
l_0_4 = "pet_attr_toggle_red_point"
l_0_4 = "pet_level_up_red_point"
l_0_4 = "pet_level_toggle_red_point"
l_0_4 = "pet_equip_label_red_point"
l_0_4 = "pet_equip_empty_grid_red_point"
l_0_3 = {l_0_4 = "pet_equip_item_red_point", l_0_4 = "pet_skill_red_point", l_0_4 = "pet_main_train_btn_red_point", l_0_4 = "pet_attr_toggle_red_point", l_0_4 = "pet_level_up_red_point", l_0_4 = "pet_level_toggle_red_point", l_0_4 = "pet_equip_label_red_point", l_0_4 = "pet_equip_empty_grid_red_point"}
l_0_4 = "pet_equip_synthesis_toggle_red_point"
l_0_3[l_0_4] = "pet_equip_synthesis_toggle_red_point"
l_0_4 = "pet_equip_synthesis_view_toggle_red_point"
l_0_3[l_0_4] = "pet_equip_synthesis_view_toggle_red_point"
l_0_4 = "pet_equip_synthesis_label_red_point"
l_0_3[l_0_4] = "pet_equip_synthesis_label_red_point"
l_0_4 = "pet_train_btn_red_point"
l_0_3[l_0_4] = "pet_train_btn_red_point"
l_0_4 = "pet_zizhi_toggle_red_point"
l_0_3[l_0_4] = "pet_zizhi_toggle_red_point"
l_0_4 = "pet_resharp_btn_red_point"
l_0_3[l_0_4] = "pet_resharp_btn_red_point"
l_0_4 = "pet_jinhua_toggle_green_point"
l_0_3[l_0_4] = "pet_jinhua_toggle_green_point"
l_0_4 = "pet_jinhua_btn_green_point"
l_0_3[l_0_4] = "pet_jinhua_btn_green_point"
l_0_4 = "pet_chuzhan_btn_red_point"
l_0_3[l_0_4] = "pet_chuzhan_btn_red_point"
l_0_4 = "pet_resolve_btn_red_point"
l_0_3[l_0_4] = "pet_resolve_btn"
l_0_4 = "pet_flash_btn_green_point"
l_0_3[l_0_4] = "pet_flash_btn_green_point"
l_0_4 = "pet_up_insight_teacher_red_point"
l_0_3[l_0_4] = "pet_up_insight_teacher_red_point"
l_0_1[l_0_2] = l_0_3
l_0_2 = "pet_equip_type_img"
l_0_4 = "pet_equip_type"
l_0_4 = l_0_1[l_0_4]
l_0_4 = l_0_4.linghuan
l_0_4 = "pet_equip_type"
l_0_4 = l_0_1[l_0_4]
l_0_4 = l_0_4.fangju
l_0_4 = "pet_equip_type"
l_0_4 = l_0_1[l_0_4]
l_0_4 = l_0_4.hufu
l_0_3 = {l_0_4 = "pet_tipsgrid_xiangquan", l_0_4 = "pet_tipsgrid_hujia", l_0_4 = "pet_tipsgrid_mengfu"}
l_0_1[l_0_2] = l_0_3
return l_0_1

