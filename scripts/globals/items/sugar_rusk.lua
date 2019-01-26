-----------------------------------------
-- ID: 5782
-- Item: sugar_rusk
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- High-quality success rate +1
-- Synthesis failure rate -2%
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5782)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.SYNTH_HQ_RATE, 1)
    target:addMod(dsp.mod.SYNTH_FAIL_RATE, -2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.SYNTH_HQ_RATE, 1)
    target:delMod(dsp.mod.SYNTH_FAIL_RATE, -2)
end
