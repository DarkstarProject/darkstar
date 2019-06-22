-----------------------------------
-- Blink
--No need for addMod since blinks never stack.
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:setMod(dsp.mod.BLINK,effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:setMod(dsp.mod.BLINK,0)
end