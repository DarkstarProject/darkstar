-----------------------------------------
-- ID: 4162
-- Item: Silencing Potion
-- Item Effect: This potion induces silence.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effects.SILENCE)) then
        target:addStatusEffect(dsp.effects.SILENCE,1,3,180);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
