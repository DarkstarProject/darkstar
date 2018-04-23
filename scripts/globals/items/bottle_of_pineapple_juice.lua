-----------------------------------------
-- ID: 4442
-- Item: Pineapple Juice
-- Item Effect: Restores 80 MP over 240 seconds.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effects.REFRESH)) then
        target:addStatusEffect(dsp.effects.REFRESH,1,3,240);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
