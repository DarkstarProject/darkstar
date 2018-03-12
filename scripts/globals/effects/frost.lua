-----------------------------------
--
--     EFFECT_FROST
--     
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

function onEffectGain(target,effect)
    target:addMod(MOD_REGEN_DOWN, effect:getPower());
    target:addMod(MOD_AGI, -getElementalDebuffStatDownFromDOT(effect:getPower()));
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    target:delMod(MOD_REGEN_DOWN, effect:getPower());
    target:delMod(MOD_AGI, -getElementalDebuffStatDownFromDOT(effect:getPower()));
end;
