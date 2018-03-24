-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");

function onEffectGain(target,effect)
    target:addPetMod(MOD_ATTP, effect:getPower());
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    target:delPetMod(MOD_ATTP, effect:getPower());
end;
