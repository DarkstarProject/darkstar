-----------------------------------------
-- ID: 5998
-- Item: Bowl of Adoulin Soup
-- Food Effect: 180 Min, All Races
-----------------------------------------
-- HP % 3 Cap 40
-- Vitality 3
-- Defense % 15 Cap 70
-- HP Healing 6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5998)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 3)
    target:addMod(dsp.mod.FOOD_HP_CAP, 40)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.FOOD_DEFP, 15)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 70)
    target:addMod(dsp.mod.HPHEAL, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 3)
    target:delMod(dsp.mod.FOOD_HP_CAP, 40)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.FOOD_DEFP, 15)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 70)
    target:delMod(dsp.mod.HPHEAL, 6)
end
