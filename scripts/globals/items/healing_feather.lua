-----------------------------------------
-- ID: 18239
-- Item: Healing Feather
-- Item Effect: Cure Potency +15%
-- Duration: 3 Minutes
-----------------------------------------
require("scripts/globals/status")

function onItemCheck(target)
    local effect = target:getStatusEffect(dsp.effect.ENCHANTMENT)
    if effect ~= nil and effect:getSubType() == 18239 then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
    end
    return 0
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,180,18239)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.CURE_POTENCY, 15)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.CURE_POTENCY, 15)
end