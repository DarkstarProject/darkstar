-----------------------------------------
-- ID: 4158
-- Item: Venom Potion
-- Item Effect: Removes 300 HP over 180 seconds
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
        target:addStatusEffect(EFFECT_POISON,5,3,180);
    else
        target:messageBasic(423);
    end
end;

