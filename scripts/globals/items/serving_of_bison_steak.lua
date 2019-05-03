-----------------------------------------
-- ID: 5142
-- Item: serving_of_bison_steak
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Strength 6
-- Agility 1
-- Intelligence -3
-- Attack % 18
-- Attack Cap 90
-- Ranged ATT % 18
-- Ranged ATT Cap 90
-- Lizard Killer 5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5142)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR, 6)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.INT, -3)
    target:addMod(dsp.mod.FOOD_ATTP, 18)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 90)
    target:addMod(dsp.mod.FOOD_RATTP, 18)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 90)
    target:addMod(dsp.mod.LIZARD_KILLER, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 6)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.INT, -3)
    target:delMod(dsp.mod.FOOD_ATTP, 18)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 90)
    target:delMod(dsp.mod.FOOD_RATTP, 18)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 90)
    target:delMod(dsp.mod.LIZARD_KILLER, 5)
end
