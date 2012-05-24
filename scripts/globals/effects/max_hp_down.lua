-----------------------------------
--
-- EFFECT_MAX_HP_DOWN
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if((target:getMod(MOD_HPP) - effect:getPower()) < 0) then
		effect:setPower(target:getMod(MOD_HPP));
	end
	target:addMod(MOD_HPP,-effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HPP,-effect:getPower());
end;