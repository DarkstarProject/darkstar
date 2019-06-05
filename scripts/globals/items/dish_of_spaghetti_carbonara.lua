-----------------------------------------
-- ID: 5190
-- Item: dish_of_spaghetti_carbonara
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health % 14
-- Health Cap 175
-- Magic 10
-- Strength 4
-- Vitality 2
-- Intelligence -3
-- Attack % 17
-- Attack Cap 65
-- Store TP 6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5190)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 14)
    target:addMod(dsp.mod.FOOD_HP_CAP, 175)
    target:addMod(dsp.mod.MP, 10)
    target:addMod(dsp.mod.STR, 4)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.INT, -3)
    target:addMod(dsp.mod.FOOD_ATTP, 17)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 65)
    target:addMod(dsp.mod.STORETP, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 14)
    target:delMod(dsp.mod.FOOD_HP_CAP, 175)
    target:delMod(dsp.mod.MP, 10)
    target:delMod(dsp.mod.STR, 4)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.INT, -3)
    target:delMod(dsp.mod.FOOD_ATTP, 17)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 65)
    target:delMod(dsp.mod.STORETP, 6)
end
