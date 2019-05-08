-----------------------------------------
-- ID: 5784
-- Item: coconut_rusk
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- High-quality success rate +3
-- Synthesis failure rate -6%
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5784)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.SYNTH_HQ_RATE, 3)
    target:addMod(dsp.mod.SYNTH_FAIL_RATE, -6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.SYNTH_HQ_RATE, 3)
    target:delMod(dsp.mod.SYNTH_FAIL_RATE, -6)
end
