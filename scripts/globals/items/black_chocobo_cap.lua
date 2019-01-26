-----------------------------------------
-- ID: 25585
-- Black Chocobo Cap
-- Enchantment: "Teleport" (Upper Jeuno Chocobo Stables)
-----------------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.CHOCO_UPPER_JEUNO,0,4)
end
