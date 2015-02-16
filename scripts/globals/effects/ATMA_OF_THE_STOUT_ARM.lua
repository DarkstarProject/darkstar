-----------------------------------
--
--  ATMA_OF_THE_STOUT_ARM
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_STR,40);
		target:addMod(MOD_ATT,50);
		target:addMod(MOD_RATT,40);
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
		target:delMod(MOD_STR,40);
		target:delMod(MOD_ATT,50);
		target:delMod(MOD_RATT,40);
	end
end;