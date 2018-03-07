-----------------------------------
--
--     EFFECT_HAGAKURE
--
-----------------------------------

require("scripts/globals/status");

function onEffectGain(target,effect)
    target:addMod(MOD_SAVETP,400);
    target:addMod(MOD_TP_BONUS,1000);
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    target:delMod(MOD_SAVETP,400);
    target:delMod(MOD_TP_BONUS,1000);
end;
