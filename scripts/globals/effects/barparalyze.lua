-----------------------------------
--
-- dsp.effect.BARAMNESIA
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.PARALYZERES,effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.PARALYZERES,effect:getPower())
end