-----------------------------------------
-- ID: 15486
-- Item: Breath Mantle
-- Item Effect: HP+18 / Enmity+3
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local effect = target:getStatusEffect(dsp.effect.ENCHANTMENT);
    if (effect ~= nil) then
        if (effect:getSubType() == 15486) then
            target:delStatusEffect(dsp.effect.ENCHANTMENT);
        end;
    end;
    return 0;
end;

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effect.ENCHANTMENT) == true) then
        target:delStatusEffect(dsp.effect.ENCHANTMENT);
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,1800,15486);
    else
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,1800,15486);
    end;
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 18);
    target:addMod(MOD_ENMITY, 3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 18);
    target:delMod(MOD_ENMITY, 3);
end;