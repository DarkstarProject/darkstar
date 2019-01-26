-----------------------------------
--
-- dsp.effect.PROWESS : Increased attack speed
--
-- Note: Doesn't alter TP gain like -delay would, and
-- doesn't alter JA timers like other sources of haste.
-----------------------------------
require("scripts/globals/status")
function onEffectGain(target, effect)
    target:addMod(dsp.mod.HASTE_ABILITY, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HASTE_ABILITY, effect:getPower())
end