-----------------------------------
--
-- 	EFFECT_LAST_RESORT
-- 	
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_ATTP,15 + target:getMerit(MERIT_LAST_RESORT_EFFECT));
	-- print(target:getMerit(MERIT_LAST_RESORT_EFFECT));
	target:addMod(MOD_DEFP,-15 - target:getMerit(MERIT_LAST_RESORT_EFFECT));
	target:addMod(MOD_HASTE_ABILITY, effect:getPower())
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
	target:delMod(MOD_ATTP,15 + target:getMerit(MERIT_LAST_RESORT_EFFECT));
	target:delMod(MOD_DEFP,-15 - target:getMerit(MERIT_LAST_RESORT_EFFECT));
	target:delMod(MOD_HASTE_ABILITY, effect:getPower())
end;