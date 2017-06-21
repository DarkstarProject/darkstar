-----------------------------------------
--    ID: 15921
--    Detonator Belt
--    Enchantment: 60Min, Costume - Cluster (Black)
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
    target:addStatusEffect(EFFECT_COSTUME,290,0,3600);
end;