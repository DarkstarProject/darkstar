-----------------------------------------
-- ID: 5885
-- Item: saltena
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +6% (cap 100)
-- Increases rate of combat skill gains by 20%
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5885)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 6)
    target:addMod(dsp.mod.FOOD_HP_CAP, 100)
    target:addMod(dsp.mod.COMBAT_SKILLUP_RATE, 20)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 6)
    target:delMod(dsp.mod.FOOD_HP_CAP, 100)
    target:delMod(dsp.mod.COMBAT_SKILLUP_RATE, 20)
end
