-----------------------------------
--
--  EFFECT_ACCURACY_BOOST
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower()>100) then
		effect:setPower(50);
	end
	target:addMod(MOD_ACCP,effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	-- the effect loses accuracy of 1 every 3 ticks depending on the source of the acc boost
	local boostACC_effect_size = effect:getPower();
	if (boostACC_effect_size > 0) then
		effect:setPower(boostACC_effect_size - 1)
		target:delMod(MOD_ACC,1); 
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	local boostACC_effect_size = effect:getPower();
	if (boostACC_effect_size > 0) then
		target:delMod(MOD_ACCP,effect:getPower());
	end
end;