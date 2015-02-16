-----------------------------------
--
--  ATMA_OF_THE_BROTHER_WOLF
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_MATT,20);
		target:addMod(MOD_MDEF,20);
		target:addMod(MOD_FIRERES,100);
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
		target:delMod(MOD_MATT,20);
		target:delMod(MOD_MDEF,20);
		target:delMod(MOD_FIRERES,100);
	end
end;