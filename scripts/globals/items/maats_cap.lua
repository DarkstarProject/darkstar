-----------------------------------------
-- ID: 15194
-- Item: Maats Cap
-- Teleports to Ru'Lude gardens
-----------------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.MAAT,0,1)
end
