-----------------------------------------
-- ID: 4160
-- Item: Petrify Potion
-- Item Effect: This potion induces petrify.
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
    if (target:hasStatusEffect(EFFECT_PETRIFICATION) == false) then
        target:addStatusEffect(EFFECT_PETRIFICATION,1,3,180);
    else
        target:messageBasic(423);
    end
end;

