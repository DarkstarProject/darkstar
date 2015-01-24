-----------------------------------
--	EFFECT_CLARION_CALL
-- Increases the number of songs
-- that can affect party members
-- by one.
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_SONG_EFFECTS,effect:getPower());
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
	target:delMod(MOD_SONG_EFFECTS,effect:getPower());
end;