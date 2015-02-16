-----------------------------------
--
--  ATMA_OF_THE_DEMONIC_LASH
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_ATT,40);
		target:addMod(MOD_DOUBLE_ATTACK,10);
		target:addMod(MOD_MAGIC_ABSORB,20);
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
		target:delMod(MOD_ATT,40);
		target:delMod(MOD_DOUBLE_ATTACK,10);
		target:delMod(MOD_MAGIC_ABSORB,20);
	end
end;