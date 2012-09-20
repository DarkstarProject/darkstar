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
	local res = (effect:getPower() * (26/512)) * 100;	-- Bio 1 is 27/512, Bio 2 is 52/512. This is roughly accurate.
	target:delMod(MOD_ATTP,-res);
end;
