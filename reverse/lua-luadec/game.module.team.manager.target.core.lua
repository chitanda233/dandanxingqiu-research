-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.core_7952869425509844944.bin 

local l_0_0 = DataConfigs.team_target
local l_0_1 = import(".head")
local l_0_2 = {}
l_0_1.get_target_module = function(l_1_0)
  if l_0_2[l_1_0] then
    return l_0_2[l_1_0]
  end
  assert(l_1_0)
  local l_1_1 = l_0_0.get_cfg_by_id(l_1_0)
  if not l_0_1.ways[l_1_1.macro_key] then
    local l_1_2, l_1_3, l_1_4, l_1_5 = l_0_1.ways.base
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_1_2:init(l_1_0)
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_0_2[l_1_0] = l_1_2
   -- DECOMPILER ERROR: Confused about usage of registers!

  return l_1_2
end


