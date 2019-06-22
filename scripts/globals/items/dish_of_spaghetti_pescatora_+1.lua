-----------------------------------------
-- ID: 5200
-- Item: dish_of_spaghetti_pescatora_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health % 15
-- Health Cap 160
-- Vitality 3
-- Mind -1
-- Defense % 22
-- Defense Cap 70
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5200)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 15)
    target:addMod(dsp.mod.FOOD_HP_CAP, 160)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.MND, -1)
    target:addMod(dsp.mod.FOOD_DEFP, 22)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 70)
    target:addMod(dsp.mod.STORETP, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 15)
    target:delMod(dsp.mod.FOOD_HP_CAP, 160)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.MND, -1)
    target:delMod(dsp.mod.FOOD_DEFP, 22)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 70)
    target:delMod(dsp.mod.STORETP, 6)
end
