-----------------------------------------
--    ID: 15204
--    Mandragora Beret
--    Enchantment: 60Min, Costume - Mandragora (white)
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