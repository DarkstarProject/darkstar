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
	effect:addMod(MOD_INT,-effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	-- the effect restore intelligence of 1 every 3 ticks.
	downINT_effect_size = effect:getPower()
	if(downINT_effect_size > 0) then
		effect:setPower(downINT_effect_size - 1)
		target:delMod(MOD_INT,-1);
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	downINT_effect_size = effect:getPower()
	if(downINT_effect_size > 0) then
		effect:delMod(MOD_INT,-effect:getPower());
	end
end;