-----------------------------------------
-- ID: 5602
-- Item: dish_of_hydra_kofte
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Strength 7
-- Intelligence -3
-- Attack % 20
-- Attack Cap 150
-- Defense % 25
-- Defense Cap 70
-- Ranged ATT % 20
-- Ranged ATT Cap 150
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5602)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 7)
    target:addMod(dsp.mod.INT, -3)
    target:addMod(dsp.mod.FOOD_ATTP, 20)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 150)
    target:addMod(dsp.mod.FOOD_DEFP, 25)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 70)
    target:addMod(dsp.mod.FOOD_RATTP, 20)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 150)
    target:addMod(dsp.mod.POISONRES, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 7)
    target:delMod(dsp.mod.INT, -3)
    target:delMod(dsp.mod.FOOD_ATTP, 20)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 150)
    target:delMod(dsp.mod.FOOD_DEFP, 25)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 70)
    target:delMod(dsp.mod.FOOD_RATTP, 20)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 150)
    target:delMod(dsp.mod.POISONRES, 5)
end
