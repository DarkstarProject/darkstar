-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_SAVETP, effect:getPower());
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    target:delMod(MOD_SAVETP, effect:getPower());
end;
