-----------------------------------------
-- ID: 4584
-- Item: serving_of_flounder_meuniere
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Dexterity 6
-- Mind -1
-- Ranged ACC 15
-- Ranged ATT % 14
-- Ranged ATT Cap 25
-- Enmity -3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4584)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 6)
    target:addMod(dsp.mod.MND, -1)
    target:addMod(dsp.mod.RACC, 15)
    target:addMod(dsp.mod.FOOD_RATTP, 14)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 25)
    target:addMod(dsp.mod.ENMITY, -3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 6)
    target:delMod(dsp.mod.MND, -1)
    target:delMod(dsp.mod.RACC, 15)
    target:delMod(dsp.mod.FOOD_RATTP, 14)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 25)
    target:delMod(dsp.mod.ENMITY, -3)
end
