-----------------------------------------
--    ID: 5352
--    Phial of spectral Serum
--    Enchantment: 60Min, Costume - ghost
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
    target:addStatusEffect(EFFECT_COSTUME,368,0,3600);
end;