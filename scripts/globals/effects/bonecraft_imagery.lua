-----------------------------------
--
-- BONECRAFT_IMAGERY
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.BONE,effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.BONE,effect:getPower())
end