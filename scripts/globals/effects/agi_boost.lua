-----------------------------------
--
--  EFFECT_AGI_BOOST
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_AGI,effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	-- the effect loses agility of 1 every 3 ticks depending on the source of the agi boost
	local boostAGI_effect_size = effect:getPower();
	if (boostAGI_effect_size > 0) then
		effect:setPower(boostAGI_effect_size - 1)
		target:delMod(MOD_AGI,1); 
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	local boostAGI_effect_size = effect:getPower();
	if (boostAGI_effect_size > 0) then
		target:delMod(MOD_AGI,boostAGI_effect_size);
	end
end;
