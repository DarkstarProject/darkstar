-----------------------------------------
-- ID: 5294
-- Hume Rice Cake
-- Enchantment: 60Min, Costume - Hume child (female)
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_COSTUME,118,0,3600);
end;