-----------------------------------------
-- ID: 5350
-- Phial of Volant Serum
-- Enchantment: 60Min, Costume - bat
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.COSTUME,256,0,3600);
end;