-----------------------------------------
--    ID: 5204
--    Piece of Elvaan Mochi
--    Enchantment: 60Min, Costume - Elvaan Child (male)
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canUseCostume();
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_COSTUME,154,0,3600);
end;