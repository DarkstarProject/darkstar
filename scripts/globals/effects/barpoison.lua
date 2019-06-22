-----------------------------------
--
-- dsp.effect.BARPOISON
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.POISONRES,effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.POISONRES,effect:getPower())
end