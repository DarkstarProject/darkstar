-----------------------------------
--
--     EFFECT_FROST
--     
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_REGEN_DOWN, effect:getPower());
    target:addMod(MOD_MND, -getElementalDebuffStatDownFromDOT(effect:getPower()));
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_REGEN_DOWN, effect:getPower());
    target:delMod(MOD_MND, -getElementalDebuffStatDownFromDOT(effect:getPower()));
end;