-----------------------------------
--
-- 	EFFECT_NONE
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
target:addMod(MOD_DEFP,25);
target:addMod(MOB_RATTP,-25);
target:addMod(MOD_ATTP,-25);
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
target:delMod(MOD_DEFP,25);
target:delMod(MOD_ATTP,-25);
target:delMod(MOB_RATTP,-25);
end;