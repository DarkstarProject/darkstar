-----------------------------------
--
--    EFFECT_DIA
--
----------------------------------   
-- Quick Explanation of Algorithm:
-- Dia 1: Power of 1. Results in reduced defense of ~5.27%  (27/512) and 1 hp/tick damage.
-- Dia 2: Power of 2. Results in reduced defense of ~10.35% (53/512) and 2 hp/tick damage.
-- Dia 3: Power of 3. Results in reduced defense of ~15.4%  (79/512) and 3 hp/tick damage.
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	local power = effect:getPower();
	local x = (((26 * power) + 1) / 512) * 100;
	target:addMod(MOD_DEFP,-x);
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
	local power = effect:getPower();
	local x = (((26 * power) + 1) / 512) * 100; --Simplified
	target:delMod(MOD_DEFP,-x);
end;
