-----------------------------------------
-- ID: 5662
-- Item: Dragon Fruit
-- Food Effect: 5 Mins, All Races
-----------------------------------------
-- Intelligence 4
-- Agility -6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5662)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.INT, 4)
    target:addMod(dsp.mod.AGI, -6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.INT, 4)
    target:delMod(dsp.mod.AGI, -6)
end
