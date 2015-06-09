-----------------------------------------
-- ID: 17583
-- Item: Republic Signet Staff
-- Effect: Signet
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
    target:delStatusEffect(EFFECT_SIGNET);
    target:addStatusEffect(EFFECT_SIGNET,0,0,18000);
end;