-----------------------------------------
-- ID: 14517
-- Item: Hydra Haubert
-- Item Effect: gives refresh
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effects.REFRESH)) then
        target:messageBasic(msgBasic.NO_EFFECT);
    else
        target:addStatusEffect(dsp.effects.REFRESH, 3, 3, 180);
    end
end;
