-----------------------------------
--
--  ATMA_OF_VICISSITUDE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_DEF,40);
		target:addMod(MOD_MDEF,20);
		target:addMod(MOD_REGEN,15);
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
		target:delMod(MOD_DEF,40);
		target:delMod(MOD_MDEF,20);
		target:delMod(MOD_REGEN,15);
	end
end;