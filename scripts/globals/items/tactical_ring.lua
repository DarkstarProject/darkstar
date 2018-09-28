-----------------------------------------
-- ID: 14679
-- Item: Tactical Ring
-- Item Effect: Regain 20
-- Duration: 2 Minutes
-----------------------------------------
require("scripts/globals/status")

function onItemCheck(target)
    local effect = target:getStatusEffect(dsp.effect.ENCHANTMENT)
    if (effect ~= nil) then
        if (effect:getSubType() == 14679) then
            target:delStatusEffect(dsp.effect.ENCHANTMENT)
        end
    end
    return 0
end

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effect.ENCHANTMENT) == true) then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,120,14679)
    else
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,120,14679)
    end
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.REGAIN, 20)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.REGAIN, 20)
end