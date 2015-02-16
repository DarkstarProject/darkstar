-----------------------------------
--
--  ATMA_OF_THE_UNDYING
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_MND,40);
		target:addMod(MOD_CONSERVE_MP,10);
		target:addMod(MOD_ICEATT,20);
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
		target:delMod(MOD_MND,40);
		target:delMod(MOD_CONSERVE_MP,10);
		target:delMod(MOD_ICEATT,20);
	end
end;