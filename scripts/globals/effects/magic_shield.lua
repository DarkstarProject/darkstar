-----------------------------------
--
-- 	EFFECT_NONE
-- 	
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_DEF,50);
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
   target:delMod(MOD_DEF,50);
end;