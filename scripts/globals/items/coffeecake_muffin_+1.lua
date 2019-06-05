-----------------------------------------
-- ID: 5656
-- Item: coffeecake_muffin_+1
-- Food Effect: 1Hr, All Races
-----------------------------------------
-- Mind 2
-- Strength -1
-- MP % 10 (cap 90)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5656)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MND, 2)
    target:addMod(dsp.mod.STR, -1)
    target:addMod(dsp.mod.FOOD_MPP, 10)
    target:addMod(dsp.mod.FOOD_MP_CAP, 90)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MND, 2)
    target:delMod(dsp.mod.STR, -1)
    target:delMod(dsp.mod.FOOD_MPP, 10)
    target:delMod(dsp.mod.FOOD_MP_CAP, 90)
end