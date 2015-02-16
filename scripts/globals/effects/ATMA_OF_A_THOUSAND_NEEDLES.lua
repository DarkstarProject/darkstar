-----------------------------------
--
--  ATMA_OF_A_THOUSAND_NEEDLES
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_HPP,20);
		target:addMod(MOD_MPP,20);
		target:addMod(MOD_DEX,10);
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
		target:delMod(MOD_HPP,20);
		target:delMod(MOD_MPP,20);
		target:delMod(MOD_DEX,10);
	end
end;