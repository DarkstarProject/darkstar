-----------------------------------------
-- ID: 5773
-- Item: mushroom_crepe
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Mind 2
-- MP % 10 (cap 30)
-- Magic Accuracy +10
-- Magic Def. Bonus +5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5773)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MND, 2)
    target:addMod(dsp.mod.FOOD_MPP, 10)
    target:addMod(dsp.mod.FOOD_MP_CAP, 30)
    target:addMod(dsp.mod.MACC, 10)
    target:addMod(dsp.mod.MDEF, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MND, 2)
    target:delMod(dsp.mod.FOOD_MPP, 10)
    target:delMod(dsp.mod.FOOD_MP_CAP, 30)
    target:delMod(dsp.mod.MACC, 10)
    target:delMod(dsp.mod.MDEF, 5)
end
