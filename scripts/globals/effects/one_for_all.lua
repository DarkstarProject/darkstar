-----------------------------------
-- 	EFFECT_ONE_FOR_ALL
--  Grants a Magic Shiel effect for
--  all party members in AoE
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_UDMGMAGIC, 100);
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
   target:delMod(MOD_UDMGMAGIC, 100);
end;
