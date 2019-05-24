-----------------------------------------
-- ID: 4350
-- Item: dragon_steak
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health 25
-- Strength 7
-- Intelligence -3
-- Health Regen While Healing 2
-- MP recovered while healing +2
-- Attack % 20
-- Attack Cap 150
-- Ranged ATT % 20
-- Ranged ATT Cap 150
-- Demon Killer 5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4350)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 25)
    target:addMod(dsp.mod.STR, 7)
    target:addMod(dsp.mod.INT, -3)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.MPHEAL, 2)
    target:addMod(dsp.mod.FOOD_ATTP, 20)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 150)
    target:addMod(dsp.mod.FOOD_RATTP, 20)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 150)
    target:addMod(dsp.mod.DEMON_KILLER, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 25)
    target:delMod(dsp.mod.STR, 7)
    target:delMod(dsp.mod.INT, -3)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.MPHEAL, 2)
    target:delMod(dsp.mod.FOOD_ATTP, 20)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 150)
    target:delMod(dsp.mod.FOOD_RATTP, 20)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 150)
    target:delMod(dsp.mod.DEMON_KILLER, 5)
end
