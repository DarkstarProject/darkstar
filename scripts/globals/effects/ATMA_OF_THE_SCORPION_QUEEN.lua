-----------------------------------
--
--  ATMA_OF_THE_SCORPION_QUEEN
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_STORETP,20);
		target:addMod(MOD_CRITHITRATE,30);
		target:addMod(MOD_BINDRES,50);
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
		target:delMod(MOD_STORETP,20);
		target:delMod(MOD_CRITHITRATE,30);
		target:delMod(MOD_BINDRES,50);
	end
end;