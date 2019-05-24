-----------------------------------------
-- ID: 5640
-- Item: M&P Cracker
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Vitality 5
-- Mind -5
-- Defense % 25
-- Attack Cap 154
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,180,5640)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.VIT, 5)
    target:addMod(dsp.mod.MND, -5)
    target:addMod(dsp.mod.FOOD_DEFP, 25)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 154)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, 5)
    target:delMod(dsp.mod.MND, -5)
    target:delMod(dsp.mod.FOOD_DEFP, 25)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 154)
end
