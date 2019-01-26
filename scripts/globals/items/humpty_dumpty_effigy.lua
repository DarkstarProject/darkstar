-----------------------------------------
-- ID: 5683
-- Item: humpty_dumpty_effigy
-- Food Effect: 3 hours, All Races
-----------------------------------------
-- Max HP % 6 (cap 160)
-- Max MP % 6 (cap 160)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5683)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 6)
    target:addMod(dsp.mod.FOOD_HP_CAP, 160)
    target:addMod(dsp.mod.FOOD_MPP, 6)
    target:addMod(dsp.mod.FOOD_MP_CAP, 160)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 6)
    target:delMod(dsp.mod.FOOD_HP_CAP, 160)
    target:delMod(dsp.mod.FOOD_MPP, 6)
    target:delMod(dsp.mod.FOOD_MP_CAP, 160)
end
