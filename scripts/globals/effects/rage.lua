-----------------------------------
--
-- EFFECT_RAGE
--
-- When a mob is held to long, 
-- adds massive stats on top of what mob already has
-- until mob has lost hate on all targets 
-- and has no targets to attack 
-- (is fully disengaged from all players)
-- and returned to an idle state.
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1);
		target:addMod(MOD_STR, 250);
		target:addMod(MOD_DEX, 250);
		target:addMod(MOD_VIT, 250);
		target:addMod(MOD_AGI, 250);
		target:addMod(MOD_INT, 250);
		target:addMod(MOD_MND, 250);
		target:addMod(MOD_CHA, 250);
		target:addMod(MOD_DEF, 2500);
		target:addMod(MOD_ATT, 2500);
		target:addMod(MOD_RATT, 2500);
		target:addMod(MOD_ACC, 2500);
		target:addMod(MOD_RACC, 2500);
		target:addMod(MOD_MATT, 2500);
		target:addMod(MOD_MDEF, 2500);
		target:addMod(MOD_MACC, 2500);
		target:addMod(MOD_MEVA, 2500);
		target:addMod(MOD_UFASTCAST, 50);
		target:addMod(MOD_HASTE_ABILITY, 40);
		target:addMod(MOD_COUNTER, 20);
		target:addMod(MOD_TRIPLE_ATTACK, 20);
		target:addMod(MOD_REGAIN, 50);
		target:addMod(MOD_REFRESH, 50);
		target:addMod(MOD_REGEN, 50);
	elseif (effect:getPower() == 2);
		local SubPower = effect:getSubPower());
		target:addMod(MOD_STR, SubPower);
		target:addMod(MOD_DEX, SubPower);
		target:addMod(MOD_VIT, SubPower);
		target:addMod(MOD_AGI, SubPower);
		target:addMod(MOD_INT, SubPower);
		target:addMod(MOD_MND, SubPower);
		target:addMod(MOD_CHA, SubPower);
		target:addMod(MOD_DEF, 10 * SubPower);
		target:addMod(MOD_ATT, 10 * SubPower);
		target:addMod(MOD_RATT, 10 * SubPower);
		target:addMod(MOD_ACC, 10 * SubPower);
		target:addMod(MOD_RACC, 10 * SubPower);
		target:addMod(MOD_MATT, 10 * SubPower);
		target:addMod(MOD_MDEF, 10 * SubPower);
		target:addMod(MOD_MACC, 10 * SubPower);
		target:addMod(MOD_MEVA, 10 * SubPower);
	end
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	if (effect:getPower() == 2);
		local SubPower = effect:getSubPower());
		target:addMod(MOD_STR, SubPower);
		target:addMod(MOD_DEX, SubPower);
		target:addMod(MOD_VIT, SubPower);
		target:addMod(MOD_AGI, SubPower);
		target:addMod(MOD_INT, SubPower);
		target:addMod(MOD_MND, SubPower);
		target:addMod(MOD_CHA, SubPower);
		target:addMod(MOD_DEF, 10 * SubPower);
		target:addMod(MOD_ATT, 10 * SubPower);
		target:addMod(MOD_RATT, 10 * SubPower);
		target:addMod(MOD_ACC, 10 * SubPower);
		target:addMod(MOD_RACC, 10 * SubPower);
		target:addMod(MOD_MATT, 10 * SubPower);
		target:addMod(MOD_MDEF, 10 * SubPower);
		target:addMod(MOD_MACC, 10 * SubPower);
		target:addMod(MOD_MEVA, 10 * SubPower);
		effect:setSubPower(SubPower+1);
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	if (effect:getPower() == 1);
		target:delMod(MOD_STR, 250);
		target:delMod(MOD_DEX, 250);
		target:delMod(MOD_VIT, 250);
		target:delMod(MOD_AGI, 250);
		target:delMod(MOD_INT, 250);
		target:delMod(MOD_MND, 250);
		target:delMod(MOD_CHA, 250);
		target:delMod(MOD_DEF, 2500);
		target:delMod(MOD_ATT, 2500);
		target:delMod(MOD_RATT, 2500);
		target:delMod(MOD_ACC, 2500);
		target:delMod(MOD_RACC, 2500);
		target:delMod(MOD_MATT, 2500);
		target:delMod(MOD_MDEF, 2500);
		target:delMod(MOD_MACC, 2500);
		target:delMod(MOD_MEVA, 2500);
		target:delMod(MOD_UFASTCAST, 50);
		target:delMod(MOD_HASTE_ABILITY, 40);
		target:delMod(MOD_COUNTER, 20);
		target:delMod(MOD_TRIPLE_ATTACK, 20);
		target:delMod(MOD_REGAIN, 50);
		target:delMod(MOD_REFRESH, 50);
		target:delMod(MOD_REGEN, 50);
	elseif (effect:getPower() == 2);
		local SubPower = effect:getSubPower());
		target:delMod(MOD_STR, SubPower);
		target:delMod(MOD_DEX, SubPower);
		target:delMod(MOD_VIT, SubPower);
		target:delMod(MOD_AGI, SubPower);
		target:delMod(MOD_INT, SubPower);
		target:delMod(MOD_MND, SubPower);
		target:delMod(MOD_CHA, SubPower);
		target:delMod(MOD_DEF, 10 * SubPower);
		target:delMod(MOD_ATT, 10 * SubPower);
		target:delMod(MOD_RATT, 10 * SubPower);
		target:delMod(MOD_ACC, 10 * SubPower);
		target:delMod(MOD_RACC, 10 * SubPower);
		target:delMod(MOD_MATT, 10 * SubPower);
		target:delMod(MOD_MDEF, 10 * SubPower);
		target:delMod(MOD_MACC, 10 * SubPower);
		target:delMod(MOD_MEVA, 10 * SubPower);
	end
end;
