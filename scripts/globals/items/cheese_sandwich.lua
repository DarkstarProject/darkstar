-----------------------------------------
-- ID: 5686
-- Item: cheese_sandwich
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP 10
-- Agility 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5686)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 10)
    target:addMod(dsp.mod.AGI, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 10)
    target:delMod(dsp.mod.AGI, 1)
end
