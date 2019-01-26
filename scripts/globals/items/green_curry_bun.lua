-----------------------------------------
-- ID: 5756
-- Item: green_curry_bun
-- Food Effect: 30 min, All Races
-----------------------------------------
-- TODO: Group effects
-- VIT +1
-- AGI +2
-- Ranged Accuracy +5% (cap 25)
-- DEF +9% (cap 160)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5756)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.VIT, 1)
    target:addMod(dsp.mod.AGI, 2)
    target:addMod(dsp.mod.FOOD_RACCP, 5)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 25)
    target:addMod(dsp.mod.FOOD_DEFP, 9)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 160)
    target:addMod(dsp.mod.SLEEPRES, 3)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.MPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, 1)
    target:delMod(dsp.mod.AGI, 2)
    target:delMod(dsp.mod.FOOD_RACCP, 5)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 25)
    target:delMod(dsp.mod.FOOD_DEFP, 9)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 160)
    target:delMod(dsp.mod.SLEEPRES, 3)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.MPHEAL, 1)
end
