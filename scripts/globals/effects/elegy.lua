-----------------------------------
--
--     dsp.effect.ELEGY
--
-----------------------------------
require("scripts/globals/status")
function onEffectGain(target, effect)
    target:addMod(dsp.mod.HASTE_MAGIC, -effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HASTE_MAGIC, -effect:getPower())
end
