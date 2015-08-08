-----------------------------------
--
-- 	EFFECT_VIT_DOWN
-- 	
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if ((target:getStat(MOD_VIT) - effect:getPower()) < 0) then
		effect:setPower(target:getStat(MOD_VIT));
	end
	target:addMod(MOD_VIT,-effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	-- the effect restore vitality of 1 every 3 ticks.
	local downVIT_effect_size = effect:getPower()
	if (downVIT_effect_size > 0) then
		effect:setPower(downVIT_effect_size - 1)
		target:delMod(MOD_VIT,-1);
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	local downVIT_effect_size = effect:getPower()
	if (downVIT_effect_size > 0) then
		target:delMod(MOD_VIT,-downVIT_effect_size);
	end
end;
