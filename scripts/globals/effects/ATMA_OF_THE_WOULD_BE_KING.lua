-----------------------------------
--
--  ATMA_OF_THE_WOULD_BE_KING
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_REGAIN,10);
		target:addMod(MOD_STORETP,20);
		target:addMod(MOD_TP_BONUS,20);
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
		target:delMod(MOD_REGAIN,10);
		target:delMod(MOD_STORETP,20);
		target:delMod(MOD_TP_BONUS,20);
	end
end;