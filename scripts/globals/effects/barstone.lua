-----------------------------------
--
-- dsp.effect.BARSTONE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.EARTHRES,effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.EARTHRES,effect:getPower())
end