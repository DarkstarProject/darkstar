-----------------------------------
--
--  ATMA_OF_THE_SMOLDERING_SKY
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_ATT,20);
		target:addMod(MOD_MACC,40);
		target:addMod(MOD_FIREATT,30);
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
		target:delMod(MOD_ATT,20);
		target:delMod(MOD_MACC,40);
		target:delMod(MOD_FIREATT,30);
	end
end;