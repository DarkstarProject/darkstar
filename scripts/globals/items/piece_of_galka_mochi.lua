-----------------------------------------
-- ID: 5206
-- Piece of Galka Mochi
-- Enchantment: 60Min, Costume - Galka Child
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_COSTUME,178,0,3600);
end;