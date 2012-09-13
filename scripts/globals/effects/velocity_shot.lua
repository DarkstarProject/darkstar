-----------------------------------
--
--	EFFECT_VELOCITY_SHOT
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_ATTP,-15);
	target:addMod(MOD_DELAY,15);
	target:addMod(MOD_RATTP,15);
	target:addMod(MOD_RANGED_DELAY,-15);
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
	target:delMod(MOD_ATTP,-15);
	target:delMod(MOD_DELAY,15);
	target:delMod(MOD_RATTP,15);
	target:delMod(MOD_RANGED_DELAY,-15);
end;