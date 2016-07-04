-----------------------------------------
--    ID: 15298
--    Worm Belt
--    Enchantment: 60Min, Costume - Worm (orange/brown)
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
    target:addStatusEffect(EFFECT_COSTUME,424,0,3600);
end;