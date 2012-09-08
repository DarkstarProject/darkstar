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
	power = effect:getPower();
	x = (((26 * power) + 1) / 512) * 100;
	target:addMod(MOD_DEFP,-x);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	skin = target:getMod(MOD_STONESKIN);
    if(skin>0) then
        if(skin >= effect:getPower()) then --absorb all damage
            target:delMod(MOD_STONESKIN,effect:getPower());
            if(target:getMod(MOD_STONESKIN)==0) then
                target:delStatusEffect(EFFECT_STONESKIN);
            end
        else --absorbs some damage then wear
            target:delMod(MOD_STONESKIN,skin);
            target:delStatusEffect(EFFECT_STONESKIN);
			target:wakeUp();
			target:delHP(effect:getPower() - skin);
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
	power = effect:getPower();
	x = (((26 * power) + 1) / 512) * 100; --Simplified
	target:delMod(MOD_DEFP,-x);
end;