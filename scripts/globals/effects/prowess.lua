-----------------------------------
--
-- dsp.effect.PROWESS
-- From GoV
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.GOV_CLEARS, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.GOV_CLEARS, effect:getPower())
end