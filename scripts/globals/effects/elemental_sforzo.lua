-----------------------------------
-- 	EFFECT_ELEMENTAL_SFORZO
-- Grants immunity to all magic
-- attacks.
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_UDMGMAGIC, -256);
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
   target:delMod(MOD_UDMGMAGIC, -256);
end;
