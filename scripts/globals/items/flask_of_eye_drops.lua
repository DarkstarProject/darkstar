-----------------------------------------
-- ID: 4150
-- Item: Eye Drops
-- Item Effect: This potion remedies blindness.
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

    if (target:hasStatusEffect(EFFECT_BLINDNESS) == true) then
        target:delStatusEffect(EFFECT_BLINDNESS);
    end
end;

