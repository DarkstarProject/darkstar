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
	if(target:hasStatusEffect(EFFECT_STONESKIN)) then
		local skin = target:getMod(MOD_STONESKIN);
		local dmg = effect:getPower();
		if(skin >= dmg) then --absorb all damage
			target:delMod(MOD_STONESKIN,effect:getPower());
		else
			target:delStatusEffect(EFFECT_STONESKIN);
			target:delHP(dmg - skin);
			target:wakeUp();
		end

	else
		target:delHP(effect:getPower());
		target:wakeUp();
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_STR, -getElementalDebuffStatDownFromDOT(effect:getPower()));
end;