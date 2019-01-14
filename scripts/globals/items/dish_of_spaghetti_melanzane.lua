-----------------------------------------
-- ID: 5213
-- Item: dish_of_spaghetti_melanzane
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health % 25
-- Health Cap 100
-- Vitality 2
-- Store TP 6
-- Resist sleep 10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5213)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 25)
    target:addMod(dsp.mod.FOOD_HP_CAP, 100)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.STORETP, 6)
    target:addMod(dsp.mod.SLEEPRES, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 25)
    target:delMod(dsp.mod.FOOD_HP_CAP, 100)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.STORETP, 6)
    target:delMod(dsp.mod.SLEEPRES, 10)
end
