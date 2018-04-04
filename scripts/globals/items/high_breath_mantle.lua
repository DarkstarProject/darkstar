-----------------------------------------
-- ID: 15487
-- Item: High Breath Mantle
-- Item Effect: HP+38 / Enmity+5
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local effect = target:getStatusEffect(dsp.effects.ENCHANTMENT);
    if (effect ~= nil) then
        if (effect:getSubType() == 15487) then
            target:delStatusEffect(dsp.effects.ENCHANTMENT);
        end;
    end;
    return 0;
end;

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effects.ENCHANTMENT) == true) then
        target:delStatusEffect(dsp.effects.ENCHANTMENT);
        target:addStatusEffect(dsp.effects.ENCHANTMENT,0,0,1800,15487);
    else
        target:addStatusEffect(dsp.effects.ENCHANTMENT,0,0,1800,15487);
    end;
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 38);
    target:addMod(MOD_ENMITY, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 38);
    target:delMod(MOD_ENMITY, 5);
end;