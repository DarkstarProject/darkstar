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
    if(target:hasStatusEffect(EFFECT_SLEEP_I) == false) then
        target:addStatusEffect(EFFECT_SLEEP_I,1,3,30);
    else
        target:messageBasic(423);
    end
end;

