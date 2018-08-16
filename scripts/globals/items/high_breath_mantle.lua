-----------------------------------------
-- ID: 15487
-- Item: High Breath Mantle
-- Item Effect: HP+38 / Enmity+5
-----------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local effect = target:getStatusEffect(dsp.effect.ENCHANTMENT)
    if (effect ~= nil) then
        if (effect:getSubType() == 15487) then
            target:delStatusEffect(dsp.effect.ENCHANTMENT)
        end
    end
    return 0
end

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effect.ENCHANTMENT) == true) then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,1800,15487)
    else
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,1800,15487)
    end
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 38)
    target:addMod(dsp.mod.ENMITY, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 38)
    target:delMod(dsp.mod.ENMITY, 5)
end