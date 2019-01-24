-----------------------------------------
-- ID: 5666
-- Item: plate_of_fin_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Intelligence 6
-- Accuracy % 17 (cap 80)
-- Ranged Accuracy % 17 (cap 80)
-- Resist Sleep +2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5666)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.INT, 6)
    target:addMod(dsp.mod.FOOD_ACCP, 17)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 80)
    target:addMod(dsp.mod.FOOD_RACCP, 17)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 80)
    target:addMod(dsp.mod.SLEEPRES, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.INT, 6)
    target:delMod(dsp.mod.FOOD_ACCP, 17)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 80)
    target:delMod(dsp.mod.FOOD_RACCP, 17)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 80)
    target:delMod(dsp.mod.SLEEPRES, 2)
end
