-----------------------------------------
-- ID: 4586
-- Item: Broiled Carp
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Dexterity 2
-- Mind -1
-- Ranged ATT % 14 (cap 45)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4586)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 2)
    target:addMod(dsp.mod.MND, -1)
    target:addMod(dsp.mod.FOOD_RATTP, 14)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 45)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 2)
    target:delMod(dsp.mod.MND, -1)
    target:delMod(dsp.mod.FOOD_RATTP, 14)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 45)
end
