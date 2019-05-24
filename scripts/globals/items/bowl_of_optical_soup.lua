-----------------------------------------
-- ID: 4340
-- Item: bowl_of_optical_soup
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- HP % 6 (cap 75)
-- Charisma -15
-- HP Recovered While Healing 5
-- Accuracy 15
-- Ranged Accuracy 15
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4340)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 6)
    target:addMod(dsp.mod.FOOD_HP_CAP, 75)
    target:addMod(dsp.mod.CHR, -15)
    target:addMod(dsp.mod.HPHEAL, 5)
    target:addMod(dsp.mod.ACC, 15)
    target:addMod(dsp.mod.RACC, 15)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 6)
    target:delMod(dsp.mod.FOOD_HP_CAP, 75)
    target:delMod(dsp.mod.CHR, -15)
    target:delMod(dsp.mod.HPHEAL, 5)
    target:delMod(dsp.mod.ACC, 15)
    target:delMod(dsp.mod.RACC, 15)
end
