-----------------------------------
--
--  ATMA_OF_THE_SEA_DAUGHTER
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_REGAIN,5);
		target:addMod(MOD_HASTE,-12);
		target:addMod(MOD_REGEN,30);
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
		target:delMod(MOD_REGAIN,5);
		target:delMod(MOD_HASTE,-12);
		target:delMod(MOD_REGEN,30);
	end
end;