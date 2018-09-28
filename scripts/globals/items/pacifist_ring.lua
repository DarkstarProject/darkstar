-----------------------------------------
-- ID: 14680
-- Item: Pacifist Ring
-- Item Effect: Enmity -12
-- Duration: 3 Minutes
-----------------------------------------
require("scripts/globals/status")

function onItemCheck(target)
    local effect = target:getStatusEffect(dsp.effect.ENCHANTMENT)
    if (effect ~= nil) then
        if (effect:getSubType() == 14680) then
            target:delStatusEffect(dsp.effect.ENCHANTMENT)
        end
    end
    return 0
end

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effect.ENCHANTMENT) == true) then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,180,14680)
    else
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,180,14680)
    end
end

function onEffectGain(target,effect)
    target:delMod(dsp.mod.ENMITY, 12)
end

function onEffectLose(target, effect)
    target:addMod(dsp.mod.ENMITY, 12)
end