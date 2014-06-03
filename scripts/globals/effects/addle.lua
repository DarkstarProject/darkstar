-----------------------------------
--
-- EFFECT_ADDLE
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_FASTCAST, effect:getPower());
	target:addMod(MOD_MACC, effect:getSubPower());
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
	target:delMod(MOD_FASTCAST, effect:getPower());
	target:delMod(MOD_MACC, effect:getSubPower());
end;