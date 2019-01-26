-----------------------------------------
-- ID: 5584
-- Item: plate_of_ic_pilav
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health % 14
-- Health Cap 65
-- Strength 4
-- Vitality -1
-- Intelligence -1
-- Health Regen While Healing 1
-- Attack % 22
-- Attack Cap 65
-- Ranged ATT % 22
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5584)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 14)
    target:addMod(dsp.mod.FOOD_HP_CAP, 65)
    target:addMod(dsp.mod.STR, 4)
    target:addMod(dsp.mod.VIT, -1)
    target:addMod(dsp.mod.INT, -1)
    target:addMod(dsp.mod.HPHEAL, 1)
    target:addMod(dsp.mod.FOOD_ATTP, 22)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 65)
    target:addMod(dsp.mod.FOOD_RATTP, 22)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 65)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 14)
    target:delMod(dsp.mod.FOOD_HP_CAP, 65)
    target:delMod(dsp.mod.STR, 4)
    target:delMod(dsp.mod.VIT, -1)
    target:delMod(dsp.mod.INT, -1)
    target:delMod(dsp.mod.HPHEAL, 1)
    target:delMod(dsp.mod.FOOD_ATTP, 22)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 65)
    target:delMod(dsp.mod.FOOD_RATTP, 22)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 65)
end
