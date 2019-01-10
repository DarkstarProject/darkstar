-----------------------------------------
-- ID: 5198
-- Item: Dish of Spaghetti Vongole Rosso +1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health % 20
-- Health Cap 95
-- Vitality 2
-- Mind -1
-- Defense % 25
-- Defense Cap 35
-- Store TP 6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5198)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 20)
    target:addMod(dsp.mod.FOOD_HP_CAP, 95)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.MND, -1)
    target:addMod(dsp.mod.FOOD_DEFP, 25)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 35)
    target:addMod(dsp.mod.STORETP, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 20)
    target:delMod(dsp.mod.FOOD_HP_CAP, 95)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.MND, -1)
    target:delMod(dsp.mod.FOOD_DEFP, 25)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 35)
    target:delMod(dsp.mod.STORETP, 6)
end
