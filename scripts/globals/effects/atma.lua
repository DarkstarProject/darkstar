-----------------------------------
--
-- dsp.effect.ATMA
--
-----------------------------------
require("scripts/globals/atma")
-----------------------------------

function onEffectGain(target, effect)
    dsp.atma.onEffectGain(target, effect)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    dsp.atma.onEffectLose(target, effect)
end
