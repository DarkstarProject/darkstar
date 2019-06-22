-----------------------------------------
-- ID: 5167
-- Item: coeurl_sub_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Magic 15
-- Strength 5
-- Agility 1
-- Intelligence -2
-- Health Regen While Healing 1
-- Attack % 22
-- Attack Cap 80
-- Ranged ATT % 22
-- Ranged ATT Cap 80
-- Sleep Resist 1
-- Stun Resist 4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5167)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 15)
    target:addMod(dsp.mod.STR, 5)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.INT, -2)
    target:addMod(dsp.mod.HPHEAL, 1)
    target:addMod(dsp.mod.FOOD_ATTP, 22)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 80)
    target:addMod(dsp.mod.FOOD_RATTP, 22)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 80)
    target:addMod(dsp.mod.SLEEPRES, 1)
    target:addMod(dsp.mod.STUNRES, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 15)
    target:delMod(dsp.mod.STR, 5)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.INT, -2)
    target:delMod(dsp.mod.HPHEAL, 1)
    target:delMod(dsp.mod.FOOD_ATTP, 22)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 80)
    target:delMod(dsp.mod.FOOD_RATTP, 22)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 80)
    target:delMod(dsp.mod.SLEEPRES, 1)
    target:delMod(dsp.mod.STUNRES, 4)
end
