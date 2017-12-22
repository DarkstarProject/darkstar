-----------------------------------------
-- ID: 15297
-- Rabbit Belt
-- Enchantment: 60Min, Costume - Rarab (brown)
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_COSTUME,268,0,3600);
end;