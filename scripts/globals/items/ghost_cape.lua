-----------------------------------------
-- ID: 16257
-- Ghost Cape
-- Enchantment: 60Min, Costume - Ghost
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.COSTUME,368,0,3600);
end;