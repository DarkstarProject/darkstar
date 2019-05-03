-----------------------------------------
-- ID: 5146
-- Item: hedgehog_pie
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health 55
-- Strength 6
-- Vitality 2
-- Intelligence -3
-- Mind 3
-- Magic Regen While Healing 2
-- Health Regen While Healing 2
-- Attack % 18
-- Attack Cap 90
-- Accuracy 5
-- Ranged ATT % 18
-- Ranged ATT Cap 90
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5146)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 55)
    target:addMod(dsp.mod.STR, 6)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.INT, -3)
    target:addMod(dsp.mod.MND, 3)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.MPHEAL, 2)
    target:addMod(dsp.mod.FOOD_ATTP, 18)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 90)
    target:addMod(dsp.mod.ACC, 5)
    target:addMod(dsp.mod.FOOD_RATTP, 18)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 90)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 55)
    target:delMod(dsp.mod.STR, 6)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.INT, -3)
    target:delMod(dsp.mod.MND, 3)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.MPHEAL, 2)
    target:delMod(dsp.mod.FOOD_ATTP, 18)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 90)
    target:delMod(dsp.mod.ACC, 5)
    target:delMod(dsp.mod.FOOD_RATTP, 18)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 90)
end
