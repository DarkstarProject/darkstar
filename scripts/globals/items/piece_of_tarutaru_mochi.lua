-----------------------------------------
-- ID: 5205
-- Piece of Tarutaru Mochi
-- Enchantment: 60Min, Costume - Tarutaru child (male)
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT.COSTUME,822,0,3600);
end;