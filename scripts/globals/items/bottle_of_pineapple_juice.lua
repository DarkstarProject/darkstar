-----------------------------------------
-- ID: 4442
-- Item: Pineapple Juice
-- Item Effect: Restores 80 MP over 240 seconds.
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
        target:addStatusEffect(EFFECT_REFRESH,1,3,240);
    else
        target:messageBasic(423);
    end
end;

