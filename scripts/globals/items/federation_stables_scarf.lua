-----------------------------------------
-- ID: 13181
-- Item: Federation Stables Scarf
-- Teleports to Chocobo Stables (Windurst)
-----------------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.CHOCOWINDURST,0,4)
end