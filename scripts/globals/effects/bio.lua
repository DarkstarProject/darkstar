-----------------------------------
--
-- 	EFFECT_BIO
-- 	
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	local res = (effect:getPower() * (26/512)) * 100;	-- Bio 1 is 27/512, Bio 2 is 52/512. This is roughly accurate.
	target:addMod(MOD_ATTP,-res);
	target:addMod(MOD_REGEN_DOWN, res);
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
	local res = (effect:getPower() * (26/512)) * 100;	-- Bio 1 is 27/512, Bio 2 is 52/512. This is roughly accurate.
	target:delMod(MOD_ATTP,-res);
	target:delMod(MOD_REGEN_DOWN, res);
end;
