-----------------------------------------
-- ID: 5239
-- Item: Prime Seafood Stewpot
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10% Cap 75
-- MP +15
-- Dexterity 1
-- Vitality 1
-- Agility 1
-- Mind 1
-- HP Recovered while healing 7
-- MP Recovered while healing 2
-- Accuracy 6
-- Ranged Accuracy 6
-- Evasion 6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5239)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 10)
    target:addMod(dsp.mod.FOOD_HP_CAP, 75)
    target:addMod(dsp.mod.MP, 15)
    target:addMod(dsp.mod.DEX, 1)
    target:addMod(dsp.mod.VIT, 1)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.MND, 1)
    target:addMod(dsp.mod.HPHEAL, 7)
    target:addMod(dsp.mod.MPHEAL, 2)
    target:addMod(dsp.mod.ACC, 6)
    target:addMod(dsp.mod.RACC, 6)
    target:addMod(dsp.mod.EVA, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 10)
    target:delMod(dsp.mod.FOOD_HP_CAP, 75)
    target:delMod(dsp.mod.MP, 15)
    target:delMod(dsp.mod.DEX, 1)
    target:delMod(dsp.mod.VIT, 1)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.MND, 1)
    target:delMod(dsp.mod.HPHEAL, 7)
    target:delMod(dsp.mod.MPHEAL, 2)
    target:delMod(dsp.mod.ACC, 6)
    target:delMod(dsp.mod.RACC, 6)
    target:delMod(dsp.mod.EVA, 6)
end
