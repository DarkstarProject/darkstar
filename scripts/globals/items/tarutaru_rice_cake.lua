-----------------------------------------
-- ID: 5296
-- Tarutaru Rice Cake
-- Enchantment: 60Min, Costume - Tarutaru child (female)
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.COSTUME,823,0,3600);
end;