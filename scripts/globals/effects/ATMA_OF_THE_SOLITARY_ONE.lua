-----------------------------------
--
--  ATMA_OF_THE_SOLITARY_ONE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_TRIPLE_ATTACK,7);
		target:addMod(MOD_DMGBREATH,-25);
		target:addMod(MOD_ZANSHIN,10);
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
		target:delMod(MOD_DMGBREATH,-25);
		target:delMod(MOD_ZANSHIN,10);
	end
end;