-----------------------------------------
-- ID: 15919
-- Drover's Belt
-- Enchantment: 60Min, Costume - Chigoe (red)
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.COSTUME,1747,0,3600);
end;