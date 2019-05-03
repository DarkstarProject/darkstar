-----------------------------------------
-- ID: 5600
-- Item: Balik Sis
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 4
-- Mind -2
-- Attack % 13
-- Attack Cap 65
-- Ranged ACC 1
-- Ranged ATT % 13
-- Ranged ATT Cap 65
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5600)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.MND, -2)
    target:addMod(dsp.mod.FOOD_ATTP, 13)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 65)
    target:addMod(dsp.mod.RACC, 1)
    target:addMod(dsp.mod.FOOD_RATTP, 13)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 65)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.MND, -2)
    target:delMod(dsp.mod.FOOD_ATTP, 13)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 65)
    target:delMod(dsp.mod.RACC, 1)
    target:delMod(dsp.mod.FOOD_RATTP, 13)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 65)
end
