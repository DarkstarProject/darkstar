-----------------------------------------
-- ID: 5201
-- Item: dish_of_spaghetti_boscaiola_+1
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health % 18
-- Health Cap 130
-- Magic 40
-- Strength -5
-- Dexterity -2
-- Vitality 2
-- Mind 4
-- Store TP +6
-- Magic Regen While Healing 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5201)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 18)
    target:addMod(dsp.mod.FOOD_HP_CAP, 130)
    target:addMod(dsp.mod.MP, 40)
    target:addMod(dsp.mod.STR, -5)
    target:addMod(dsp.mod.DEX, -2)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.MND, 4)
    target:addMod(dsp.mod.STORETP, 6)
    target:addMod(dsp.mod.MPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 18)
    target:delMod(dsp.mod.FOOD_HP_CAP, 130)
    target:delMod(dsp.mod.MP, 40)
    target:delMod(dsp.mod.STR, -5)
    target:delMod(dsp.mod.DEX, -2)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.MND, 4)
    target:delMod(dsp.mod.STORETP, 6)
    target:delMod(dsp.mod.MPHEAL, 1)
end
