-----------------------------------
--
-- 	EFFECT_INT_DOWN
-- 	
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if ((target:getStat(MOD_INT) - effect:getPower()) < 0) then
		effect:setPower(target:getStat(MOD_INT));
	end
	target:addMod(MOD_INT,-effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	-- the effect restore intelligence of 1 every 3 ticks.
	local downINT_effect_size = effect:getPower()
	if (downINT_effect_size > 0) then
		effect:setPower(downINT_effect_size - 1)
		target:delMod(MOD_INT,-1);
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	local downINT_effect_size = effect:getPower()
	if (downINT_effect_size > 0) then
		target:delMod(MOD_INT,-downINT_effect_size);
	end
end;
