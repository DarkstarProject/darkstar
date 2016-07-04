-----------------------------------------
-- ID: 5438
-- Item: Bottle of Strange Juice
-- Item Effect: Restores 200 MP over 300 seconds.
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
    worked = 0;
    if (target:hasStatusEffect(EFFECT_REFRESH) == false) then
        target:addStatusEffect(EFFECT_REFRESH,2,3,300);
    else
        target:messageBasic(423);
    end
end;

