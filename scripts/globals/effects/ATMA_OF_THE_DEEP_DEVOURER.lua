-----------------------------------
--
--  ATMA_OF_THE_DEEP_DEVOURER
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_SUBTLE_BLOW,5);
		target:addMod(MOD_STORETP,5);
		target:addMod(MOD_SONG_SPELLCASTING_TIME,-20);
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
		target:delMod(MOD_SUBTLE_BLOW,5);
		target:delMod(MOD_STORETP,5);
		target:delMod(MOD_SONG_SPELLCASTING_TIME,-20);
	end
end;