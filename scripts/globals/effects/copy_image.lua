-----------------------------------
--
--     dsp.effects.COPY_IMAGE
--
-----------------------------------
require("scripts/globals/status");

function onEffectGain(target,effect)
    target:setMod(MOD_UTSUSEMI, effect:getSubPower());
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    target:setMod(MOD_UTSUSEMI, 0);
end;