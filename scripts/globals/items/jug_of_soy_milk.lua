-----------------------------------------
-- ID: 5232
-- Item: Soy Milk
-- Item Effect: Restores 40 HP over 120 seconds
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
    if (target:hasStatusEffect(EFFECT_REGEN) == false) then
        target:addStatusEffect(EFFECT_REGEN,1,3,120);
    else
        target:messageBasic(423);
    end
end;

