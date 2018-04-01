-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FASTCAST, effect:getPower());
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    target:delMod(MOD_FASTCAST, effect:getPower());
end;
