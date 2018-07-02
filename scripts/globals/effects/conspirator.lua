-----------------------------------
--
-- dsp.effect.CONSPIRATOR
--
-----------------------------------
require("scripts/globals/status")

function onEffectGain(target,effect)
    target:addMod(dsp.mod.SUBTLE_BLOW, effect:getPower())
    target:addMod(dsp.mod.ACC, effect:getSubPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.SUBTLE_BLOW, effect:getPower())
    target:delMod(dsp.mod.ACC, effect:getSubPower())
end
