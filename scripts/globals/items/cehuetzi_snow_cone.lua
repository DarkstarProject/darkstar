-----------------------------------------
-- ID: 6223
-- Item: Cehuetzi snow cone
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- MP +20% (cap 100)
-- INT +5
-- MND +5
-- Magic Atk. Bonus +13
-- Lizard Killer +5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6223)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_MPP, 20)
    target:addMod(dsp.mod.FOOD_MP_CAP, 100)
    target:addMod(dsp.mod.INT, 5)
    target:addMod(dsp.mod.MND, 5)
    target:addMod(dsp.mod.MATT, 13)
    target:addMod(dsp.mod.LIZARD_KILLER, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 20)
    target:delMod(dsp.mod.FOOD_MP_CAP, 100)
    target:delMod(dsp.mod.INT, 5)
    target:delMod(dsp.mod.MND, 5)
    target:delMod(dsp.mod.MATT, 13)
    target:delMod(dsp.mod.LIZARD_KILLER, 5)
end
