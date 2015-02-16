-----------------------------------
--
--  ATMA_OF_THE_DESPOT
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_CHR,50);
		target:addMod(MOD_MAGIC_ABSORB,15);
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
		target:delMod(MOD_CHR,50);
		target:delMod(MOD_MAGIC_ABSORB,15);
		target:delMod(MOD_TP_BONUS,40);
	end
end;