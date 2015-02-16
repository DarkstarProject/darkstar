-----------------------------------
--
--  ATMA_OF_THE_SMITING_BLOW
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_TP_BONUS,50);
		target:addMod(MOD_WSACC,50);
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
		target:delMod(MOD_TP_BONUS,50);
		target:delMod(MOD_WSACC,50);
	end
end;