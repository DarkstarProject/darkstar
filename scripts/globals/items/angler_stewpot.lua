-----------------------------------------
-- ID: 5611
-- Item: Angler's Stewpot
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10% (cap 200)
-- MP +10
-- HP Recoverd while healing 5
-- MP Recovered while healing 1
-- Accuracy +15% Cap 15
-- Ranged Accuracy 15% Cap 15
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5611)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 10)
    target:addMod(dsp.mod.FOOD_HP_CAP, 200)
    target:addMod(dsp.mod.MP, 10)
    target:addMod(dsp.mod.HPHEAL, 5)
    target:addMod(dsp.mod.MPHEAL, 1)
    target:addMod(dsp.mod.FOOD_ACCP, 15)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 15)
    target:addMod(dsp.mod.FOOD_RACCP, 15)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 15)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 10)
    target:delMod(dsp.mod.FOOD_HP_CAP, 200)
    target:delMod(dsp.mod.MP, 10)
    target:delMod(dsp.mod.HPHEAL, 5)
    target:delMod(dsp.mod.MPHEAL, 1)
    target:delMod(dsp.mod.FOOD_ACCP, 15)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 15)
    target:delMod(dsp.mod.FOOD_RACCP, 15)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 15)
end
