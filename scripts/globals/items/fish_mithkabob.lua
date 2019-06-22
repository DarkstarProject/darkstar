-----------------------------------------
-- ID: 4398
-- Item: fish_mithkabob
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 1
-- Vitality 2
-- Mind -1
-- Defense % 25
-- Defense Cap 90
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4398)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 1)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.MND, -1)
    target:addMod(dsp.mod.FOOD_DEFP, 25)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 90)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 1)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.MND, -1)
    target:delMod(dsp.mod.FOOD_DEFP, 25)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 90)
end
