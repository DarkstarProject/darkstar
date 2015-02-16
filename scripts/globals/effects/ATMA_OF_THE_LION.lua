-----------------------------------
--
--  ATMA_OF_THE_LION
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_TRIPLE_ATTACK,7);
		target:addMod(MOD_DMGPHYS,-10);
		target:addMod(MOD_THUNDERATT,30);
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
		target:delMod(MOD_TRIPLE_ATTACK,7);
		target:delMod(MOD_DMGPHYS,-10);
		target:delMod(MOD_THUNDERATT,30);
	end
end;