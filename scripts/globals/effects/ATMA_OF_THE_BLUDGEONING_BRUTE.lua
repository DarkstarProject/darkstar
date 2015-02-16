-----------------------------------
--
--  ATMA_OF_THE_BLUDGEONING_BRUTE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_REGAIN,1);
		target:addMod(MOD_THUNDERRES,50);
		target:addMod(MOD_WATERRES,50);
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
		target:delMod(MOD_REGAIN,1);
		target:delMod(MOD_THUNDERRES,50);
		target:delMod(MOD_WATERRES,50);
	end
end;