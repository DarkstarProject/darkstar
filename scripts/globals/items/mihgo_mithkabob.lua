-----------------------------------------
-- ID: 5708
-- Item: Mihgo Mithkabob
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- Dexterity 5
-- Vitality 2
-- Mind -2
-- Accuracy +50
-- Ranged Accuracy +50
-- Evasion +5
-- Defense % 25 (cap 95)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5708)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.DEX, 5)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.MND, -2)
    target:addMod(dsp.mod.ACC, 50)
    target:addMod(dsp.mod.RACC, 50)
    target:addMod(dsp.mod.EVA, 5)
    target:addMod(dsp.mod.FOOD_DEFP, 25)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 95)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 5)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.MND, -2)
    target:delMod(dsp.mod.ACC, 50)
    target:delMod(dsp.mod.RACC, 50)
    target:delMod(dsp.mod.EVA, 5)
    target:delMod(dsp.mod.FOOD_DEFP, 25)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 95)
end
