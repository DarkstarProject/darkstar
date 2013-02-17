-----------------------------------
--
-- 	EFFECT_LAST_RESORT
-- 	
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_ATTP,15);
	target:addMod(MOD_DEFP,-15);
	if(target:getMerit(MERIT_DESPERATE_BLOWS) > 0) then
		target:addMod(MOD_HASTE_ABILITY, target:getMerit(MERIT_DESPERATE_BLOWS))
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
	target:delMod(MOD_ATTP,15);
	target:delMod(MOD_DEFP,-15);
	if(target:getMerit(MERIT_DESPERATE_BLOWS) > 0) then
		target:delMod(MOD_HASTE_ABILITY, target:getMerit(MERIT_DESPERATE_BLOWS))
	end
end;