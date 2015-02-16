-----------------------------------
--
--  ATMA_OF_THE_GNARLED_HORN
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_AGI,50);
		target:addMod(MOD_CRITHITRATE,20);
		target:addMod(MOD_COUNTER,10);
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
		target:delMod(MOD_AGI,50);
		target:delMod(MOD_CRITHITRATE,20);
		target:delMod(MOD_COUNTER,10);
	end
end;