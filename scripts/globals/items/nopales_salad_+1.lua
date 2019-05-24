-----------------------------------------
-- ID: 5702
-- Item: Nopales Salad +1
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Strength 2
-- Agility 7
-- Ranged Accuracy +25
-- Ranged Attack +15
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5702)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 2)
    target:addMod(dsp.mod.AGI, 7)
    target:addMod(dsp.mod.RACC, 25)
    target:addMod(dsp.mod.RATT, 15)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 2)
    target:delMod(dsp.mod.AGI, 7)
    target:delMod(dsp.mod.RACC, 25)
    target:delMod(dsp.mod.RATT, 15)
end
