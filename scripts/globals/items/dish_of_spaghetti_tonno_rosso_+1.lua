-----------------------------------------
-- ID: 5624
-- Item: Dish of Spaghetti Tonno Rosso +1
-- Food Effect: 60 Mins, All Races
-----------------------------------------
-- Health % 13
-- Health Cap 185
-- Dexterity 2
-- Vitality 3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,7200,5624)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 13)
    target:addMod(dsp.mod.FOOD_HP_CAP, 185)
    target:addMod(dsp.mod.DEX, 2)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.STORETP, 6)
    target:addMod(dsp.mod.HPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 13)
    target:delMod(dsp.mod.FOOD_HP_CAP, 185)
    target:delMod(dsp.mod.DEX, 2)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.STORETP, 6)
    target:delMod(dsp.mod.HPHEAL, 1)
end
