-----------------------------------------
-- ID: 15204
-- Mandragora Beret
-- Enchantment: 60Min, Costume - Mandragora (white)
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_COSTUME,28,0,3600);
end;