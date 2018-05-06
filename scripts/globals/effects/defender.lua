-----------------------------------
--
--     dsp.effect.DEFENDER
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
target:addMod(dsp.mod.DEFP,25);
target:addMod(dsp.mod.RATTP,-25);
target:addMod(dsp.mod.ATTP,-25);
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
target:delMod(dsp.mod.DEFP,25);
target:delMod(dsp.mod.ATTP,-25);
target:delMod(dsp.mod.RATTP,-25);
end;