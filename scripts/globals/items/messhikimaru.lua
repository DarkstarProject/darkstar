-----------------------------------------
-- ID: 17826
-- Item: Messhikimaru
-- Enchantment: Arcana Killer
-- Durration: 10 Mins
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    result = 0;
end;

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effects.ENCHANTMENT) == false) then
        target:addStatusEffect(dsp.effects.ENCHANTMENT,0,0,600,17826);
    end;    
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_ARCANA_KILLER, 20);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_ARCANA_KILLER, 20);
end;

