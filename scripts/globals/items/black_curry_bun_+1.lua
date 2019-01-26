-----------------------------------------
-- ID: 5764
-- Item: black_curry_bun+1
-- Food Effect: 60 min, All Races
-----------------------------------------
-- TODO: Group effects
-- Dexterity +4
-- Vitality +6
-- Intelligence +3
-- Mind +1
-- Accuracy +7
-- Ranged Accuracy +7
-- Evasion +7
-- Defense +25% (cap 200)
-- Resist Sleep +5
-- hHP +6
-- hMP +3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5764)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.VIT, 6)
    target:addMod(dsp.mod.INT, 3)
    target:addMod(dsp.mod.MND, 1)
    target:addMod(dsp.mod.ACC, 7)
    target:addMod(dsp.mod.RACC, 7)
    target:addMod(dsp.mod.EVA, 7)
    target:addMod(dsp.mod.FOOD_DEFP, 25)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 200)
    target:addMod(dsp.mod.SLEEPRES, 5)
    target:addMod(dsp.mod.HPHEAL, 6)
    target:addMod(dsp.mod.MPHEAL, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.VIT, 6)
    target:delMod(dsp.mod.INT, 3)
    target:delMod(dsp.mod.MND, 1)
    target:delMod(dsp.mod.ACC, 7)
    target:delMod(dsp.mod.RACC, 7)
    target:delMod(dsp.mod.EVA, 7)
    target:delMod(dsp.mod.FOOD_DEFP, 25)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 200)
    target:delMod(dsp.mod.SLEEPRES, 5)
    target:delMod(dsp.mod.HPHEAL, 6)
    target:delMod(dsp.mod.MPHEAL, 3)
end