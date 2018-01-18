-----------------------------------------
-- ID: 16182
-- Town Moogle Shield
-- Enchantment: 60Min, Costume - Moogle
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_COSTUME,2308,0,3600);
end;