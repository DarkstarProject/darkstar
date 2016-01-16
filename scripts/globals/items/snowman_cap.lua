-----------------------------------------
--    ID: 10875
--    Snowman Cap
--    Enchantment: 60Min, Costume - Snoll
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
    target:addStatusEffect(EFFECT_COSTUME,279,0,3600);
end;