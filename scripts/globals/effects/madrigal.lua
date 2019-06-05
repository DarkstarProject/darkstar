-----------------------------------
--
--    dsp.effect.MADRIGAL
-- getPower returns the TIER (e.g. 1,2,3,4)
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ACC, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.ACC, effect:getPower())
end