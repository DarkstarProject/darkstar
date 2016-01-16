-----------------------------------------
-- ID: 4424
-- Item: Melon Juice
-- Item Effect: Restores 90 MP over 135 seconds.
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
        target:addStatusEffect(EFFECT_REFRESH,2,3,135);
    else
        target:messageBasic(423);
    end
end;

