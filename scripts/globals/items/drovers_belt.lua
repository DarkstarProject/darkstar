-----------------------------------------
--    ID: 15919
--    Drover's Belt
--    Enchantment: 60Min, Costume - Chigoe (red)
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
    target:addStatusEffect(EFFECT_COSTUME,1747,0,3600);
end;