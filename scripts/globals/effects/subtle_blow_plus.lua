-----------------------------------
--
-- Subtle Blow Plus Effect
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.SUBTLE_BLOW, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.SUBTLE_BLOW, effect:getPower())
end