-----------------------------------------
-- ID: 15170
-- Item: Blink Band
-- Item Effect: 3 shadows
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effect.COPY_IMAGE) or target:hasStatusEffect(dsp.effect.THIRD_EYE)) then
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    else
        target:addStatusEffect(dsp.effect.BLINK, 3, 0, 300)
        target:messageBasic(dsp.msg.basic.GAINS_EFFECT_OF_STATUS, dsp.effect.BLINK)
    end
end
