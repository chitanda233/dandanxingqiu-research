-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua0_573512\auto_gen.package_include.config.season_new.init_8263965664458233357.bin 

local l_0_0 = import(".head")
import(".body")
local l_0_1 = {}
local l_0_2 = {}
l_0_1.get_all = function()
  return l_0_0
end

l_0_1.get_config = function(l_2_0)
  return l_0_0[l_2_0]
end

l_0_1.get_cup_config = function(l_3_0, l_3_1)
  if not l_3_1 then
    return 
  end
  local l_3_2 = l_0_0[l_3_0]
  if not l_3_2 then
    return 
  end
  local l_3_3 = l_3_2.season_reward
  if not l_3_3 then
    return 
  end
  do
    if not l_0_2[l_3_0] then
      local l_3_4, l_3_10, l_3_11, l_3_16, l_3_17 = {}
      l_3_10 = pairs
      l_3_11 = l_3_3
      l_3_10 = l_3_10(l_3_11)
      for l_3_17,l_3_9 in l_3_10 do
         -- DECOMPILER ERROR: Confused at declaration of local variable

        table.insert(l_3_4, )
      end
       -- DECOMPILER ERROR: Confused about usage of registers!

      table.sort(l_3_4, function(l_1_0, l_1_1)
      return l_1_0.id < l_1_1.id
      end)
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  for l_3_15 = 1, #l_3_4 do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_3_1 < l_3_4[l_3_17].id then
      return l_3_4[math.max(1, l_3_17 - 1)]
       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    end
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  return l_3_4[#l_3_4]
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_1.get_next_cup_config = function(l_4_0, l_4_1)
  if not l_4_1 then
    return 
  end
  local l_4_2 = l_0_0[l_4_0]
  if not l_4_2 then
    return 
  end
  local l_4_3 = l_4_2.season_reward
  if not l_4_3 then
    return 
  end
  do
    if not l_0_2[l_4_0] then
      local l_4_4, l_4_10, l_4_11, l_4_16, l_4_17 = {}
      l_4_10 = pairs
      l_4_11 = l_4_3
      l_4_10 = l_4_10(l_4_11)
      for l_4_17,l_4_9 in l_4_10 do
         -- DECOMPILER ERROR: Confused at declaration of local variable

        table.insert(l_4_4, )
      end
       -- DECOMPILER ERROR: Confused about usage of registers!

      table.sort(l_4_4, function(l_1_0, l_1_1)
      return l_1_0.id < l_1_1.id
      end)
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  for l_4_15 = 1, #l_4_4 do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_4_1 < l_4_4[l_4_17].id then
      return l_4_4[l_4_17]
       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    end
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  return l_4_4[#l_4_4]
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

return l_0_1

