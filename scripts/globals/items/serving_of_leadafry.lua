-----------------------------------------
-- ID: 5161
-- Item: serving_of_leadafry
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Agility 5
-- Vitality 2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5161)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.AGI, 5)
    target:addMod(dsp.mod.VIT, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, 5)
    target:delMod(dsp.mod.VIT, 2)
end
