-----------------------------------------
--    ID: 5205
--    Piece of Tarutaru Mochi
--    Enchantment: 60Min, Costume - Tarutaru child (male)
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
    target:addStatusEffect(EFFECT_COSTUME,822,0,3600);
end;