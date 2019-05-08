-----------------------------------------
-- ID: 5886
-- Item: elshena
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +7% (cap 120)
-- Increases rate of combat skill gains by 40%
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5886)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 7)
    target:addMod(dsp.mod.FOOD_HP_CAP, 120)
    target:addMod(dsp.mod.COMBAT_SKILLUP_RATE, 40)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 7)
    target:delMod(dsp.mod.FOOD_HP_CAP, 120)
    target:delMod(dsp.mod.COMBAT_SKILLUP_RATE, 40)
end
