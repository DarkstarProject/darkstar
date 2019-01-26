-----------------------------------------
-- ID: 5678
-- Item: Mushroom Salad
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- MP 14% Cap 85
-- Agility 6
-- Mind 6
-- Strength -5
-- Vitality -5
-- Ranged Accuracy +15
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.FOOD)) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5678)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_MPP, 14)
    target:addMod(dsp.mod.FOOD_MP_CAP, 85)
    target:addMod(dsp.mod.AGI, 6)
    target:addMod(dsp.mod.MND, 6)
    target:addMod(dsp.mod.STR, -5)
    target:addMod(dsp.mod.VIT, -5)
    target:addMod(dsp.mod.RACC, 15)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 14)
    target:delMod(dsp.mod.FOOD_MP_CAP, 85)
    target:delMod(dsp.mod.AGI, 6)
    target:delMod(dsp.mod.MND, 6)
    target:delMod(dsp.mod.STR, -5)
    target:delMod(dsp.mod.VIT, -5)
    target:delMod(dsp.mod.RACC, 15)
end
