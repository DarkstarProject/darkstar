-----------------------------------
--
--     dsp.effect.COPY_IMAGE
--
-----------------------------------
require("scripts/globals/status")

function onEffectGain(target,effect)
    target:setMod(dsp.mod.UTSUSEMI, effect:getSubPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:setMod(dsp.mod.UTSUSEMI, 0)
end