-----------------------------------
--
-- dsp.effect.BERSERK
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ACC,15 + effect:getPower())
    target:addMod(dsp.mod.HPP,-15)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.ACC,15 + effect:getPower())
    target:delMod(dsp.mod.HPP,-15)
end