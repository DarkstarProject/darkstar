-----------------------------------
--
-- dsp.effect.BERSERK
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ATTP, 25 + effect:getPower())
    target:addMod(dsp.mod.RATTP, 25 + effect:getPower())
    target:addMod(dsp.mod.DEFP, -25 - effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.ATTP, 25 + effect:getPower())
    target:delMod(dsp.mod.RATTP, 25 + effect:getPower())
    target:delMod(dsp.mod.DEFP, -25 - effect:getPower())
end
