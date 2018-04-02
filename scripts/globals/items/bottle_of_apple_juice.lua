-----------------------------------------
-- ID: 4423
-- Item: Apple Juice
-- Item Effect: Restores 45 MP over 135 seconds.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effects.REFRESH)) then
        target:addStatusEffect(dsp.effects.REFRESH,1,3,135);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
