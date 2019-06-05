-----------------------------------------
-- ID: 5655
-- Item: coffeecake_muffin
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Mind 1
-- Strength -1
-- MP % 10 (cap 85)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5655)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MND, 1)
    target:addMod(dsp.mod.STR, -1)
    target:addMod(dsp.mod.FOOD_MPP, 10)
    target:addMod(dsp.mod.FOOD_MP_CAP, 85)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MND, 1)
    target:delMod(dsp.mod.STR, -1)
    target:delMod(dsp.mod.FOOD_MPP, 10)
    target:delMod(dsp.mod.FOOD_MP_CAP, 85)
end