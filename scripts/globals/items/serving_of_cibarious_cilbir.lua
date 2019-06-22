-----------------------------------------
-- ID: 5643
-- Item: serving_of_cibarious_cilbir
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- HP % 6 (cap 150)
-- MP % 6 (cap 100)
-- HP recovered while healing 3
-- MP recovered while healing 4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5643)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 6)
    target:addMod(dsp.mod.FOOD_HP_CAP, 150)
    target:addMod(dsp.mod.FOOD_MPP, 6)
    target:addMod(dsp.mod.FOOD_MP_CAP, 100)
    target:addMod(dsp.mod.MPHEAL, 4)
    target:addMod(dsp.mod.HPHEAL, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 6)
    target:delMod(dsp.mod.FOOD_HP_CAP, 150)
    target:delMod(dsp.mod.FOOD_MPP, 6)
    target:delMod(dsp.mod.FOOD_MP_CAP, 100)
    target:delMod(dsp.mod.MPHEAL, 4)
    target:delMod(dsp.mod.HPHEAL, 3)
end
