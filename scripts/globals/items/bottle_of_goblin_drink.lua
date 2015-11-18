-----------------------------------------
-- ID: 4423
-- Item: Apple Juice
-- Item Effect: Restores 1 MP / 3 tick 180 mins.
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
    if (target:hasStatusEffect(EFFECT_REFRESH) == false) then
        target:addStatusEffect(EFFECT_REFRESH,1,3,10800);
    else
        target:messageBasic(423);
    end
end;

