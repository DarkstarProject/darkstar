-----------------------------------------
-- ID: 5771
-- Item: ham_and_cheese_crepe
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- HP +10% (cap 25)
-- STR +2
-- VIT +1
-- Magic Accuracy +10
-- Magic Defense +3
-- hHP +2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5771)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 10)
    target:addMod(dsp.mod.FOOD_HP_CAP, 25)
    target:addMod(dsp.mod.STR, 2)
    target:addMod(dsp.mod.VIT, 1)
    target:addMod(dsp.mod.MACC, 10)
    target:addMod(dsp.mod.MDEF, 3)
    target:addMod(dsp.mod.HPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 10)
    target:delMod(dsp.mod.FOOD_HP_CAP, 25)
    target:delMod(dsp.mod.STR, 2)
    target:delMod(dsp.mod.VIT, 1)
    target:delMod(dsp.mod.MACC, 10)
    target:delMod(dsp.mod.MDEF, 3)
    target:delMod(dsp.mod.HPHEAL, 2)
end
