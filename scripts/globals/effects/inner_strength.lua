-----------------------------------
--	EFFECT_INNER_STRENGTH
-- Doubles your maximum HP and
-- increases your current HP by the
-- same amount. 
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HPP,effect:getPower());
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
	target:delMod(MOD_HPP,effect:getPower());
end;