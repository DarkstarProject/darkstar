-----------------------------------------
-- ID: 5199
-- Item: dish_of_spaghetti_carbonara_+1
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health % 14
-- Health Cap 180
-- Magic 15
-- Strength 4
-- Vitality 2
-- Intelligence -3
-- Attack % 17
-- Attack Cap 70
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5199)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 14)
    target:addMod(dsp.mod.FOOD_HP_CAP, 180)
    target:addMod(dsp.mod.MP, 15)
    target:addMod(dsp.mod.STR, 4)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.INT, -3)
    target:addMod(dsp.mod.FOOD_ATTP, 17)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 70)
    target:addMod(dsp.mod.STORETP, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 14)
    target:delMod(dsp.mod.FOOD_HP_CAP, 180)
    target:delMod(dsp.mod.MP, 15)
    target:delMod(dsp.mod.STR, 4)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.INT, -3)
    target:delMod(dsp.mod.FOOD_ATTP, 17)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 70)
    target:delMod(dsp.mod.STORETP, 6)
end
