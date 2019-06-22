-----------------------------------------
-- ID: 5612
-- Item: Prime Angler Stewpot
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10% (cap 200)
-- MP +15
-- Dexterity 2
-- Agility 1
-- Mind 1
-- HP Recovered while healing 7
-- MP Recovered while healing 2
-- Accuracy 15% Cap 30
-- Ranged Accuracy 15% Cap 30
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5612)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 10)
    target:addMod(dsp.mod.FOOD_HP_CAP, 200)
    target:addMod(dsp.mod.MP, 15)
    target:addMod(dsp.mod.DEX, 2)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.MND, 1)
    target:addMod(dsp.mod.HPHEAL, 7)
    target:addMod(dsp.mod.MPHEAL, 2)
    target:addMod(dsp.mod.FOOD_ACCP, 15)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 30)
    target:addMod(dsp.mod.FOOD_RACCP, 15)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 30)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 10)
    target:delMod(dsp.mod.FOOD_HP_CAP, 200)
    target:delMod(dsp.mod.MP, 15)
    target:delMod(dsp.mod.DEX, 2)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.MND, 1)
    target:delMod(dsp.mod.HPHEAL, 7)
    target:delMod(dsp.mod.MPHEAL, 2)
    target:delMod(dsp.mod.FOOD_ACCP, 15)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 30)
    target:delMod(dsp.mod.FOOD_RACCP, 15)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 30)
end
