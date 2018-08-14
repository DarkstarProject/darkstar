-----------------------------------
--
-- dsp.effect.ADDLE
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FASTCAST, -effect:getPower()) -- Yes we are subtracting in addMod()
    target:addMod(dsp.mod.MACC, -effect:getSubPower()) -- This is intentional
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.FASTCAST, -effect:getPower())
    target:delMod(dsp.mod.MACC, -effect:getSubPower())
end