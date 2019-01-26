-----------------------------------------
-- ID: 5603
-- Item: dish_of_hydra_kofte_+1
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Strength 8
-- Intelligence -4
-- Attack % 20
-- Attack Cap 160
-- Defense % 25
-- Defense Cap 75
-- Ranged ATT % 20
-- Ranged ATT Cap 160
-- Poison Resist 5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5603)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 8)
    target:addMod(dsp.mod.INT, -4)
    target:addMod(dsp.mod.FOOD_ATTP, 20)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 160)
    target:addMod(dsp.mod.FOOD_DEFP, 25)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 75)
    target:addMod(dsp.mod.FOOD_RATTP, 20)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 160)
    target:addMod(dsp.mod.POISONRES, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 8)
    target:delMod(dsp.mod.INT, -4)
    target:delMod(dsp.mod.FOOD_ATTP, 20)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 160)
    target:delMod(dsp.mod.FOOD_DEFP, 25)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 75)
    target:delMod(dsp.mod.FOOD_RATTP, 20)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 160)
    target:delMod(dsp.mod.POISONRES, 5)
end
