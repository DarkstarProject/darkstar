-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");

function onEffectGain(target,effect)
    target:addPetMod(MOD_MATT, effect:getPower());
    target:addPetMod(MOD_MACC, effect:getPower());
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    target:delPetMod(MOD_MATT, effect:getPower());
    target:delPetMod(MOD_MACC, effect:getPower());
end;
