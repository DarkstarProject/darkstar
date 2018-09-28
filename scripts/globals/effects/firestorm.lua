-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR,effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.STR,effect:getPower())
end