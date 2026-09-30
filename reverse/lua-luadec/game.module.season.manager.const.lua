-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua6_573512\game.module.season.manager.const_973065331153122805.bin 

local l_0_0 = import(".head")
local l_0_1 = require("game.ui.manager.ui_manager.init")
local l_0_2 = l_0_0.const
local l_0_3 = {}
l_0_3.common = 1
l_0_3.v3 = 2
l_0_2.season_type = l_0_3
l_0_3 = {pvp = 1, pve = 2, v2 = 3}
l_0_2.cup_type = l_0_3
l_0_3 = {eliminate = 1, evaluation = 2, champion = 3}
l_0_2.v2_stage = l_0_3
l_0_3 = {l_0_2.v2_stage.eliminate = "\230\181\183\233\128\137\232\181\155", l_0_2.v2_stage.evaluation = "\232\128\131\230\160\184\232\181\155", l_0_2.v2_stage.champion = "\229\134\179\232\181\155"}
l_0_2.v2_stage_name = l_0_3
l_0_3 = {l_0_2.v2_stage.eliminate = "83ccff", l_0_2.v2_stage.evaluation = "d1afff", l_0_2.v2_stage.champion = "ffab47"}
l_0_2.v2_stage_color = l_0_3
l_0_3 = {apply = 1, cancel = 0}
l_0_2.v2_champion_apply_option = l_0_3
l_0_3 = {sixteen = 16, eight = 8, four = 4, two = 2, one = 1}
l_0_2.v2_champion_index = l_0_3
l_0_3 = {l_0_2.v2_champion_index.sixteen = "\229\141\129\229\133\173\229\188\186", l_0_2.v2_champion_index.eight = "\229\133\171\229\188\186", l_0_2.v2_champion_index.four = "\229\155\155\229\188\186", l_0_2.v2_champion_index.two = "\228\186\154\229\134\155", l_0_2.v2_champion_index.one = "\229\134\160\229\134\155"}
l_0_2.v2_champion_index_name = l_0_3
l_0_3 = {l_0_2.v2_champion_index.sixteen = 1, l_0_2.v2_champion_index.eight = 2, l_0_2.v2_champion_index.four = 3, l_0_2.v2_champion_index.two = 4, l_0_2.v2_champion_index.one = 5}
l_0_2.v2_champion_index_to_fight_count = l_0_3
l_0_3 = {wait = 0, sixteen = 1, eight = 2, four = 3, two = 4, one = 5}
l_0_2.v2_champion_turn = l_0_3
l_0_3 = {l_0_2.v2_champion_turn.wait = "\231\187\132\233\152\159", l_0_2.v2_champion_turn.sixteen = "16\232\191\1558", l_0_2.v2_champion_turn.eight = "8\232\191\1554", l_0_2.v2_champion_turn.four = "\229\141\138\229\134\179\232\181\155", l_0_2.v2_champion_turn.two = "\229\134\179\232\181\155", l_0_2.v2_champion_turn.one = "\229\134\179\232\181\155"}
l_0_2.v2_champion_turn_name = l_0_3
l_0_2.v2_champion_guess_item_id = 1448010001
l_0_3 = {final = 4}
l_0_2.v2_champion_fight_count = l_0_3
l_0_3 = {l_0_2.v2_champion_turn.wait = 0, l_0_2.v2_champion_turn.sixteen = 1, l_0_2.v2_champion_turn.eight = 2, l_0_2.v2_champion_turn.four = 3, l_0_2.v2_champion_turn.two = 4, l_0_2.v2_champion_turn.one = 5}
l_0_2.v2_champion_turn_to_fight_count = l_0_3
l_0_3 = {A = 1, B = 2}
l_0_2.v2_champion_group = l_0_3
l_0_3 = {l_0_2.v2_champion_group.A = "A", l_0_2.v2_champion_group.B = "B"}
l_0_2.v2_champion_group_name = l_0_3
l_0_3 = {wait = 1, guess = 2, fighting = 3}
l_0_2.v2_champion_turn_status = l_0_3
l_0_3 = {l_0_2.season_type.common = 1, l_0_2.season_type.v3 = 2}
l_0_2.rule_show_type = l_0_3
l_0_3 = {close = 0, open = 1, result = 2}
l_0_2.season_status = l_0_3
l_0_3 = {getted = 0, doing = 1, reached = 2}
l_0_2.award_state = l_0_3
l_0_3 = {normal = 0, up_begin = 1}
l_0_3.up_progress = 2
l_0_3.up_success = 3
l_0_3.up_fail = 4
l_0_3.down_begin = 5
l_0_3.down_progress = 6
l_0_3.down_success = 7
l_0_3.down_fail = 8
l_0_2.result_state = l_0_3
l_0_2.default_rank_id = 103
l_0_3 = {leave = 1, ready = 2, in_fight = 3, matching = 4, in_star = 5, count = 5}
l_0_3[1] = "leave"
l_0_3[2] = "ready"
l_0_3[3] = "in_fight"
l_0_3[4] = "matching"
l_0_3[5] = "in_star"
l_0_2.match_state_name = l_0_3
local l_0_4 = {}
 -- DECOMPILER ERROR: Unhandled construct in list

 -- DECOMPILER ERROR: Overwrote pending register.

