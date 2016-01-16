-----------------------------------
--
--     EFFECT_BERSERK
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
target:addMod(MOD_ATTP,25);
target:addMod(MOD_RATTP, 25);
target:addMod(MOD_DEFP,-25);
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
target:delMod(MOD_ATTP,25);
target:delMod(MOD_DEFP,-25);
target:delMod(MOD_RATTP, 25);
end;