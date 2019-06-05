-----------------------------------------
-- ID: 5751
-- Item: bowl_of_goulash_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- VIT +4
-- INT -2
-- Accuracy +11% (cap 58)
-- DEF +11% (cap 35)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5751)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.VIT, 4)
    target:addMod(dsp.mod.INT, -2)
    target:addMod(dsp.mod.FOOD_ACCP, 11)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 58)
    target:addMod(dsp.mod.FOOD_DEFP, 11)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 35)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, 4)
    target:delMod(dsp.mod.INT, -2)
    target:delMod(dsp.mod.FOOD_ACCP, 11)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 58)
    target:delMod(dsp.mod.FOOD_DEFP, 11)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 35)
end
