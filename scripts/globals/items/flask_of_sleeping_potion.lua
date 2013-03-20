-----------------------------------------
-- ID: 4161
-- Item: Sleeping Potion
-- Item Effect: This potion induces sleep.
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
    target:addStatusEffect(EFFECT_SLEEP_I, 1,0,30);
end;

