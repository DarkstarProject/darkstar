-----------------------------------------
-- ID: 4162
-- Item: Silencing Potion
-- Item Effect: This potion induces silence.
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
    if (target:hasStatusEffect(EFFECT_SILENCE) == false) then
        target:addStatusEffect(EFFECT_SILENCE,1,3,180);
    else
        target:messageBasic(423);
    end
end;

