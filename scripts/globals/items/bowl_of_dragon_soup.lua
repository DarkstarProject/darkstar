-----------------------------------------
-- ID: 4549
-- Item: Bowl of Dragon Soup
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health 20
-- Strength 7
-- Agility 2
-- Vitality 2
-- Intelligence -3
-- Health Regen While Healing 8
-- Attack % 22
-- Attack Cap 150
-- Ranged ATT % 22
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4549)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 20)
    target:addMod(dsp.mod.STR, 7)
    target:addMod(dsp.mod.AGI, 2)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.INT, -3)
    target:addMod(dsp.mod.HPHEAL, 8)
    target:addMod(dsp.mod.FOOD_ATTP, 22)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 150)
    target:addMod(dsp.mod.FOOD_RATTP, 22)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 150)
    target:addMod(dsp.mod.DEMON_KILLER, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 20)
    target:delMod(dsp.mod.STR, 7)
    target:delMod(dsp.mod.AGI, 2)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.INT, -3)
    target:delMod(dsp.mod.HPHEAL, 8)
    target:delMod(dsp.mod.FOOD_ATTP, 22)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 150)
    target:delMod(dsp.mod.FOOD_RATTP, 22)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 150)
    target:delMod(dsp.mod.DEMON_KILLER, 5)
end
