-----------------------------------
--  Stoneskin
--
--  Absorbs a certain amount of damage from physical and magical attacks.
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:setMod(dsp.mod.STONESKIN, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:setMod(dsp.mod.STONESKIN, 0)
end