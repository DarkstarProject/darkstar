-----------------------------------------
-- ID: 16183
-- Nomad Moogle Shield
-- Enchantment: 60Min, Costume - Moogle
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.COSTUME,2308,0,3600);
end;