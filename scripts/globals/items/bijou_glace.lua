-----------------------------------------
-- ID: 4269
-- Item: Bijou Glace
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Magic % 13
-- Magic Cap 90
-- Magic Regen While Healing 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4269)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_MPP, 13)
    target:addMod(dsp.mod.FOOD_MP_CAP, 90)
    target:addMod(dsp.mod.MPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 13)
    target:delMod(dsp.mod.FOOD_MP_CAP, 90)
    target:delMod(dsp.mod.MPHEAL, 1)
end
