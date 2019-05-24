-----------------------------------------
-- ID: 5701
-- Item: nopales_salad
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Strength 1
-- Agility 6
-- Ranged Accuracy +20
-- Ranged Attack +10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5701)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 1)
    target:addMod(dsp.mod.AGI, 6)
    target:addMod(dsp.mod.RACC, 20)
    target:addMod(dsp.mod.RATT, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 1)
    target:delMod(dsp.mod.AGI, 6)
    target:delMod(dsp.mod.RACC, 20)
    target:delMod(dsp.mod.RATT, 10)
end
