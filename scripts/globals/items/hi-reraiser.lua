-----------------------------------------
-- ID: 4173
-- Item: Hi-Reraiser
-- Item Effect: This potion functions inthe same way as the spell Reraise II.
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
    local duration = 5400;
    target:delStatusEffect(EFFECT_RERAISE);
    target:addStatusEffect(EFFECT_RERAISE,2,0,duration);
end;
