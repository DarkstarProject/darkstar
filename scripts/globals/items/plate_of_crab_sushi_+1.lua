-----------------------------------------
-- ID: 5722
-- Item: plate_of_crab_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Vitality 2
-- Defense 15
-- Accuracy % 14 (cap 68)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5722)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.DEF, 15)
    target:addMod(dsp.mod.FOOD_ACCP, 14)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 68)
    target:addMod(dsp.mod.SLEEPRES, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.DEF, 15)
    target:delMod(dsp.mod.FOOD_ACCP, 14)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 68)
    target:delMod(dsp.mod.SLEEPRES, 2)
end
