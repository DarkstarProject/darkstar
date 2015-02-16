-----------------------------------
--
--  ATMA_OF_BLIGHTED_BREATH
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_SONG_SPELLCASTING_TIME,-40);
		target:addMod(MOD_LIGHTACC,40);
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
		target:delMod(MOD_SONG_SPELLCASTING_TIME,-40);
		target:delMod(MOD_LIGHTACC,40);
	end
end;