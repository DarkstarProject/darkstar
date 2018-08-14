-----------------------------------
--
--     dsp.effect.SUPER_BUFF
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower()
    target:addMod(dsp.mod.ATTP,power)
    target:addMod(dsp.mod.DEFP,power)
    target:addMod(dsp.mod.MATT,power)
    target:addMod(dsp.mod.MEVA,power)
    -- The following only applies to Nidhogg.  If this buff is to be used anywhere else, a check on mob name (NOT ID) would be a good choice
    target:AnimationSub(2)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    local power = effect:getPower()
    target:delMod(dsp.mod.ATTP,power)
    target:delMod(dsp.mod.DEFP,power)
    target:delMod(dsp.mod.MATT,power)
    target:delMod(dsp.mod.MEVA,power)
    target:AnimationSub(0)
end