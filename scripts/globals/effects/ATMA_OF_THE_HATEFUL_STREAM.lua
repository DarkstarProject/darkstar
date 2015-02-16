-----------------------------------
--
--  ATMA_OF_THE_HATEFUL_STREAM
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_FIRE_AFFINITY,40);
		target:addMod(MOD_EARTH_AFFINITY,40);
		target:addMod(MOD_WATER_AFFINITY,40);
		target:addMod(MOD_ICE_AFFINITY,40);
		target:addMod(MOD_THUNDER_AFFINITY,40);
		target:addMod(MOD_WIND_AFFINITY,40);
		target:addMod(MOD_LIGHT_AFFINITY,40);
		target:addMod(MOD_DARK_AFFINITY,40);
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
		target:delMod(MOD_FIRE_AFFINITY,40);
		target:delMod(MOD_EARTH_AFFINITY,40);
		target:delMod(MOD_WATER_AFFINITY,40);
		target:delMod(MOD_ICE_AFFINITY,40);
		target:delMod(MOD_THUNDER_AFFINITY,40);
		target:delMod(MOD_WIND_AFFINITY,40);
		target:delMod(MOD_LIGHT_AFFINITY,40);
		target:delMod(MOD_DARK_AFFINITY,40);
	end
end;