-----------------------------------------
-- ID: 5999
-- Item: Bowl of Adoulin Soup +1
-- Food Effect: 240 Min, All Races
-----------------------------------------
-- HP % 4 Cap 45
-- Vitality 4
-- Defense % 16 Cap 75
-- HP Healing 7
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5999)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 4)
    target:addMod(dsp.mod.FOOD_HP_CAP, 45)
    target:addMod(dsp.mod.VIT, 4)
    target:addMod(dsp.mod.FOOD_DEFP, 16)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 75)
    target:addMod(dsp.mod.HPHEAL, 7)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 4)
    target:delMod(dsp.mod.FOOD_HP_CAP, 45)
    target:delMod(dsp.mod.VIT, 4)
    target:delMod(dsp.mod.FOOD_DEFP, 16)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 75)
    target:delMod(dsp.mod.HPHEAL, 7)
end
