-----------------------------------------
-- ID: 5182
-- Item: salty_bretzel
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Magic % 8
-- Magic Cap 60
-- Vitality 2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5182)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_MPP, 8)
    target:addMod(dsp.mod.FOOD_MP_CAP, 60)
    target:addMod(dsp.mod.VIT, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 8)
    target:delMod(dsp.mod.FOOD_MP_CAP, 60)
    target:delMod(dsp.mod.VIT, 2)
end
