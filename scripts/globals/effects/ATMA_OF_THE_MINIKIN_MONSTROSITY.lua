-----------------------------------
--
--  ATMA_OF_THE_MINIKIN_MONSTROSITY
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_REFRESH,10);
		target:addMod(MOD_INT,50);
		target:addMod(MOD_ENMITY,-20);
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
		target:delMod(MOD_REFRESH,10);
		target:delMod(MOD_INT,50);
		target:delMod(MOD_ENMITY,-20);
	end
end;