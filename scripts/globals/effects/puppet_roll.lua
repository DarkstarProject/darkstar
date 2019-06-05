-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status")

function onEffectGain(target,effect)
    target:addPetMod(dsp.mod.MATT, effect:getPower())
    target:addPetMod(dsp.mod.MACC, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delPetMod(dsp.mod.MATT, effect:getPower())
    target:delPetMod(dsp.mod.MACC, effect:getPower())
end
