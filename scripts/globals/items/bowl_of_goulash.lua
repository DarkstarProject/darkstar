-----------------------------------------
-- ID: 5750
-- Item: bowl_of_goulash
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- VIT +3
-- INT -2
-- Accuracy +10% (cap 54)
-- DEF +10% (cap 30)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5750)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.INT, -2)
    target:addMod(dsp.mod.FOOD_ACCP, 10)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 54)
    target:addMod(dsp.mod.FOOD_DEFP, 10)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 30)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.INT, -2)
    target:delMod(dsp.mod.FOOD_ACCP, 10)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 54)
    target:delMod(dsp.mod.FOOD_DEFP, 10)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 30)
end
