-----------------------------------
--
--  ATMA_OF_ALLURE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_MPP,30);
		target:addMod(MOD_MND,30);
		target:addMod(MOD_ENMITY,-30);
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
		target:delMod(MOD_MPP,30);
		target:delMod(MOD_MND,30);
		target:delMod(MOD_ENMITY,-30);
	end
end;