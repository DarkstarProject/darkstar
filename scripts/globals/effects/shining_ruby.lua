-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEFP,10)
    target:addMod(dsp.mod.MDEF,4)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.DEFP,10)
    target:delMod(dsp.mod.MDEF,4)
end