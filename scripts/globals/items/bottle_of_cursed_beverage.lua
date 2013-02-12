-----------------------------------------
-- ID: 4157
-- Item: Cursed Beverage
-- Item Effect: Removes 15 HP over 900 seconds
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
    if(target:hasStatusEffect(EFFECT_POISON) == false) then
        target:addStatusEffect(EFFECT_POISON,15,3,180);
    else
        target:messageBasic(423);
    end
end;

