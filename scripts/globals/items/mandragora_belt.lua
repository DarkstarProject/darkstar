-----------------------------------------
--    ID: 15299
--    Mandragora Belt
--    Enchantment: 60Min, Costume - Mandragora
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
    target:addStatusEffect(EFFECT_COSTUME,28,0,3600);
end;