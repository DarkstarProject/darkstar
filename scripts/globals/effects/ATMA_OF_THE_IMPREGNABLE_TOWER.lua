-----------------------------------
--
--  ATMA_OF_THE_IMPREGNABLE_TOWER
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_HP,50);
		target:addMod(MOD_MACC,40);
		target:addMod(MOD_MATT,40);
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
		target:delMod(MOD_HP,50);
		target:delMod(MOD_MACC,40);
		target:delMod(MOD_MATT,40);
	end
end;