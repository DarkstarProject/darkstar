-----------------------------------
--
-- 	EFFECT_COPY_IMAGE
-- 	
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
target:addMod(MOD_UTSUSEMI,effect:getPower());
--print("Shadows gained: %u",effect:getPower());
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
target:setMod(MOD_UTSUSEMI,0);
end;