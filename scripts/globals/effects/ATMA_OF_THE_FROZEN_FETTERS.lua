-----------------------------------
--
--  ATMA_OF_THE_FROZEN_FETTERS
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_INT,20);
		target:addMod(MOD_ICERES,100);
		target:addMod(MOD_ICE_AFFINITY,100);
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
		target:delMod(MOD_INT,20);
		target:delMod(MOD_ICERES,100);
		target:delMod(MOD_ICE_AFFINITY,100);
	end
end;