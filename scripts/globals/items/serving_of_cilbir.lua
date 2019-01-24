-----------------------------------------
-- ID: 5642
-- Item: serving_of_cilbir
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- HP % 5 (cap 150)
-- MP % 5 (cap 100)
-- HP recovered while healing 3
-- MP recovered while healing 3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5642)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 5)
    target:addMod(dsp.mod.FOOD_HP_CAP, 150)
    target:addMod(dsp.mod.FOOD_MPP, 5)
    target:addMod(dsp.mod.FOOD_MP_CAP, 100)
    target:addMod(dsp.mod.MPHEAL, 3)
    target:addMod(dsp.mod.HPHEAL, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 5)
    target:delMod(dsp.mod.FOOD_HP_CAP, 150)
    target:delMod(dsp.mod.FOOD_MPP, 5)
    target:delMod(dsp.mod.FOOD_MP_CAP, 100)
    target:delMod(dsp.mod.MPHEAL, 3)
    target:delMod(dsp.mod.HPHEAL, 3)
end
