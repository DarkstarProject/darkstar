-----------------------------------
--
--  ATMA_OF_THE_VORACIOUS_VIOLET
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_STR,50);
		target:addMod(MOD_DOUBLE_ATTACK,10);
		target:addMod(MOD_REGIAN,20);
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
		target:delMod(MOD_STR,50);
		target:delMod(MOD_DOUBLE_ATTACK,10);
		target:delMod(MOD_REGIAN,20);
	end
end;