-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua1_573660\game.module.battle_pass.manager.data.data_-4034539622551295233.bin 

 -- DECOMPILER ERROR: Confused at declaration of local variable

 -- DECOMPILER ERROR: Confused at declaration of local variable

import("..head").data.init = function()
  l_0_1.reset()
end

 -- DECOMPILER ERROR: Confused about usage of registers!

import("..head").data.clear = function()
  l_0_1.reset()
end

 -- DECOMPILER ERROR: Confused about usage of registers!

import("..head").data.reset = function()
  l_0_1.season_id = 0
  l_0_1.reward_group_id = 0
  l_0_1.level = 0
  l_0_1.exp = 0
  l_0_1.week_exp = 0
  l_0_1.week_exp_limit = 0
  l_0_1.is_buy = nil
  l_0_1.normal_level = 0
  l_0_1.advance_level = 0
  l_0_1.end_time = 0
  l_0_1.exp_ratio = 0
  l_0_1.recharge_time = 0
  l_0_1.battle_pass_info = {}
  l_0_1.is_req_common_type = {}
  l_0_1.click_common_type = {}
  l_0_1.common_once_red_point = {}
end

 -- DECOMPILER ERROR: Confused about usage of registers!

import("..head").data.init_info = function(l_4_0)
  if not l_4_0.season_id then
    l_0_1.season_id = l_0_1.season_id
  end
  if not l_4_0.reward_group_id then
    l_0_1.reward_group_id = l_0_1.reward_group_id
  end
  if not l_4_0.level then
    l_0_1.level = l_0_1.level
  end
  if not l_4_0.exp then
    l_0_1.exp = l_0_1.exp
  end
  if l_4_0.is_buy ~= nil then
    l_0_1.is_buy = l_4_0.is_buy
  end
  if not l_4_0.normal_level then
    l_0_1.normal_level = l_0_1.normal_level
  end
  if not l_4_0.advance_level then
    l_0_1.advance_level = l_0_1.advance_level
  end
  if not l_4_0.end_time then
    l_0_1.end_time = l_0_1.end_time
  end
  if not l_4_0.exp_ratio then
    l_0_1.exp_ratio = l_0_1.exp_ratio
  end
  if not l_4_0.week_exp then
    l_0_1.week_exp = l_0_1.week_exp
  end
  if not l_4_0.week_exp_limit then
    l_0_1.week_exp_limit = l_0_1.week_exp_limit
  end
end

 -- DECOMPILER ERROR: Confused about usage of registers!

import("..head").data.init_common_info = function(l_5_0)
  if not l_0_1.battle_pass_info[l_5_0.type] then
    local l_5_1, l_5_2, l_5_3, l_5_4, l_5_5, l_5_6, l_5_7, l_5_8, l_5_9, l_5_10, l_5_11, l_5_12, l_5_13, l_5_14, l_5_15 = {}
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if not l_5_0.type then
    l_5_1.type = l_5_1.type
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if not l_5_0.reward_group_id then
    l_5_1.reward_group_id = l_5_1.reward_group_id
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if not l_5_0.level then
    l_5_1.level = l_5_1.level
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if not l_5_0.exp then
    l_5_1.exp = l_5_1.exp
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_5_0.is_buy ~= nil then
    l_5_1.is_buy = l_5_0.is_buy
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if not l_5_0.normal_level then
    l_5_1.normal_level = l_5_1.normal_level
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if not l_5_0.advance_level then
    l_5_1.advance_level = l_5_1.advance_level
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if not l_5_0.end_time then
    l_5_1.end_time = l_5_1.end_time
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_0_1.battle_pass_info[l_5_0.type] = l_5_1
end

 -- DECOMPILER ERROR: Confused about usage of registers for local variables.


