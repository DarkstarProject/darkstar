-----------------------------------
--
--     dsp.effect.SPONTANEITY
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.UFASTCAST,150)
    effect:setFlag(dsp.effectFlag.MAGIC_BEGIN)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.UFASTCAST,150)
end