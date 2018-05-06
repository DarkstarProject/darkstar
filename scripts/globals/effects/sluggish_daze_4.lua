-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEFP, -11);
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
    target:delMod(dsp.mod.DEFP, -11);
end;