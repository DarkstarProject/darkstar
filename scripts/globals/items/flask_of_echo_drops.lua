-----------------------------------------
-- ID: 4151
-- Item: Echo Drops
-- Item Effect: This potion remedies silence.
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)

    if (target:hasStatusEffect(EFFECT.SILENCE) == true) then
        target:delStatusEffect(EFFECT.SILENCE);
    end
end;

