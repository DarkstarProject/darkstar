-----------------------------------
--
-- EFFECT_MAX_MP_DOWN
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if((target:getMod(MOD_MPP) - effect:getPower()) < 0) then
		effect:setPower(target:getMod(MOD_MPP));
	end
	target:addMod(MOD_MPP,-effect:getPower());
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
	target:delMod(MOD_MPP,-effect:getPower());
end;