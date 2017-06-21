-----------------------------------------
--    ID: 5297
--    Mithran Rice Cake
--    Enchantment: 60Min, Costume - Mithra Child
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
    target:addStatusEffect(EFFECT_COSTUME,182,0,3600);
end;