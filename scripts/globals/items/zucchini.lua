-----------------------------------------
-- ID: 5726
-- Item: Zucchini
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility 1
-- Vitality -3
-- Defense -1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5726)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.VIT, -3)
    target:addMod(dsp.mod.DEF, -1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.VIT, -3)
    target:delMod(dsp.mod.DEF, -1)
end
