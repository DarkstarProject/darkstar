-----------------------------------------
-- ID: 5721
-- Item: plate_of_crab_sushi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Vitality 1
-- Defense 10
-- Accuracy % 13 (cap 64)
-- Resist Sleep +1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5721)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.VIT, 1)
    target:addMod(dsp.mod.DEF, 10)
    target:addMod(dsp.mod.FOOD_ACCP, 13)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 64)
    target:addMod(dsp.mod.SLEEPRES, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, 1)
    target:delMod(dsp.mod.DEF, 10)
    target:delMod(dsp.mod.FOOD_ACCP, 13)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 64)
    target:delMod(dsp.mod.SLEEPRES, 1)
end
