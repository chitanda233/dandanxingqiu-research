-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua3_573410\auto_gen.package_include.config.season_newbie.init_-398093148849730766.bin 

local l_0_0 = import(".head")
import(".body")
local l_0_1 = {}
l_0_1.get_cfg_by_num = function(l_1_0)
  for l_1_4,l_1_5 in pairs(l_0_0) do
    if l_1_5.min <= l_1_0 and l_1_0 <= l_1_5.max then
      return l_1_5
    end
  end
end

l_0_1.get_cfg_by_num_and_lv = function(l_2_0, l_2_1)
  for l_2_5,l_2_6 in pairs(l_0_0) do
    if l_2_6.min <= l_2_0 and l_2_0 <= l_2_6.max and l_2_6.min_lv <= l_2_1 and l_2_1 <= l_2_6.max_lv then
      return l_2_6
    end
  end
end

l_0_1.get_all_cfg = function()
  return l_0_0
end

return l_0_1

