-----------------------------------------
-- ID: 4431
-- Item: Bunch of San Dorian Grapes
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility -5
-- Intelligence 3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4431)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.AGI, -5)
    target:addMod(dsp.mod.INT, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, -5)
    target:delMod(dsp.mod.INT, 3)
end
