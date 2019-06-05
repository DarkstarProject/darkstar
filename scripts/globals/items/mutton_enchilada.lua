-----------------------------------------
-- ID: 4348
-- Item: mutton_enchilada
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Magic 10
-- Strength 3
-- Vitality 1
-- Intelligence -1
-- Attack % 27
-- Attack Cap 35
-- Ranged ATT % 27
-- Ranged ATT Cap 35
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4348)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.MP, 10)
    target:addMod(dsp.mod.STR, 3)
    target:addMod(dsp.mod.VIT, 1)
    target:addMod(dsp.mod.INT, -1)
    target:addMod(dsp.mod.FOOD_ATTP, 27)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 35)
    target:addMod(dsp.mod.FOOD_RATTP, 27)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 35)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 10)
    target:delMod(dsp.mod.STR, 3)
    target:delMod(dsp.mod.VIT, 1)
    target:delMod(dsp.mod.INT, -1)
    target:delMod(dsp.mod.FOOD_ATTP, 27)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 35)
    target:delMod(dsp.mod.FOOD_RATTP, 27)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 35)
end
