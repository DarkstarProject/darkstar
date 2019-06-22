-----------------------------------------
-- ID: 5979
-- Item: Plate of Dulcet Panettones
-- Food Effect: 240 Min, All Races
-----------------------------------------
-- MP % 6 Cap 105
-- Intelligence +8
-- MP Healing +4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5979)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_MPP, 6)
    target:addMod(dsp.mod.FOOD_MP_CAP, 105)
    target:addMod(dsp.mod.INT, 8)
    target:addMod(dsp.mod.MPHEAL, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 6)
    target:delMod(dsp.mod.FOOD_MP_CAP, 105)
    target:delMod(dsp.mod.INT, 8)
    target:delMod(dsp.mod.MPHEAL, 4)
end
