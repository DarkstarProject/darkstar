-----------------------------------------
-- ID: 15299
-- Mandragora Belt
-- Enchantment: 60Min, Costume - Mandragora
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_COSTUME,28,0,3600);
end;