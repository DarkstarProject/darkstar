-----------------------------------------
-- ID: 5710
-- Item: Berry Snowcone
-- Food Effect: 5 Min, All Races
-----------------------------------------
-- MP % 30 Cap 30
-- Intelligence 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5710)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_MPP, 30)
    target:addMod(dsp.mod.FOOD_MP_CAP, 30)
    target:addMod(dsp.mod.INT, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 30)
    target:delMod(dsp.mod.FOOD_MP_CAP, 30)
    target:delMod(dsp.mod.INT, 1)
end
