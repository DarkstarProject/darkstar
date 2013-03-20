-----------------------------------
--
-- EFFECT_SENTINEL
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_UDMGPHYS, effect:getPower());
	target:addMod(MOD_ENMITY, 100);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	effect:setPower(effect:getPower() + 5);
	target:delMod(MOD_UDMGPHYS, -5);
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_UDMGPHYS, effect:getPower());
	target:delMod(MOD_ENMITY, 100);
end;