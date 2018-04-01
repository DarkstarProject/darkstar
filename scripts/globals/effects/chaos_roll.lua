-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");

function onEffectGain(target,effect)
    target:addMod(MOD_ATTP, effect:getPower());
    target:addMod(MOD_RATTP, effect:getPower());
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    target:delMod(MOD_ATTP, effect:getPower());
    target:delMod(MOD_RATTP, effect:getPower());
end;
