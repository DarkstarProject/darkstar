-----------------------------------
--
-- 	EFFECT_NONE
-- 	
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
target:addMod(MOD_UTSUSEMI,effect:getPower());
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
target:delMod(MOD_UTSUSEMI,effect:getPower());
end;