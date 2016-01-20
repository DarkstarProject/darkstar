-----------------------------------------
-- ID: 4301
-- Item: Persikos au Lait
-- Item Effect: Restores 800 HP over 600 seconds
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
        target:addStatusEffect(EFFECT_REGEN,4,3,600);
    else
        target:messageBasic(423);
    end
end;

