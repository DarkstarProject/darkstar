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

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	power = effect:getPower();
	x = ((27 * power - power * 2 + power + 1) / 512) * 100;
	target:addMod(MOD_DEFP,-x);
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
	power = effect:getPower();
	x = ((27 * power - power * 2 + power + 1) / 512) * 100;
	target:delMod(MOD_DEFP,-x);
end;