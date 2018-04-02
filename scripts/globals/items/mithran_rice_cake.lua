-----------------------------------------
-- ID: 5297
-- Mithran Rice Cake
-- Enchantment: 60Min, Costume - Mithra Child
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.COSTUME,182,0,3600);
end;