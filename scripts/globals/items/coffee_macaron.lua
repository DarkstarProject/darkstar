-----------------------------------------
-- ID: 5780
-- Item: coffee_macaron
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Increases rate of synthesis success +5%
-- Increases synthesis skill gain rate +5%
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD)) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5780)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.SYNTH_SUCCESS, 5)
    target:addMod(dsp.mod.SYNTH_SKILL_GAIN, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.SYNTH_SUCCESS, 5)
    target:delMod(dsp.mod.SYNTH_SKILL_GAIN, 5)
end
