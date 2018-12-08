-----------------------------------
--
--    dsp.effect.VELOCITY_SHOT
--
-----------------------------------
require("scripts/globals/status")
function onEffectGain(target, effect)
    target:addMod(dsp.mod.ATTP, -15)
    target:addMod(dsp.mod.HASTE_ABILITY, -1500)
    target:addMod(dsp.mod.RATTP, 15)
    target:addMod(dsp.mod.RANGED_DELAYP, -10)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.ATTP, -15)
    target:delMod(dsp.mod.HASTE_ABILITY, -1500)
    target:delMod(dsp.mod.RATTP, 15)
    target:delMod(dsp.mod.RANGED_DELAYP, -10)
end
