-----------------------------------------
-- ID: 4322
-- Item: dhalmel_pie_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 25
-- Strength 4
-- Agility 2
-- Vitality 1
-- Intelligence -2
-- Mind 1
-- Attack % 25
-- Attack Cap 50
-- Ranged ATT % 25
-- Ranged ATT Cap 50
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4322)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 25)
    target:addMod(dsp.mod.STR, 4)
    target:addMod(dsp.mod.AGI, 2)
    target:addMod(dsp.mod.VIT, 1)
    target:addMod(dsp.mod.INT, -2)
    target:addMod(dsp.mod.MND, 1)
    target:addMod(dsp.mod.FOOD_ATTP, 25)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 50)
    target:addMod(dsp.mod.FOOD_RATTP, 25)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 50)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 25)
    target:delMod(dsp.mod.STR, 4)
    target:delMod(dsp.mod.AGI, 2)
    target:delMod(dsp.mod.VIT, 1)
    target:delMod(dsp.mod.INT, -2)
    target:delMod(dsp.mod.MND, 1)
    target:delMod(dsp.mod.FOOD_ATTP, 25)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 50)
    target:delMod(dsp.mod.FOOD_RATTP, 25)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 50)
end
