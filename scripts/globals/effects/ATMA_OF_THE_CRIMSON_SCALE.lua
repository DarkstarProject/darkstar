-----------------------------------
--
--  ATMA_OF_THE_CRIMSON_SCALE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_HASTE,5);
		target:addMod(MOD_ENMITY,-20);
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
		target:delMod(MOD_HASTE,5);
		target:delMod(MOD_ENMITY,-20);
	end
end;