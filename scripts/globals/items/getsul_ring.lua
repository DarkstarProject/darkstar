-----------------------------------------
-- ID: 14681
-- Item: Getsul Ring
-- Item Effect: +20% HP
-- Duration 3 Minutes
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local effect = target:getStatusEffect(dsp.effect.ENCHANTMENT)
    if effect ~= nil and effect:getSubType() == 14681 then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
    end
    return 0
end

function onItemUse(target)
    if target:hasStatusEffect(dsp.effect.ENCHANTMENT) == true then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,180,14681)
    else
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,180,14681)
    end
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HPP, 20)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HPP, 20)
end