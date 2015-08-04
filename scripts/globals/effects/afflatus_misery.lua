-----------------------------------
--
-- EFFECT_AFFLATUS_MISERY
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:setMod(MOD_AFFLATUS_MISERY,0);
	
	if (target:hasStatusEffect(EFFECT_AUSPICE)) then
		local power = target:getStatusEffect(EFFECT_AUSPICE):getPower();
		target:addMod(MOD_ENSPELL,18);
		target:addMod(MOD_ENSPELL_DMG, power);
	end
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
	target:setMod(MOD_AFFLATUS_MISERY,0);
	
	--Clean Up Afflatus Misery Bonuses
	local accuracyBonus = effect:getSubPower();
	--printf("AUSPICE: Removing Accuracy Bonus +%d!", accuracyBonus);
	target:delMod(MOD_ACC, accuracyBonus);
		
	if (target:hasStatusEffect(EFFECT_AUSPICE)) then
		target:setMod(MOD_ENSPELL,0);
		target:setMod(MOD_ENSPELL_DMG, 0);
	end
end;