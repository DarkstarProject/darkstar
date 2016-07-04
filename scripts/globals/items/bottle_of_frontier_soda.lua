-----------------------------------------
-- ID: 5944
-- Item: Bottle of Frontier Soda
-- Item Effect: Restores 20 TP over 60 seconds.
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
    if (target:hasStatusEffect(EFFECT_REGAIN) == false) then
        target:addStatusEffect(EFFECT_REGAIN,1,3,60);
    else
        target:messageBasic(423);
    end
end;

