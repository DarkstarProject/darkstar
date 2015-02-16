-----------------------------------
--
--  ATMA_OF_THE_APOCALYPSE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_TRIPLE_ATTACK,15);
		target:addMod(MOD_GRIMOIRE_INSTANT_CAST,10);
		target:addMod(MOD_RERAISE_III,1);
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
		target:delMod(MOD_TRIPLE_ATTACK,15);
		target:delMod(MOD_GRIMOIRE_INSTANT_CAST,10);
		target:delMod(MOD_RERAISE_III,1);
	end
end;