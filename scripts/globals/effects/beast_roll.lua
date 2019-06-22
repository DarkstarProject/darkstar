-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status")

function onEffectGain(target,effect)
    target:addPetMod(dsp.mod.ATTP, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delPetMod(dsp.mod.ATTP, effect:getPower())
end
