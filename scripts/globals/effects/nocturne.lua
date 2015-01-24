-----------------------------------
-- 	EFFECT_NOCTURNE
-- Decreases an enemy's magic
-- accuracy and increases its
-- spellcasting time.
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_MACC,-(effect:getPower() * 2));
	target:addMod(MOD_FASTCAST,-effect:getPower());
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
	target:delMod(MOD_MACC,-(effect:getPower() * 2));
	target:delMod(MOD_FASTCAST,-effect:getPower());
end;