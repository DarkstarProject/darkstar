-----------------------------------
--
--  ATMA_OF_THE_MERCILESS_MATRIARCH
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/common");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_MACC,50);
		target:addMod(MOD_FASTCAST,20);
		target:addMod(MOD_ENMITY,-50);
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
		target:delMod(MOD_MACC,50);
		target:delMod(MOD_FASTCAST,20);
		target:delMod(MOD_ENMITY,-50);
	end
end;