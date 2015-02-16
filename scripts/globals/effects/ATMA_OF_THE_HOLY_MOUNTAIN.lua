-----------------------------------
--
--  ATMA_OF_THE_HOLY_MOUNTAIN
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_LIGHTRES,100);
		target:addMod(MOD_LIGHTACC,50);
		target:addMod(MOD_LIGHT_AFFINITY,100);
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
		target:delMod(MOD_LIGHTRES,100);
		target:delMod(MOD_LIGHTACC,50);
		target:delMod(MOD_LIGHT_AFFINITY,100);
	end
end;