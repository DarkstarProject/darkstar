-----------------------------------
--
-- Store TP Plus
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STORETP, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.STORETP, effect:getPower())
end