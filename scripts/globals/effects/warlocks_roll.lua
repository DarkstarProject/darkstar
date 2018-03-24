-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");

function onEffectGain(target,effect)
    target:addMod(MOD_MACC, effect:getPower());
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    target:delMod(MOD_MACC, effect:getPower());
end;
