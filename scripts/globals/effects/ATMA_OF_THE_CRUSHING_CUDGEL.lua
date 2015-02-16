-----------------------------------
--
--  ATMA_OF_THE_CRUSHING_CUDGEL
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_ACC,20);
		target:addMod(MOD_SKILLCHAINDMG,5);
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
		target:delMod(MOD_ACC,20);
		target:delMod(MOD_SKILLCHAINDMG,5);
	end
end;