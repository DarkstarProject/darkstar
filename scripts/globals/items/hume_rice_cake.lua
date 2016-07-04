-----------------------------------------
--    ID: 5294
--    Hume Rice Cake
--    Enchantment: 60Min, Costume - Hume child (female)
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_COSTUME,118,0,3600);
end;