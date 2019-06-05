-----------------------------------------
-- ID: 5691
-- Item: plate_of_shrimp_sushi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Vitality 1
-- Defense 5
-- Accuracy % 14 (cap 68)
-- Ranged Accuracy % 14 (cap 68)
-- Resist sleep +1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5691)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.VIT, 1)
    target:addMod(dsp.mod.DEF, 5)
    target:addMod(dsp.mod.FOOD_ACCP, 14)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 68)
    target:addMod(dsp.mod.FOOD_RACCP, 14)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 68)
    target:addMod(dsp.mod.SLEEPRES, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, 1)
    target:delMod(dsp.mod.DEF, 5)
    target:delMod(dsp.mod.FOOD_ACCP, 14)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 68)
    target:delMod(dsp.mod.FOOD_RACCP, 14)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 68)
    target:delMod(dsp.mod.SLEEPRES, 1)
end
