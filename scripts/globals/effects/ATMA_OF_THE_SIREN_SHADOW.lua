-----------------------------------
--
--  ATMA_OF_THE_SIREN_SHADOW
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_ATT,40);
		target:addMod(MOD_EVA,40);
		target:addMod(MOD_PARALYZERES,40);
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
		target:delMod(MOD_ATT,40);
		target:delMod(MOD_EVA,40);
		target:delMod(MOD_PARALYZERES,40);
	end
end;