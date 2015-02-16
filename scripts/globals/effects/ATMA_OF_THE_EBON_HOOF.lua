-----------------------------------
--
--  ATMA_OF_THE_EBON_HOOF
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_HPP,30);
		target:addMod(MOD_SLEEPRES,50);
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
		target:delMod(MOD_HPP,30);
		target:delMod(MOD_SLEEPRES,50);
	end
end;