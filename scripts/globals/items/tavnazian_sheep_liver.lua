-----------------------------------------
-- ID: 5154
-- Item: Tavnazian Sheep Liver
-- Food Effect: 5Min, Galka only
-----------------------------------------
-- Strength 2
-- Intelligence -4
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:getRace() ~= dsp.race.GALKA) then
        result = dsp.msg.basic.CANNOT_EAT
    elseif target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5154)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR, 2)
    target:addMod(dsp.mod.INT, -4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 2)
    target:delMod(dsp.mod.INT, -4)
end
