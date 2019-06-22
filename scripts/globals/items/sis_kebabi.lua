-----------------------------------------
-- ID: 5598
-- Item: sis_kebabi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 6
-- Vitality -2
-- Intelligence -2
-- Attack % 20
-- Attack Cap 70
-- Ranged ATT % 20
-- Ranged ATT Cap 70
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5598)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 6)
    target:addMod(dsp.mod.VIT, -2)
    target:addMod(dsp.mod.INT, -2)
    target:addMod(dsp.mod.FOOD_ATTP, 20)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 70)
    target:addMod(dsp.mod.FOOD_RATTP, 20)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 70)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 6)
    target:delMod(dsp.mod.VIT, -2)
    target:delMod(dsp.mod.INT, -2)
    target:delMod(dsp.mod.FOOD_ATTP, 20)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 70)
    target:delMod(dsp.mod.FOOD_RATTP, 20)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 70)
end
