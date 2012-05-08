-----------------------------------
--
-- 	EFFECT_NONE
-- 	
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	res = 3 * effect:getPower() * (26/512);	-- target:getDef() au lieu du 3
	target:addMod(MOD_ATT,-res);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	target:delHP(effect:getPower());
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	res = 3 * effect:getPower() * (26/512);	-- target:getDef() au lieu du 3
	target:delMod(MOD_ATT,-res);
end;