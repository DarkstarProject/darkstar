-----------------------------------------
-- ID: 5772
-- Item: crepe_paysanne
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- HP +10% (cap 30)
-- STR +2
-- VIT +1
-- Magic Accuracy +15
-- Magic Defense +4
-- hHP +3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5772)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 10)
    target:addMod(dsp.mod.FOOD_HP_CAP, 30)
    target:addMod(dsp.mod.STR, 2)
    target:addMod(dsp.mod.VIT, 1)
    target:addMod(dsp.mod.MACC, 15)
    target:addMod(dsp.mod.MDEF, 4)
    target:addMod(dsp.mod.HPHEAL, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 10)
    target:delMod(dsp.mod.FOOD_HP_CAP, 30)
    target:delMod(dsp.mod.STR, 2)
    target:delMod(dsp.mod.VIT, 1)
    target:delMod(dsp.mod.MACC, 15)
    target:delMod(dsp.mod.MDEF, 4)
    target:delMod(dsp.mod.HPHEAL, 3)
end
