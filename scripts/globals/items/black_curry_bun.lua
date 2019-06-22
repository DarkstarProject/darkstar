-----------------------------------------
-- ID: 5758
-- Item: black_curry_bun
-- Food Effect: 30minutes, All Races
-----------------------------------------
-- TODO: Group effects
-- DEX +2
-- VIT +4
-- INT +1
-- Accuracy +5
-- Ranged Accuracy +5
-- Evasion +5
-- DEF +15% (cap 180)
-- Resist Sleep +3
-- hHP +2
-- hMP +1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5758)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 2)
    target:addMod(dsp.mod.VIT, 4)
    target:addMod(dsp.mod.INT, 1)
    target:addMod(dsp.mod.ACC, 5)
    target:addMod(dsp.mod.RACC, 5)
    target:addMod(dsp.mod.EVA, 5)
    target:addMod(dsp.mod.FOOD_DEFP, 15)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 180)
    target:addMod(dsp.mod.SLEEPRES, 3)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.MPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 2)
    target:delMod(dsp.mod.VIT, 4)
    target:delMod(dsp.mod.INT, 1)
    target:delMod(dsp.mod.ACC, 5)
    target:delMod(dsp.mod.RACC, 5)
    target:delMod(dsp.mod.EVA, 5)
    target:delMod(dsp.mod.FOOD_DEFP, 15)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 180)
    target:delMod(dsp.mod.SLEEPRES, 3)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.MPHEAL, 1)
end