-----------------------------------------
-- ID: 11320
-- Skeleton Robe
-- Enchantment: 60Min, Costume - Skeleton
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_COSTUME,564,0,3600);
end;