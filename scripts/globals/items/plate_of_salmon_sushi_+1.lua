-----------------------------------------
-- ID: 5664
-- Item: plate_of_salmon_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Strength 2
-- Accuracy % 15 (cap 72)
-- Ranged ACC % 15 (cap 72)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5664)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 2)
    target:addMod(dsp.mod.FOOD_ACCP, 15)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 72)
    target:addMod(dsp.mod.FOOD_RACCP, 15)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 72)
    target:addMod(dsp.mod.SLEEPRES, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 2)
    target:delMod(dsp.mod.FOOD_ACCP, 15)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 72)
    target:delMod(dsp.mod.FOOD_RACCP, 15)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 72)
    target:delMod(dsp.mod.SLEEPRES, 2)
end
