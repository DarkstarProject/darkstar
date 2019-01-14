-----------------------------------------
-- ID: 4554
-- Item: serving_of_shallops_tropicale
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Magic 20
-- Dexterity 1
-- Vitality 4
-- Intelligence 1
-- Defense % 25
-- Defense Cap 100
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4554)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.MP, 20)
    target:addMod(dsp.mod.DEX, 1)
    target:addMod(dsp.mod.VIT, 4)
    target:addMod(dsp.mod.INT, 1)
    target:addMod(dsp.mod.FOOD_DEFP, 25)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 100)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 20)
    target:delMod(dsp.mod.DEX, 1)
    target:delMod(dsp.mod.VIT, 4)
    target:delMod(dsp.mod.INT, 1)
    target:delMod(dsp.mod.FOOD_DEFP, 25)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 100)
end
