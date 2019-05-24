-----------------------------------------
-- ID: 6224
-- Item: Apingaut snow cone
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- MP +25% (cap 105)
-- INT +6
-- MND +6
-- Magic Atk. Bonus +14
-- Lizard Killer +6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6224)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_MPP, 25)
    target:addMod(dsp.mod.FOOD_MP_CAP, 105)
    target:addMod(dsp.mod.INT, 6)
    target:addMod(dsp.mod.MND, 6)
    target:addMod(dsp.mod.MATT, 14)
    target:addMod(dsp.mod.LIZARD_KILLER, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 25)
    target:delMod(dsp.mod.FOOD_MP_CAP, 105)
    target:delMod(dsp.mod.INT, 6)
    target:delMod(dsp.mod.MND, 6)
    target:delMod(dsp.mod.MATT, 14)
    target:delMod(dsp.mod.LIZARD_KILLER, 6)
end
