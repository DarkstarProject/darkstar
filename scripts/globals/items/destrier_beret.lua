-----------------------------------------
-- ID: 11811
-- Destrier Beret
-- Enchantment: 120Min - Retail Timed
-- Costume: Egg that hatches into Adolescent Chocobo when removed
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume()
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.EGG,1,0,7200)
end