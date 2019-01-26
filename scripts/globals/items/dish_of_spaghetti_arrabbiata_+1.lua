-----------------------------------------
-- ID: 5212
-- Item: dish_of_spaghetti_arrabbiata_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP +17% (cap 150)
-- Strength 5
-- Vitality 2
-- Intelligence -7
-- Attack +23% (cap 100)
-- Ranged Attack +23% (cap 100)
-- Store TP +6
-- Sleep resistance +8
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5212)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 17)
    target:addMod(dsp.mod.FOOD_HP_CAP, 150)
    target:addMod(dsp.mod.STR, 5)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.INT, -7)
    target:addMod(dsp.mod.FOOD_ATTP, 23)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 100)
    target:addMod(dsp.mod.FOOD_RATTP, 23)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 100)
    target:addMod(dsp.mod.STORETP, 6)
    target:addMod(dsp.mod.SLEEPRES, 8)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 17)
    target:delMod(dsp.mod.FOOD_HP_CAP, 150)
    target:delMod(dsp.mod.STR, 5)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.INT, -7)
    target:delMod(dsp.mod.FOOD_ATTP, 23)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 100)
    target:delMod(dsp.mod.FOOD_RATTP, 23)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 100)
    target:delMod(dsp.mod.STORETP, 6)
    target:delMod(dsp.mod.SLEEPRES, 8)
end
