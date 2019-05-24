-----------------------------------------
-- ID: 4561
-- Item: Bowl of Seafood Stew
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health 20
-- Dexterity 1
-- Vitality 5
-- Defense % 25
-- Defense Cap 120
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4561)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 20)
    target:addMod(dsp.mod.DEX, 1)
    target:addMod(dsp.mod.VIT, 5)
    target:addMod(dsp.mod.FOOD_DEFP, 25)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 120)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 20)
    target:delMod(dsp.mod.DEX, 1)
    target:delMod(dsp.mod.VIT, 5)
    target:delMod(dsp.mod.FOOD_DEFP, 25)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 120)
end
