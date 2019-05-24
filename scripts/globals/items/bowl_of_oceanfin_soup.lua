-----------------------------------------
-- ID: 6070
-- Item: Bowl of Oceanfin Soup
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- Accuracy % 15 Cap 95
-- Ranged Accuracy % 15 Cap 95
-- Attack % 19 Cap 85
-- Ranged Attack % 19 Cap 85
-- Amorph Killer 6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,6070)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_ACCP, 15)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 95)
    target:addMod(dsp.mod.FOOD_RACCP, 15)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 95)
    target:addMod(dsp.mod.FOOD_ATTP, 19)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 85)
    target:addMod(dsp.mod.FOOD_RATTP, 19)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 85)
    target:addMod(dsp.mod.AMORPH_KILLER, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_ACCP, 15)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 95)
    target:delMod(dsp.mod.FOOD_RACCP, 15)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 95)
    target:delMod(dsp.mod.FOOD_ATTP, 19)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 85)
    target:delMod(dsp.mod.FOOD_RATTP, 19)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 85)
    target:delMod(dsp.mod.AMORPH_KILLER, 6)
end
