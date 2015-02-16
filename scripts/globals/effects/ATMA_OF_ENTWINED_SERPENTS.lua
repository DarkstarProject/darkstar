-----------------------------------
--
--  ATMA_OF_ENTWINED_SERPENTS
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_ATT,20);
		target:addMod(MOD_DOUBLE_ATTACK,15);
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
		target:delMod(MOD_ATT,20);
		target:delMod(MOD_DOUBLE_ATTACK,15);
	end
end;