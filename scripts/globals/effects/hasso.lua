-----------------------------------
-- Hasso
-- Straight +10% haste +10 Acc and scaling (lv) STR
-- also -50% FC
-----------------------------------
require("scripts/globals/status")
function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, effect:getPower())
    target:addMod(dsp.mod.HASTE_ABILITY, 1000)
    target:addMod(dsp.mod.ACC, 10)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, effect:getPower())
    target:delMod(dsp.mod.HASTE_ABILITY, 1000)
    target:delMod(dsp.mod.ACC, 10)
end
