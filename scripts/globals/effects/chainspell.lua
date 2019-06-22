-----------------------------------
--
-- dsp.effect.CHAINSPELL
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.UFASTCAST,150)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.UFASTCAST,150)
end