-----------------------------------------
-- ID: 5709
-- Item: Cotton Candy
-- Food Effect: 5 Min, All Races
-----------------------------------------
-- MP % 10 Cap 200
-- MP Healing 3
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.FOOD)) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5709)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_MPP, 10)
    target:addMod(dsp.mod.FOOD_MP_CAP, 200)
    target:addMod(dsp.mod.MPHEAL, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 10)
    target:delMod(dsp.mod.FOOD_MP_CAP, 200)
    target:delMod(dsp.mod.MPHEAL, 3)
end
