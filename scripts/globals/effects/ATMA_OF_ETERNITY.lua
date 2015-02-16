-----------------------------------
--
--  ATMA_OF_ETERNITY
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_ENEMYCRITRATE,-20);
		target:addMod(MOD_SLOWRES,30);
		target:addMod(MOD_CURSERES,30);
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
		target:delMod(MOD_ENEMYCRITRATE,-20);
		target:delMod(MOD_SLOWRES,30);
		target:delMod(MOD_CURSERES,30);
	end
end;