-----------------------------------------
-- ID: 5613
-- Item: Prized Angler's Stewpot
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10% (cap 200)
-- MP +20
-- Dexterity 4
-- Agility 2
-- Mind 2
-- HP Recovered while healing 9
-- MP Recovered while healing 3
-- Accuracy 15% Cap 45
-- Ranged Accuracy 15% Cap 45
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5613)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 10)
    target:addMod(dsp.mod.FOOD_HP_CAP, 200)
    target:addMod(dsp.mod.MP, 20)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.AGI, 2)
    target:addMod(dsp.mod.MND, 2)
    target:addMod(dsp.mod.HPHEAL, 9)
    target:addMod(dsp.mod.MPHEAL, 3)
    target:addMod(dsp.mod.FOOD_ACCP, 15)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 45)
    target:addMod(dsp.mod.FOOD_RACCP, 15)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 45)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 10)
    target:delMod(dsp.mod.FOOD_HP_CAP, 200)
    target:delMod(dsp.mod.MP, 20)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.AGI, 2)
    target:delMod(dsp.mod.MND, 2)
    target:delMod(dsp.mod.HPHEAL, 9)
    target:delMod(dsp.mod.MPHEAL, 3)
    target:delMod(dsp.mod.FOOD_ACCP, 15)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 45)
    target:delMod(dsp.mod.FOOD_RACCP, 15)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 45)
end
