-----------------------------------------
-- ID: 5604
-- Item: Elshimo Pachira Fruit
-- Item Effect:  Poison 1HP / Removes 40 HP over 120 seconds
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
    if (target:hasStatusEffect(EFFECT_POISON) == false) then
        target:addStatusEffect(EFFECT_POISON,1,3,120);
    else
        target:messageBasic(423);
    end
end;
