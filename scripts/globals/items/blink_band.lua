-----------------------------------------
-- ID: 15170
-- Item: Blink Band
-- Item Effect: 3 shadows
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effects.COPY_IMAGE) or target:hasStatusEffect(dsp.effects.THIRD_EYE)) then
        target:messageBasic(msgBasic.NO_EFFECT);
    else
        target:addStatusEffect(dsp.effects.BLINK, 3, 0, 300);
        target:messageBasic(msgBasic.GAINS_EFFECT_OF_STATUS, dsp.effects.BLINK);
    end
end;
