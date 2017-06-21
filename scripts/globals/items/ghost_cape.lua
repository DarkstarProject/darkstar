-----------------------------------------
--    ID: 16257
--    Ghost Cape
--    Enchantment: 60Min, Costume - Ghost
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
    target:addStatusEffect(EFFECT_COSTUME,368,0,3600);
end;