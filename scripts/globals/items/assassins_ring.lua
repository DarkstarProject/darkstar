-----------------------------------------
-- ID: 14678
-- Item: Assassin's Ring
-- Item Effect: Ranged Accuracy 20
-- Duration 3 Minutes
-----------------------------------------
require("scripts/globals/status")

function onItemCheck(target)
    local effect = target:getStatusEffect(dsp.effect.ENCHANTMENT)
    if effect ~= nil and effect:getSubType() == 14678 then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
    end
    return 0
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,180,14678)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.RACC, 20)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.RACC, 20)
end