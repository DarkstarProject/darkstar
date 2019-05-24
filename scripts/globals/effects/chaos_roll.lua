-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status")

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ATTP, effect:getPower())
    target:addMod(dsp.mod.RATTP, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.ATTP, effect:getPower())
    target:delMod(dsp.mod.RATTP, effect:getPower())
end
