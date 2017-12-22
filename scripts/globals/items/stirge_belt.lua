-----------------------------------------
-- ID: 15933
-- Stirge Belt
-- Enchantment: 60Min, Costume - Bat
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_COSTUME,256,0,3600);
end;