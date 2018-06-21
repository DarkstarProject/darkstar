-----------------------------------
--
--    dsp.effect.EGG
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:costume(2416)
    effect:setPower(target:speed())
    target:speed(0)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:speed(effect:getPower())
    target:addStatusEffect(dsp.effect.COSTUME,1999,0,effect:getTimeRemaining() / 1000)
end