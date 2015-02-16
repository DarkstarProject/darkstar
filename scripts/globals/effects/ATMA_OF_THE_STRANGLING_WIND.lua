-----------------------------------
--
--  ATMA_OF_THE_STRANGLING_WIND
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_STR,20);
		target:addMod(MOD_VIT,20);
		target:addMod(MOD_AGI,30);
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
		target:delMod(MOD_STR,20);
		target:delMod(MOD_VIT,20);
		target:delMod(MOD_AGI,30);
	end
end;