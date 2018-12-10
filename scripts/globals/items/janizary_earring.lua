-----------------------------------------
-- ID: 14785
-- Item: Janizary Earring
-- Item Effect: Defence +32
-- Duration 3 Minutes
-----------------------------------------
require("scripts/globals/status")

function onItemCheck(target)
    local effect = target:getStatusEffect(dsp.effect.ENCHANTMENT)
    if effect ~= nil and effect:getSubType() == 14785 then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
    end
    return 0
end

function onItemUse(target)
    if target:hasStatusEffect(dsp.effect.ENCHANTMENT) == true then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,180,14785)
    else
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,180,14785)
    end
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEF, 32)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEF, 32)
end