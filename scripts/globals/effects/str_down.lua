-----------------------------------
--
-- 	EFFECT_STR_DOWN
-- 	
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if ((target:getStat(MOD_STR) - effect:getPower()) < 0) then
		effect:setPower(target:getStat(MOD_STR));
	end
	target:addMod(MOD_STR,-effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	-- the effect restore strengh of 1 every 3 ticks.
	local downSTR_effect_size = effect:getPower()
	if (downSTR_effect_size > 0) then
		effect:setPower(downSTR_effect_size - 1)
		target:delMod(MOD_STR,-1);
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	local downSTR_effect_size = effect:getPower()
	if (downSTR_effect_size > 0) then
		target:delMod(MOD_STR,-downSTR_effect_size);
	end
end;
