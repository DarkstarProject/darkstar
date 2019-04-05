-----------------------------------------
-- ID: 4375
-- Item: danceshroom
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Strength -5
-- Mind 3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4375)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR, -5)
    target:addMod(dsp.mod.MND, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, -5)
    target:delMod(dsp.mod.MND, 3)
end
