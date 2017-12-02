-----------------------------------
--
-- EFFECT_CHOKE
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, effect:getSubPower());
    target:addMod(MOD_REGEN_DOWN, effect:getPower());
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, effect:getSubPower());
    target:delMod(MOD_REGEN_DOWN, effect:getPower());
end;
