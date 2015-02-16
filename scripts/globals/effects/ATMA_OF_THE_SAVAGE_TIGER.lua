-----------------------------------
--
--  ATMA_OF_THE_SAVAGE_TIGER
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_AGI,30);
		target:addMod(MOD_DOUBLE_ATTACK,10);
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
		target:delMod(MOD_AGI,30);
		target:delMod(MOD_DOUBLE_ATTACK,10);
	end
end;