-----------------------------------------
-- ID: 4547
-- Item: Bowl of Boiled Cockatrice
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Strength 5
-- Agility 2
-- Intelligence -2
-- Mind 1
-- Attack % 22
-- Attack Cap 60
-- Ranged ATT % 22
-- Ranged ATT Cap 60
-- Resist petrify +4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4547)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR, 5)
    target:addMod(dsp.mod.AGI, 2)
    target:addMod(dsp.mod.INT, -2)
    target:addMod(dsp.mod.MND, 1)
    target:addMod(dsp.mod.FOOD_ATTP, 22)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 60)
    target:addMod(dsp.mod.FOOD_RATTP, 22)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 60)
    target:addMod(dsp.mod.PETRIFYRES, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 5)
    target:delMod(dsp.mod.AGI, 2)
    target:delMod(dsp.mod.INT, -2)
    target:delMod(dsp.mod.MND, 1)
    target:delMod(dsp.mod.FOOD_ATTP, 22)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 60)
    target:delMod(dsp.mod.FOOD_RATTP, 22)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 60)
    target:delMod(dsp.mod.PETRIFYRES, 4)
end
