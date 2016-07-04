-----------------------------------------
--    ID: 11491
--    Snow bunny Hat +1
--    Enchantment: 60Min, Costume - White Rarab
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
    target:addStatusEffect(EFFECT_COSTUME,270,0,3600);
end;