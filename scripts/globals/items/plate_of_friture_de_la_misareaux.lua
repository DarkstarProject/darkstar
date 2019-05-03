-----------------------------------------
-- ID: 5159
-- Item: plate_of_friture_de_la_misareaux
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Dexterity 3
-- Vitality 3
-- Mind -3
-- Defense 5
-- Ranged ATT % 7
-- Ranged ATT Cap 15
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5159)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 3)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.MND, -3)
    target:addMod(dsp.mod.DEF, 5)
    target:addMod(dsp.mod.FOOD_RATTP, 7)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 15)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 3)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.MND, -3)
    target:delMod(dsp.mod.DEF, 5)
    target:delMod(dsp.mod.FOOD_RATTP, 7)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 15)
end
