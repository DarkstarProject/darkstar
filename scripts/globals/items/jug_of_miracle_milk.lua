-----------------------------------------
-- ID: 5733
-- Jug of Miracle Milk
-- Enchantment: 60Min, Costume - Chigoe (red)
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.COSTUME,1747,0,3600);
end;