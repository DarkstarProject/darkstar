-----------------------------------------
-- ID: 5671
-- Item: Bowl of Loach Soup
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- Dexterity 4
-- Agility 4
-- Accuracy 7% Cap 50
-- Ranged Accuracy 7% Cap 50
-- HP 7% Cap 50
-- Evasion 5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5671)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.AGI, 4)
    target:addMod(dsp.mod.FOOD_ACCP, 7)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 50)
    target:addMod(dsp.mod.FOOD_RACCP, 7)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 50)
    target:addMod(dsp.mod.FOOD_HPP, 7)
    target:addMod(dsp.mod.FOOD_HP_CAP, 50)
    target:addMod(dsp.mod.EVA, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.AGI, 4)
    target:delMod(dsp.mod.FOOD_ACCP, 7)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 50)
    target:delMod(dsp.mod.FOOD_RACCP, 7)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 50)
    target:delMod(dsp.mod.FOOD_HPP, 7)
    target:delMod(dsp.mod.FOOD_HP_CAP, 50)
    target:delMod(dsp.mod.EVA, 5)
end
