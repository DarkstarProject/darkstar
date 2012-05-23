-----------------------------------
--
--   EFFECT_MARCH
-- getPower returns the TIER (e.g. 1,2,3,4)
-- DO NOT ALTER ANY OF THE EFFECT VALUES!
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_HASTE,effect:getPower());  -- MOD_MARCH IS NOT IMPLEMENTED, USING HASTE UNTIL MARCH IS IMPLEMENTED <--- I will do 05/23/2012
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