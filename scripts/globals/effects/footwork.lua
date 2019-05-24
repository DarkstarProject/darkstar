-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(dsp.mod.KICK_ATTACK_RATE, 20)
    target:addMod(dsp.mod.KICK_DMG, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.KICK_ATTACK_RATE, 20)
    target:delMod(dsp.mod.KICK_DMG, effect:getPower())
end