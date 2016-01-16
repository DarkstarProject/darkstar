-----------------------------------------
--    ID: 5295
--    Elvaan Rice Cake
--    Enchantment: 60Min, Costume - Elvaan Child (female)
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
    target:addStatusEffect(EFFECT_COSTUME,158,0,3600);
end;