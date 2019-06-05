-----------------------------------------
-- ID: 5670
-- Item: Bowl of Loach Gruel
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Make Group Effect
-- Dexterity 2
-- Agility 2
-- Accuracy 7% Cap 30
-- Ranged Accuracy 7% Cap 30
-- HP 7% Cap 30
-- Evasion 4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5670)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.DEX, 2)
    target:addMod(dsp.mod.AGI, 2)
    target:addMod(dsp.mod.FOOD_ACCP, 7)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 30)
    target:addMod(dsp.mod.FOOD_RACCP, 7)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 30)
    target:addMod(dsp.mod.FOOD_HPP, 7)
    target:addMod(dsp.mod.FOOD_HP_CAP, 30)
    target:addMod(dsp.mod.EVA, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 2)
    target:delMod(dsp.mod.AGI, 2)
    target:delMod(dsp.mod.FOOD_ACCP, 7)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 30)
    target:delMod(dsp.mod.FOOD_RACCP, 7)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 30)
    target:delMod(dsp.mod.FOOD_HPP, 7)
    target:delMod(dsp.mod.FOOD_HP_CAP, 30)
    target:delMod(dsp.mod.EVA, 4)
end
