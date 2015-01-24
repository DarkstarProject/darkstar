-----------------------------------
--
-- 	EFFECT_REGEN_II
-- Gradually restores target's HP.
-- Currently used only for the
-- Chakra regen from Invigorate
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_REGEN, effect:getPower());
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
	target:delMod(MOD_REGEN, effect:getPower());
end;