-----------------------------------------
-- ID: 5183
-- Item: viking_herring
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Dexterity 4
-- Mind -3
-- Attack % 12 (cap 75)
-- Ranged ATT % 12 (cap 75)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5183)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.MND, -3)
    target:addMod(dsp.mod.FOOD_ATTP, 12)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 75)
    target:addMod(dsp.mod.FOOD_RATTP, 12)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 75)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.MND, -3)
    target:delMod(dsp.mod.FOOD_ATTP, 12)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 75)
    target:delMod(dsp.mod.FOOD_RATTP, 12)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 75)
end
