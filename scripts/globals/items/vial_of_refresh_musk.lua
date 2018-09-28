-----------------------------------------
-- ID: 18241
-- Item: Vial of Refresh Musk
-- Item Effect: 60 seconds
-- Duration: 30 Seconds
-----------------------------------------
require("scripts/globals/status")

function onItemCheck(target)
    local effect = target:getStatusEffect(dsp.effect.ENCHANTMENT)
    if effect ~= nil and effect:getSubType() == 18241 then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
    end
    return 0
end

function onItemUse(target)
    if target:hasStatusEffect(dsp.effect.ENCHANTMENT) == true then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,30,18241)
    else
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,30,18241)
    end
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.REFRESH, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.REFRESH, 3)
end