-----------------------------------------
-- ID: 4302
-- Item: Pamama au Lait
-- Item Effect: Restores 400 HP over 600 seconds
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
        target:addStatusEffect(EFFECT_REGEN,2,3,600);
    else
        target:messageBasic(423);
    end
end;

