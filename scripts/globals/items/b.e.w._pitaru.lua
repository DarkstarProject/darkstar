-----------------------------------------
-- ID: 5892
-- Item: b.e.w._pitaru
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- MP +9% (cap 130)
-- Increases rate of magic skill gains by 80%
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5892)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_MPP, 9)
    target:addMod(dsp.mod.FOOD_MP_CAP, 130)
    target:addMod(dsp.mod.MAGIC_SKILLUP_RATE, 80)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 9)
    target:delMod(dsp.mod.FOOD_MP_CAP, 130)
    target:delMod(dsp.mod.MAGIC_SKILLUP_RATE, 80)
end
