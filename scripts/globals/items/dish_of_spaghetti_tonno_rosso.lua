-----------------------------------------
-- ID: 5623
-- Item: Dish of Spaghetti Tonno Rosso
-- Food Effect: 30 Mins, All Races
-----------------------------------------
-- Health % 13
-- Health Cap 180
-- Dexterity 1
-- Vitality 2
-- Store TP +6
-- hMP +1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5623)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 13)
    target:addMod(dsp.mod.FOOD_HP_CAP, 180)
    target:addMod(dsp.mod.DEX, 1)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.STORETP, 6)
    target:addMod(dsp.mod.HPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 13)
    target:delMod(dsp.mod.FOOD_HP_CAP, 180)
    target:delMod(dsp.mod.DEX, 1)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.STORETP, 6)
    target:delMod(dsp.mod.HPHEAL, 1)
end
