-----------------------------------
--
-- dsp.effect.AGGRESSOR
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.RACC, effect:getPower())
    target:addMod(dsp.mod.ACC,25)
    target:addMod(dsp.mod.EVA,-25)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.RACC, effect:getPower())
    target:delMod(dsp.mod.ACC,25)
    target:delMod(dsp.mod.EVA,-25)
end