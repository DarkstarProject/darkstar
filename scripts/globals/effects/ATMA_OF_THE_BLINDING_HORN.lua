-----------------------------------
--
--  ATMA_OF_THE_BLINDING_HORN
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_CONSERVE_MP,20);
		target:addMod(MOD_THUNDERATT,30);
		target:addMod(MOD_DMGMAGIC,-20);
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
		target:delMod(MOD_CONSERVE_MP,20);
		target:delMod(MOD_THUNDERATT,30);
		target:delMod(MOD_DMGMAGIC,-20);
	end
end;