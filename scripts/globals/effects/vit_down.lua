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
	effect:addMod(MOD_VIT,-effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	-- the effect restore vitality of 1 every 3 ticks.
	downVIT_effect_size = effect:getPower()
	if(downVIT_effect_size > 0) then
		effect:setPower(downVIT_effect_size - 1)
		target:delMod(MOD_VIT,-1);
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	downVIT_effect_size = effect:getPower()
	if(downVIT_effect_size > 0) then
		effect:delMod(MOD_VIT,-effect:getPower());
	end
end;