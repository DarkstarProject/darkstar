-----------------------------------
--
-- INHIBIT_TP
-- Reduces TP Gain By a % Factor
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.INHIBIT_TP, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.INHIBIT_TP, effect:getPower())
end