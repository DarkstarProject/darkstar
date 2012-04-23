-----------------------------------
--
-- 	EFFECT_MND_DOWN
-- 	
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	effect:addMod(MOD_MND,-effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	-- the effect restore mind of 1 every 3 ticks.
	downMND_effect_size = effect:getPower()
	if(downMND_effect_size > 0) then
		effect:setPower(downMND_effect_size - 1)
		target:delMod(MOD_MND,-1);
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	downMND_effect_size = effect:getPower()
	if(downMND_effect_size > 0) then
		effect:delMod(MOD_MND,-effect:getPower());
	end
end;