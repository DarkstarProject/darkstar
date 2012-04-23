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
	effect:addMod(MOD_STR,-effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	-- the effect restore strengh of 1 every 3 ticks.
	downSTR_effect_size = effect:getPower()
	if(downSTR_effect_size > 0) then
		effect:setPower(downSTR_effect_size - 1)
		target:delMod(MOD_STR,-1);
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	downSTR_effect_size = effect:getPower()
	if(downSTR_effect_size > 0) then
		effect:delMod(MOD_STR,-effect:getPower());
	end
end;