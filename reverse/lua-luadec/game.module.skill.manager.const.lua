-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua7_573533\game.module.skill.manager.const_6256423771080968315.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.const
local l_0_2 = DataConfigs.misc
local l_0_3 = {}
l_0_3.empty_add = 1
l_0_3.empty_txt = 2
l_0_3.empty_book = 3
l_0_1.skill_empty_type = l_0_3
l_0_3 = {me = 1, owner = 2, defender = 3, pet = 4, defender_role = 5, buff_target = 6, buff = 7, random_camp = 8, enemy_all = 9, enemy_random = 10, ally_all = 11, attacker = 12, pet_in = 13, call_owner = 14}
l_0_3.event_trigger = 15
l_0_1.skill_target = l_0_3
l_0_3 = {l_0_1.skill_target.me = "\232\135\170\229\183\177", l_0_1.skill_target.defender = "\229\143\151\229\135\187\230\150\185", l_0_1.skill_target.defender_role = "\229\143\151\229\135\187\230\150\185", l_0_1.skill_target.attacker = "\230\148\187\229\135\187\230\150\185"}
l_0_1.skill_target_name = l_0_3
l_0_3 = {1, 2, 3, 100, 101}
l_0_1.const_skill_poses = l_0_3
l_0_1.skill_id_fight_exchange_pet = 8
l_0_3 = l_0_2.skill_plan_num
l_0_3 = l_0_3.val
l_0_1.skill_plan_num = l_0_3
l_0_1.skill_max_gameplay_num = 2

