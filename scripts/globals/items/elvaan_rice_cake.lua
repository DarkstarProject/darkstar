-----------------------------------------
-- ID: 5295
-- Elvaan Rice Cake
-- Enchantment: 60Min, Costume - Elvaan Child (female)
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.COSTUME,158,0,3600);
end;