-----------------------------------------
-- ID: 4527
-- Item: Jug of marys milk
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
        target:addStatusEffect(EFFECT_SLEEP_I,1,0,60);
    else
        target:messageBasic(423);
    end
end;

