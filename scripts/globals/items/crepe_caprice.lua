-----------------------------------------
-- ID: 5776
-- Item: Crepe Caprice
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- HP +5% (cap20)
-- MP Healing 3
-- Magic Accuracy +21% (cap 40)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5776)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 5)
    target:addMod(dsp.mod.FOOD_HP_CAP, 20)
    target:addMod(dsp.mod.MPHEAL, 3)
    target:addMod(dsp.mod.MDEF, 2)
    target:addMod(dsp.mod.FOOD_MACCP, 21)
    target:addMod(dsp.mod.FOOD_MACC_CAP, 40)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 5)
    target:delMod(dsp.mod.FOOD_HP_CAP, 20)
    target:delMod(dsp.mod.MPHEAL, 3)
    target:delMod(dsp.mod.MDEF, 2)
    target:delMod(dsp.mod.FOOD_MACCP, 21)
    target:delMod(dsp.mod.FOOD_MACC_CAP, 40)
end
