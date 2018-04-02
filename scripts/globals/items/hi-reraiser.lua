-----------------------------------------
-- ID: 4173
-- Item: Hi-Reraiser
-- Item Effect: This potion functions inthe same way as the spell Reraise II.
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    local duration = 5400;
    target:delStatusEffect(EFFECT.RERAISE);
    target:addStatusEffect(EFFECT.RERAISE,2,0,duration);
end;
