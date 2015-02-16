-----------------------------------
--
--  ATMA_OF_THE_UNTOUCHED
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_CHR,20);
		target:addMod(MOD_TRIPLE_ATTACK,5);
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
		target:delMod(MOD_CHR,20);
		target:delMod(MOD_TRIPLE_ATTACK,5);
	end
end;