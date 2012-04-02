-----------------------------------
--
--   EFFECT_MARCH
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_HASTE,effect:getPower());  -- MOD_MARCH IS NOT IMPLEMENTED, USING HASTE UNTIL MARCH IS IMPLEMENTED
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
   target:delMod(MOD_HASTE,effect:getPower());
end;