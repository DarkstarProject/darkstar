-----------------------------------
--
--  ATMA_OF_THE_RAPID_REPTILIAN
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_TRIPLE_ATTACK,5);
		target:addMod(MOD_DMGBREATH,-40);
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
		target:delMod(MOD_TRIPLE_ATTACK,5);
		target:delMod(MOD_DMGBREATH,-40);
	end
end;