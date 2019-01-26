-----------------------------------------
-- ID: 4395
-- Item: galkan_sausage
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Multi-Race Effects
-- Galka
-- Strength 3
-- Intelligence -1
-- Attack % 25
-- Attack Cap 30
-- Ranged ATT % 25
-- Ranged ATT Cap 30
--
-- Other
-- Strength 3
-- Intelligence -4
-- Attack 9
-- Ranged ATT  9
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4395)
end

function onEffectGain(target,effect)
    if (target:getRace() ~= dsp.race.GALKA) then
        target:addMod(dsp.mod.STR, 3)
        target:addMod(dsp.mod.INT, -4)
        target:addMod(dsp.mod.ATT, 9)
        target:addMod(dsp.mod.RATT, 9)
    else
        target:addMod(dsp.mod.STR, 3)
        target:addMod(dsp.mod.INT, -1)
        target:addMod(dsp.mod.FOOD_ATTP, 25)
        target:addMod(dsp.mod.FOOD_ATT_CAP, 30)
        target:addMod(dsp.mod.FOOD_RATTP, 25)
        target:addMod(dsp.mod.FOOD_RATT_CAP, 30)
    end
end

function onEffectLose(target, effect)
    if (target:getRace() ~= dsp.race.GALKA) then
        target:delMod(dsp.mod.STR, 3)
        target:delMod(dsp.mod.INT, -4)
        target:delMod(dsp.mod.ATT, 9)
        target:delMod(dsp.mod.RATT, 9)
    else
        target:delMod(dsp.mod.STR, 3)
        target:delMod(dsp.mod.INT, -1)
        target:delMod(dsp.mod.FOOD_ATTP, 25)
        target:delMod(dsp.mod.FOOD_ATT_CAP, 30)
        target:delMod(dsp.mod.FOOD_RATTP, 25)
        target:delMod(dsp.mod.FOOD_RATT_CAP, 30)
    end
end
