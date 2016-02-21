-----------------------------------
--
--     EFFECT_AGGRESSOR
--     
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_RACC, effect:getPower());
   target:addMod(MOD_ACC,25);
   target:addMod(MOD_EVA,-25);
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
   target:delMod(MOD_RACC, effect:getPower());
   target:delMod(MOD_ACC,25);
   target:delMod(MOD_EVA,-25);
end;