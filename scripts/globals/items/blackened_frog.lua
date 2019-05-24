-----------------------------------------
-- ID: 4536
-- Item: Blackened Frog
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 2
-- Agility 2
-- Mind -2
-- Attack % 14
-- Attack Cap 75
-- Ranged ATT % 14
-- Ranged ATT Cap 75
-- Evasion +5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4536)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 2)
    target:addMod(dsp.mod.AGI, 2)
    target:addMod(dsp.mod.MND, -2)
    target:addMod(dsp.mod.FOOD_ATTP, 14)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 75)
    target:addMod(dsp.mod.FOOD_RATTP, 14)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 75)
    target:addMod(dsp.mod.EVA, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 2)
    target:delMod(dsp.mod.AGI, 2)
    target:delMod(dsp.mod.MND, -2)
    target:delMod(dsp.mod.FOOD_ATTP, 14)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 75)
    target:delMod(dsp.mod.FOOD_RATTP, 14)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 75)
    target:delMod(dsp.mod.EVA, 5)
end
