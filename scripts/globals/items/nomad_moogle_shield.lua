-----------------------------------------
--    ID: 16183
--    Nomad Moogle Shield
--    Enchantment: 60Min, Costume - Moogle
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
    target:addStatusEffect(EFFECT_COSTUME,2308,0,3600);
end;