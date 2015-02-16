-----------------------------------
--
--  ATMA_OF_THE_SCARLET_WING
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_ELEM,10);
		target:addMod(MOD_WIND_AFFINITY,50);
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
		target:delMod(MOD_ELEM,10);
		target:delMod(MOD_WIND_AFFINITY,50);
	end
end;