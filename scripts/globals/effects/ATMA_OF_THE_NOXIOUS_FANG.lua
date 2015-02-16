-----------------------------------
--
--  ATMA_OF_THE_NOXIOUS_FANG
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_SUBTLE_BLOW,40);
		target:addMod(MOD_WATERATT,40);
		target:addMod(MOD_POISONRES,40);
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
		target:delMod(MOD_SUBTLE_BLOW,40);
		target:delMod(MOD_WATERATT,40);
		target:delMod(MOD_POISONRES,40);
	end
end;