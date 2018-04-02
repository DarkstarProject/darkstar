-----------------------------------------
-- ID: 4150
-- Item: Eye Drops
-- Item Effect: This potion remedies blindness.
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)

    if (target:hasStatusEffect(dsp.effects.BLINDNESS) == true) then
        target:delStatusEffect(dsp.effects.BLINDNESS);
    end
end;

