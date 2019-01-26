-----------------------------------------
-- ID: 4389
-- Item: san_dorian_carrot
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility 2
-- Vitality -4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4389)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.AGI, 2)
    target:addMod(dsp.mod.VIT, -4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, 2)
    target:delMod(dsp.mod.VIT, -4)
end
