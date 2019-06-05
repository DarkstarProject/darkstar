-----------------------------------------
-- ID: 6225
-- Item: Cyclical coalescence
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- MP +30% (cap 110)
-- INT +7
-- MND +7
-- Magic Atk. Bonus +15
-- Lizard Killer +7
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD)) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6225)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_MPP, 30)
    target:addMod(dsp.mod.FOOD_MP_CAP, 110)
    target:addMod(dsp.mod.INT, 7)
    target:addMod(dsp.mod.MND, 7)
    target:addMod(dsp.mod.MATT, 15)
    target:addMod(dsp.mod.LIZARD_KILLER, 7)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 30)
    target:delMod(dsp.mod.FOOD_MP_CAP, 110)
    target:delMod(dsp.mod.INT, 7)
    target:delMod(dsp.mod.MND, 7)
    target:delMod(dsp.mod.MATT, 15)
    target:delMod(dsp.mod.LIZARD_KILLER, 7)
end
