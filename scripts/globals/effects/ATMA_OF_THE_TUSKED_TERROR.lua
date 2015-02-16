-----------------------------------
--
--  ATMA_OF_THE_TUSKED_TERROR
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_UFASTCAST,20);
		target:addMod(MOD_WATERATT,20);
		target:addMod(MOD_WATERACC,20);
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
		target:delMod(MOD_UFASTCAST,20);
		target:delMod(MOD_WATERATT,20);
		target:delMod(MOD_WATERACC,20);
	end
end;