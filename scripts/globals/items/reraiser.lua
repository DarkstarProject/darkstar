-----------------------------------------
-- ID: 4172
-- Item: Reraiser
-- Item Effect: This potion functions inthe same way as the spell Reraise.
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
    target:messageBasic(266,0, EFFECT_RERAISE);
        target:delStatusEffect(EFFECT_RERAISE);
        target:addStatusEffect(EFFECT_RERAISE,1,0,duration);
end;
