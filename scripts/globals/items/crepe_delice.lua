-----------------------------------------
-- ID: 5767
-- Item: Crepe Delice
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- HP +10% (cap 15)
-- Magic Accuracy +21% (cap 30)
-- Magic Defense +2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5767)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 10)
    target:addMod(dsp.mod.FOOD_HP_CAP, 15)
    target:addMod(dsp.mod.MDEF, 2)
    target:addMod(dsp.mod.FOOD_MACCP, 21)
    target:addMod(dsp.mod.FOOD_MACC_CAP, 30)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 10)
    target:delMod(dsp.mod.FOOD_HP_CAP, 15)
    target:delMod(dsp.mod.MDEF, 2)
    target:delMod(dsp.mod.FOOD_MACCP, 21)
    target:delMod(dsp.mod.FOOD_MACC_CAP, 30)
end
