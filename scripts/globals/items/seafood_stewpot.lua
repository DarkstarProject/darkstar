-----------------------------------------
-- ID: 5238
-- Item: Seafood Stewpot
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10% Cap 50
-- MP +10
-- Accuracy 5
-- Ranged Accuracy 5
-- Evasion 5
-- hHP 5
-- hMP 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5238)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 10)
    target:addMod(dsp.mod.FOOD_HP_CAP, 50)
    target:addMod(dsp.mod.MP, 10)
    target:addMod(dsp.mod.ACC, 5)
    target:addMod(dsp.mod.RACC, 5)
    target:addMod(dsp.mod.EVA, 5)
    target:addMod(dsp.mod.HPHEAL, 5)
    target:addMod(dsp.mod.MPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 10)
    target:delMod(dsp.mod.FOOD_HP_CAP, 50)
    target:delMod(dsp.mod.MP, 10)
    target:delMod(dsp.mod.ACC, 5)
    target:delMod(dsp.mod.RACC, 5)
    target:delMod(dsp.mod.EVA, 5)
    target:delMod(dsp.mod.HPHEAL, 5)
    target:delMod(dsp.mod.MPHEAL, 1)
end
