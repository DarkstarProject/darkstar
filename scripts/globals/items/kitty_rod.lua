-----------------------------------------
-- ID: 18871
-- Kitty Rod
-- Enchantment: 60Min, Costume - Mithra child (Blue)
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_COSTUME,183,0,3600);
end;