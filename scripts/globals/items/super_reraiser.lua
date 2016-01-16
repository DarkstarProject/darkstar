-----------------------------------------
-- ID: 5770
-- Item: Super Reraiser
-- Item Effect: This potion functions the same way as the spell Reraise.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    local duration = 3600;
        target:delStatusEffect(EFFECT_RERAISE);
        target:addStatusEffect(EFFECT_RERAISE,3,0,duration);
end;
