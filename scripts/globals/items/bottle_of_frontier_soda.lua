-----------------------------------------
-- ID: 5944
-- Item: Bottle of Frontier Soda
-- Item Effect: Restores 20 TP over 60 seconds.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effects.REGAIN)) then
        target:addStatusEffect(dsp.effects.REGAIN,1,3,60);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
