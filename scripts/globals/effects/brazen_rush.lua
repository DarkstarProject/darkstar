-----------------------------------
--	EFFECT_BRAZEN_RUSH
-- Increases your chance to execute
-- a double attack to 100%. Effect
-- dissipates over time.
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_DOUBLE_ATTACK,effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	-- The effect loses 5 every 3 ticks ?? Guestimate
	local effect_size = effect:getPower();
	if(effect_size > 0) then
		effect:setPower(effect_size - 5)
		target:delMod(MOD_DOUBLE_ATTACK,5); 
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_DOUBLE_ATTACK,effect:getPower());
end;