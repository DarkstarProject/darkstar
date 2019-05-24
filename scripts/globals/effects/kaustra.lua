-----------------------------------
--
--     dsp.effect.KAUSTRA
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onEffectGain(target,effect)

    target:addMod(dsp.mod.REGEN_DOWN, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.REGEN_DOWN, effect:getPower())

end