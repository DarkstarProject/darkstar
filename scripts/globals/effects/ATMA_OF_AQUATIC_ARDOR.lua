-----------------------------------
--
--  ATMA_OF_AQUATIC_ARDOR
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_ABSORB_DMG_CHANCE,6);
		target:addMod(MOD_MAGIC_ABSORB,6);
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
		target:delMod(MOD_ABSORB_DMG_CHANCE,6);
		target:delMod(MOD_MAGIC_ABSORB,6);
	end
end;