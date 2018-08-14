-----------------------------------------
-- ID: 5203
-- Piece of Hume Mochi
-- Enchantment: 60Min, Costume - Hume child (male)
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume()
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.COSTUME,114,0,3600)
end