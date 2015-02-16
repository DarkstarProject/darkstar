-----------------------------------
--
--  ATMA_OF_THE_AVARICIOUS_APE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_HASTE,5);
		target:addMod(MOD_FIREACC,5);
		target:addMod(MOD_ICEACC,5);
		target:addMod(MOD_WINDACC,5);
		target:addMod(MOD_EARTHACC,5);
		target:addMod(MOD_THUNDERACC,5);
		target:addMod(MOD_WATERACC,5);
		target:addMod(MOD_LIGHTACC,5);
		target:addMod(MOD_DARKACC,5);
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
		target:delMod(MOD_HASTE,5);
		target:delMod(MOD_FIREACC,5);
		target:delMod(MOD_ICEACC,5);
		target:delMod(MOD_WINDACC,5);
		target:delMod(MOD_EARTHACC,5);
		target:delMod(MOD_THUNDERACC,5);
		target:delMod(MOD_WATERACC,5);
		target:delMod(MOD_LIGHTACC,5);
		target:delMod(MOD_DARKACC,5);
	end
end;