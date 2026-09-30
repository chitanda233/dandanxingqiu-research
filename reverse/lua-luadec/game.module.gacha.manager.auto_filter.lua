-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua3_573410\game.module.gacha.manager.auto_filter_-860041647448066814.bin 

local l_0_0 = assert(string.format)
local l_0_1 = require("game.module.cloud_data.manager.init")
local l_0_2 = import(".head")
local l_0_3 = Game.module.bag
local l_0_4 = Game.module.open_func
local l_0_5 = l_0_3.data
local l_0_6 = DataConfigs.equip
local l_0_7 = require("rapidjson")
local l_0_8 = l_0_7.encode
local l_0_9 = l_0_7.decode
local l_0_10 = Game.module.equip
l_0_2.get_auto_forge_setting = function()
  if l_0_2.auto_setting_data then
    return l_0_2.auto_setting_data
  end
  local l_1_0 = l_0_1.try_get_val_from_server("auto_resolve")
  local l_1_1 = {}
  if l_1_0 then
    l_1_1 = l_0_9(l_1_0)
  end
  l_0_2.auto_setting_data = l_1_1
  return l_1_1
end

l_0_2.add_auto_equip_setting = function(l_2_0)
  l_0_2.auto_setting_data = l_2_0
  local l_2_1 = l_0_8(l_2_0)
  l_0_1.try_add_val_to_server("auto_resolve", l_2_1)
end

l_0_2.check_equip_auto_resolve = function(l_3_0, l_3_1)
  if not l_3_0 then
    return false
  end
  if not l_0_4.is_open(l_0_4.const.type.resolve_equip_filter) then
    return false
  end
  if not l_0_2.equip_auto_resolve_cache then
    l_0_2.equip_auto_resolve_cache = {}
  end
  if l_0_2.equip_auto_resolve_cache[l_3_0] ~= nil then
    return l_0_2.equip_auto_resolve_cache[l_3_0]
  end
  local l_3_2 = l_0_2.__is_equip_auto_resolve(l_3_0, l_3_1)
  l_0_2.equip_auto_resolve_cache[l_3_0] = l_3_2
  return l_3_2
end

l_0_2.__is_equip_auto_resolve = function(l_4_0, l_4_1)
  local l_4_2 = l_0_2.get_auto_forge_setting()
  local l_4_3 = l_0_5.uid_to_item[l_4_0]
  if not l_4_3 then
    return false
  end
  local l_4_4 = l_0_6.get_equip_cfg(l_4_3.cfg_id)
  if l_4_3.checked_resolve then
    return false
  end
  if not l_4_1 then
    l_4_3.checked_resolve = true
  end
  if not l_4_2 or not l_4_2.pinzhi_data then
    return false
  end
  local l_4_5 = l_4_2.pinzhi_data.id
  if l_4_4.quality < l_4_5 then
    return true
  end
  local l_4_6 = l_4_2.cond1
  local l_4_7 = l_4_2.cond1_l_data.attr_id
  local l_4_8 = l_4_2.cond1_r_data.attr_id
  local l_4_9 = true
  local l_4_10 = true
  if l_4_6 then
    local l_4_11 = false
    local l_4_12 = false
    for l_4_16,l_4_17 in pairs(l_4_3.equip.base_attr) do
      if l_4_7 == l_4_17.attr_type or l_4_7 == -1 then
        l_4_11 = true
      end
      if l_4_8 == l_4_17.attr_type or l_4_8 == -1 then
        l_4_12 = true
      end
    end
    if l_4_3.equip.extra_attr then
      for l_4_21,l_4_22 in pairs(l_4_3.equip.extra_attr) do
        if l_4_7 == l_4_22.attr_type or l_4_7 == -1 then
          l_4_11 = true
        end
        if l_4_8 == l_4_22.attr_type or l_4_8 == -1 then
          l_4_12 = true
        end
      end
    end
    l_4_9 = not l_4_11 or l_4_12
  end
  local l_4_23 = l_4_2.cond2
  local l_4_24 = l_4_2.cond2_l_data.attr_id
  local l_4_25 = l_4_2.cond2_r_data.attr_id
  if l_4_23 then
    local l_4_26 = false
    local l_4_27 = false
    for l_4_31,l_4_32 in pairs(l_4_3.equip.base_attr) do
      if l_4_24 == l_4_32.attr_type or l_4_24 == -1 then
        l_4_26 = true
      end
      if l_4_25 == l_4_32.attr_type or l_4_25 == -1 then
        l_4_27 = true
      end
    end
    if l_4_3.equip.extra_attr then
      for l_4_36,l_4_37 in pairs(l_4_3.equip.extra_attr) do
        if l_4_24 == l_4_37.attr_type or l_4_24 == -1 then
          l_4_26 = true
        end
        if l_4_25 == l_4_37.attr_type or l_4_25 == -1 then
          l_4_27 = true
        end
      end
    end
    l_4_10 = not l_4_26 or l_4_27
  end
  if ((l_4_6 and l_4_9) or (l_4_23 and l_4_10) or (l_4_23 or not not l_4_6)) then
    return true
  end
  return false
end


