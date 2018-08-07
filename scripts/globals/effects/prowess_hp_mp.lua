-----------------------------------
--
-- dsp.effect.PROWESS : Increased HP and MP
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HPP, effect:getPower())
    target:addMod(dsp.mod.MPP, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.HPP, effect:getPower())
    target:delMod(dsp.mod.MPP, effect:getPower())
end