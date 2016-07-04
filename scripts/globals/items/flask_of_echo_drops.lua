-----------------------------------------
-- ID: 4151
-- Item: Echo Drops
-- Item Effect: This potion remedies silence.
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

    if (target:hasStatusEffect(EFFECT_SILENCE) == true) then
        target:delStatusEffect(EFFECT_SILENCE);
    end
end;

