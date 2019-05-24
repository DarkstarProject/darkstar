-----------------------------------------
-- ID: 4338
-- Item: steamed_crayfish
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Defense % 30
-- Defense Cap 30
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4338)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_DEFP, 30)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 30)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_DEFP, 30)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 30)
end
