-----------------------------------
--
--  ATMA_OF_THE_DEMONIC_SKEWER
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_STR,20);
		target:addMod(MOD_TP_BONUS,20);
		target:addMod(MOD_NULL_PHYSICAL_DAMAGE,5);
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
	if (effect:getPower() == 1) then
		target:delMod(MOD_STR,20);
		target:delMod(MOD_TP_BONUS,20);
		target:delMod(MOD_NULL_PHYSICAL_DAMAGE,5);
	end
end;