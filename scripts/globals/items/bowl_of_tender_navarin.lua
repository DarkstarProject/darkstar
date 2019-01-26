-----------------------------------------
-- ID: 4284
-- Item: Bowl of Tender Navarin
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Health % 3 (cap 130)
-- Strength 3
-- Agility 1
-- Vitality 1
-- Intelligence -1
-- Attack % 27 (cap 35)
-- Ranged ATT % 27 (cap 35)
-- Evasion 5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4284)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 3)
    target:addMod(dsp.mod.FOOD_HP_CAP, 130)
    target:addMod(dsp.mod.STR, 3)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.VIT, 1)
    target:addMod(dsp.mod.INT, -1)
    target:addMod(dsp.mod.FOOD_ATTP, 27)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 35)
    target:addMod(dsp.mod.EVA, 5)
    target:addMod(dsp.mod.FOOD_RATTP, 27)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 35)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 3)
    target:delMod(dsp.mod.FOOD_HP_CAP, 130)
    target:delMod(dsp.mod.STR, 3)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.VIT, 1)
    target:delMod(dsp.mod.INT, -1)
    target:delMod(dsp.mod.FOOD_ATTP, 27)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 35)
    target:delMod(dsp.mod.EVA, 5)
    target:delMod(dsp.mod.FOOD_RATTP, 27)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 35)
end
