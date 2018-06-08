-----------------------------------------
-- ID: 15860
-- Gyokuto Obi
-- Enchantment: 60Min, Costume - Large Rarab
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.COSTUME,335,0,3600);
end;