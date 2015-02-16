-----------------------------------
--
--  ATMA_OF_THE_HORNED_BEAST
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_ACC,60);
		target:addMod(MOD_PETRIFYRES,50);
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
		target:delMod(MOD_ACC,60);
		target:delMod(MOD_PETRIFYRES,50);
	end
end;