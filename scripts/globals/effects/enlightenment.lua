-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.INT, effect:getPower())
    target:addMod(dsp.mod.MND, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.INT, effect:getPower())
    target:delMod(dsp.mod.MND, effect:getPower())
end