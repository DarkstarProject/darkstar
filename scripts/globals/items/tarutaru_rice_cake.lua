-----------------------------------------
--    ID: 5296
--    Tarutaru Rice Cake
--    Enchantment: 60Min, Costume - Tarutaru child (female)
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
    target:addStatusEffect(EFFECT_COSTUME,823,0,3600);
end;