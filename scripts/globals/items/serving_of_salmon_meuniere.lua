-----------------------------------------
-- ID: 4583
-- Item: serving_of_salmon_meuniere
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Dexterity 2
-- Mind -2
-- Ranged ACC % 7
-- Ranged ACC Cap 10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4583)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.DEX, 2)
    target:addMod(dsp.mod.MND, -2)
    target:addMod(dsp.mod.FOOD_RACCP, 7)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 2)
    target:delMod(dsp.mod.MND, -2)
    target:delMod(dsp.mod.FOOD_RACCP, 7)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 10)
end
