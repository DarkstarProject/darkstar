-----------------------------------
--
--  ATMA_OF_THE_ENDLESS_NIGHTMARE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_MND,20);
		target:addMod(MOD_DARKRES,100);
		target:addMod(MOD_DARK_AFFINITY,100);
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
		target:delMod(MOD_MND,20);
		target:delMod(MOD_DARKRES,100);
		target:delMod(MOD_DARK_AFFINITY,100);
	end
end;