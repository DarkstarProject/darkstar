-----------------------------------------
-- ID: 4527
-- Item: Jug of marys milk
-- Item Effect: This potion induces sleep.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not hasSleepEffects(target)) then
        target:addStatusEffect(dsp.effects.SLEEP_I,1,0,60);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
