-----------------------------------
--
-- 	EFFECT_DROWN
-- 	
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_STR, -getElementalDebuffStatDownFromDOT(effect:getPower()));
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	target:delHP(effect:getPower());
	target:wakeUp();
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_STR, -getElementalDebuffStatDownFromDOT(effect:getPower()));
end;