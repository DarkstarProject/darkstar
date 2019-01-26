-----------------------------------------
-- ID: 5890
-- Item: poultry_pitaru
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- MP +7% (cap 110)
-- Increases rate of magic skill gains by 40%
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5890)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_MPP, 7)
    target:addMod(dsp.mod.FOOD_MP_CAP, 110)
    target:addMod(dsp.mod.MAGIC_SKILLUP_RATE, 40)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 7)
    target:delMod(dsp.mod.FOOD_MP_CAP, 110)
    target:delMod(dsp.mod.MAGIC_SKILLUP_RATE, 40)
end
