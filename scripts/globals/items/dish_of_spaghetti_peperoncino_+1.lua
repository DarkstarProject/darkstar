-----------------------------------------
-- ID: 5197
-- Item: dish_of_spaghetti_peperoncino_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health % 30
-- Health Cap 75
-- Vitality 2
-- Store TP 6
-- Resist virus +12
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5197)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 30)
    target:addMod(dsp.mod.FOOD_HP_CAP, 75)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.STORETP, 6)
    target:addMod(dsp.mod.VIRUSRES, 12)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 30)
    target:delMod(dsp.mod.FOOD_HP_CAP, 75)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.STORETP, 6)
    target:delMod(dsp.mod.VIRUSRES, 12)
end
