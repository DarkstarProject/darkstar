-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");

function onEffectGain(target,effect)
    target:addMod(MOD_CONSERVE_MP, effect:getPower());
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    target:delMod(MOD_CONSERVE_MP, effect:getPower());
end;
