-----------------------------------
-- dsp.effect.RETALIATION
-- Allows you to counterattack but reduces movement speed.
-- Unlike counter, grants TP like a regular melee attack.
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MOVE, -8)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.MOVE, -8)
end