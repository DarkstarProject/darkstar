-----------------------------------------
--    ID: 15929
--    Goblin Belt
--    Enchantment: 60Min, Costume - Goblin (dagger)
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
    target:addStatusEffect(EFFECT_COSTUME,673,0,3600);
end;