-----------------------------------------
-- ID: 6069
-- Item: Bowl of Riverfin Soup
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- Accuracy % 14 Cap 90
-- Ranged Accuracy % 14 Cap 90
-- Attack % 18 Cap 80
-- Ranged Attack % 18 Cap 80
-- Amorph Killer 5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,6069)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_ACCP, 14)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 90)
    target:addMod(dsp.mod.FOOD_RACCP, 14)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 90)
    target:addMod(dsp.mod.FOOD_ATTP, 18)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 80)
    target:addMod(dsp.mod.FOOD_RATTP, 18)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 80)
    target:addMod(dsp.mod.AMORPH_KILLER, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_ACCP, 14)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 90)
    target:delMod(dsp.mod.FOOD_RACCP, 14)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 90)
    target:delMod(dsp.mod.FOOD_ATTP, 18)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 80)
    target:delMod(dsp.mod.FOOD_RATTP, 18)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 80)
    target:delMod(dsp.mod.AMORPH_KILLER, 5)
end
