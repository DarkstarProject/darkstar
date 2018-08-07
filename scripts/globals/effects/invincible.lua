-----------------------------------
--
--     dsp.effect.INVINCIBLE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.UDMGPHYS, -100)
    target:addMod(dsp.mod.UDMGRANGE, -100)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.UDMGPHYS, -100)
    target:delMod(dsp.mod.UDMGRANGE, -100)
end
