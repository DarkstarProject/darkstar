-----------------------------------
--
-- dsp.effect.BERSERK
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ATTP,25)
    target:addMod(dsp.mod.RATTP, 25)
    target:addMod(dsp.mod.DEFP,-25)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.ATTP,25)
    target:delMod(dsp.mod.DEFP,-25)
    target:delMod(dsp.mod.RATTP, 25)
end