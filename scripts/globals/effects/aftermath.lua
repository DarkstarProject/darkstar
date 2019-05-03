-----------------------------------
--
-- dsp.effect.AFTERMATH
--
-----------------------------------
require("scripts/globals/aftermath")
-----------------------------------

function onEffectGain(target, effect)
    dsp.aftermath.onEffectGain(target, effect)
end

function onEffectLose(target, effect)
    dsp.aftermath.onEffectLose(target, effect)
end