-----------------------------------------
-- ID: 5679
-- Item: cathedral_salad
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- MP 15% Cap 90
-- Agility 7
-- Mind 7
-- Strength -5
-- Vitality -5
-- Ranged Accuracy +17
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.FOOD)) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5679)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_MPP, 15)
    target:addMod(dsp.mod.FOOD_MP_CAP, 90)
    target:addMod(dsp.mod.AGI, 7)
    target:addMod(dsp.mod.MND, 7)
    target:addMod(dsp.mod.STR, -5)
    target:addMod(dsp.mod.VIT, -5)
    target:addMod(dsp.mod.RACC, 17)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 15)
    target:delMod(dsp.mod.FOOD_MP_CAP, 90)
    target:delMod(dsp.mod.AGI, 7)
    target:delMod(dsp.mod.MND, 7)
    target:delMod(dsp.mod.STR, -5)
    target:delMod(dsp.mod.VIT, -5)
    target:delMod(dsp.mod.RACC, 17)
end
