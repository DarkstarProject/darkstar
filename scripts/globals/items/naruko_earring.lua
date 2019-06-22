-----------------------------------------
-- ID: 14789
-- Item: Naruko Earring
-- Item Effect: Enmity +10
-- Duration: 3 Minutes
-----------------------------------------
require("scripts/globals/status")

function onItemCheck(target)
    local effect = target:getStatusEffect(dsp.effect.ENCHANTMENT)
    if effect ~= nil and effect:getSubType() == 14789 then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
    end
    return 0
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,180,14789)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ENMITY, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.ENMITY, 10)
end