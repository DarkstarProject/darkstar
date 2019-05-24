-----------------------------------------
-- ID: 4578
-- Item: sausage
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health % 3 (cap 130)
-- Strength 3
-- Intelligence -1
-- Attack % 27
-- Attack Cap 30
-- Ranged ATT % 27
-- Ranged ATT Cap 30
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4578)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 3)
    target:addMod(dsp.mod.FOOD_HP_CAP, 130)
    target:addMod(dsp.mod.STR, 3)
    target:addMod(dsp.mod.INT, -1)
    target:addMod(dsp.mod.FOOD_ATTP, 27)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 30)
    target:addMod(dsp.mod.FOOD_RATTP, 27)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 30)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 3)
    target:delMod(dsp.mod.FOOD_HP_CAP, 130)
    target:delMod(dsp.mod.STR, 3)
    target:delMod(dsp.mod.INT, -1)
    target:delMod(dsp.mod.FOOD_ATTP, 27)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 30)
    target:delMod(dsp.mod.FOOD_RATTP, 27)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 30)
end
