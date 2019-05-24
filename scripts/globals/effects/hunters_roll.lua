-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status")

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ACC, effect:getPower())
    target:addMod(dsp.mod.RACC, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.ACC, effect:getPower())
    target:delMod(dsp.mod.RACC, effect:getPower())
end