l_0_4 = {nil.leave}
l_0_4 = {l_0_2.match_state_name.leave}
l_0_4 = {nil}
l_0_4 = {l_0_2.match_state_name.ready, true}
l_0_4 = {l_0_2.match_state_name.in_fight}
l_0_4 = {l_0_2.match_state_name.in_star}
l_0_4 = {l_0_2.match_state_name.matching}
l_0_2.match_state, l_0_3 = l_0_3, {0 = l_0_4, 1 = l_0_4, 2 = l_0_4, 3 = l_0_4, 4 = l_0_4, 5 = l_0_4, 7 = l_0_4, 99 = l_0_4}
l_0_4 = {name = "\229\174\160\231\137\169", func = function()
  l_0_1.open_view("PetMainView")
end
, open_func_id = 1801}
l_0_4 = {name = "\232\131\140\229\140\133", func = function()
  l_0_1.open_view("BagMainView")
end
}
l_0_3 = {1 = l_0_4, 2 = l_0_4}
l_0_2.path_list = l_0_3
l_0_4 = {type = 2, target = 2}
l_0_4 = {type = 2, target = 1}
l_0_4 = {type = 2, target = 4}
l_0_4 = {type = 3}
l_0_4 = {type = 4}
l_0_4 = {type = 5}
l_0_3 = {four_vs_four = l_0_4, two_vs_two = l_0_4, three_vs_three = l_0_4, dungeon_team = l_0_4, dig_star = l_0_4, pirate_island = l_0_4}
l_0_2.fight_type_target = l_0_3
l_0_4 = {-0.135, 0.434, 0.65}
l_0_4 = {0.5785, 0.496, 0.56}
l_0_4 = {-0.825, 0.495, 0.56}
l_0_4 = {1.246, 0.525, 0.5}
l_0_3 = {1 = l_0_4, 2 = l_0_4, 3 = l_0_4, 4 = l_0_4}
l_0_2.room_model_params = l_0_3
l_0_4 = {0, 0, 0}
l_0_4 = {0, -7, 0}
l_0_4 = {0, 7, 0}
l_0_4 = {0, -14, 0}
l_0_3 = {1 = l_0_4, 2 = l_0_4, 3 = l_0_4, 4 = l_0_4}
l_0_2.room_model_rot_params = l_0_3
local l_0_5 = {}
 -- DECOMPILER ERROR: Unhandled construct in list

 -- DECOMPILER ERROR: Overwrote pending register.

 -- DECOMPILER ERROR: Overwrote pending register.

 -- DECOMPILER ERROR: Overwrote pending register.

l_0_5, l_0_4 = {0, 0, 0}, {10000007 = l_0_5}
l_0_4 = {10000007 = l_0_5}
l_0_5 = {0, 50, 0}
l_0_4 = {10000007 = l_0_5}
l_0_5 = {-10, 100, 0}
l_0_4 = {10000007 = l_0_5}
l_0_3 = {1 = l_0_4, 2 = l_0_4, 3 = l_0_4, 4 = l_0_4}
l_0_2.room_effect_offsets = l_0_3
l_0_3 = {protect_cup = 1, yong_shi = 3, mian_bai = 4, alliance_act = 5, every_day_protect = 6, privilege_protect = 8, astro_protect = 9}
l_0_2.protect_type = l_0_3
l_0_3 = {protect_rank = 1, protect_star = 2, protect_day = 3, del_star = 4, del_rank = 5}
l_0_2.ranked_match_result_type = l_0_3
l_0_3 = {win = 1, join = 2}
l_0_2.activity_reward_type = l_0_3
l_0_3 = {week = 1, season = 2, challenge = 3}
l_0_2.season_task_type = l_0_3
l_0_3 = {air = 100, morph = 101}
l_0_2.special_env = l_0_3
l_0_2.activity_v3_id = 203
l_0_2.season_v2_fight_type_champion = 108
l_0_2.season_v2_fight_type_eliminate = 102
l_0_2.report_list_page_size = 10
l_0_3 = {1 = "season_balance_redpoint_1", 2 = "season_balance_redpoint_2", 3 = "season_balance_redpoint_3"}
l_0_2.season_balance_redpoint = l_0_3

