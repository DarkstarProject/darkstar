-----------------------------------
--	EFFECT_PALISADE
-- Increases chances of blocking
-- with shield, eliminates enmity
-- loss.
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_BLOCK_RATE,20);
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
	target:delMod(MOD_BLOCK_RATE,20);
end;