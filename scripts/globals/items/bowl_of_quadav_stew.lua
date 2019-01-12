-----------------------------------------
-- ID: 4569
-- Item: Bowl of Quadav Stew
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Agility -4
-- Vitality 2
-- Defense % 17
-- Defense Cap 60
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4569)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.AGI, -4)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.FOOD_DEFP, 17)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 60)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, -4)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.FOOD_DEFP, 17)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 60)
end
