-----------------------------------
--
--  ATMA_OF_THRASHING_TENDRILS
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_CHR,30);
		target:addMod(MOD_CRITHITRATE,20);
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
		target:delMod(MOD_CHR,30);
		target:delMod(MOD_CRITHITRATE,20);
	end
end;