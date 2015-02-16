-----------------------------------
--
--  ATMA_OF_THE_SANGUINE_SCYTHE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_HPP,20);
		target:addMod(MOD_CRIT_DMG_INCREASE,30);
		target:addMod(MOD_ENMITY,20);
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
		target:delMod(MOD_CRIT_DMG_INCREASE,30);
		target:delMod(MOD_ENMITY,20);
	end
end;