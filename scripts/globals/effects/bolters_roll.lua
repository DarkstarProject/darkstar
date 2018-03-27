-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MOVE, effect:getPower());
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    target:delMod(MOD_MOVE, effect:getPower());
end;
