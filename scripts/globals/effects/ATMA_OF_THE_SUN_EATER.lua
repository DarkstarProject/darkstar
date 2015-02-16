-----------------------------------
--
--  ATMA_OF_THE_SUN_EATER
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_STORE_TP,40);
		target:addMod(MOD_TP_BONUS,40);
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
		target:delMod(MOD_STORE_TP,40);
		target:delMod(MOD_TP_BONUS,40);
	end
end;