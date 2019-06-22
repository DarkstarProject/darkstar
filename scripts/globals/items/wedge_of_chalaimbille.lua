-----------------------------------------
-- ID: 5684
-- Item: wedge_of_chalaimbille
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health % 6 (cap 40)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5684)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 6)
    target:addMod(dsp.mod.FOOD_HP_CAP, 40)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 6)
    target:delMod(dsp.mod.FOOD_HP_CAP, 40)
end
