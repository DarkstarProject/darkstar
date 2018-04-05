-----------------------------------------
-- ID: 11491
-- Snow bunny Hat +1
-- Enchantment: 60Min, Costume - White Rarab
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.COSTUME,270,0,3600);
end;