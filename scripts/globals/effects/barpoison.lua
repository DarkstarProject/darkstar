-----------------------------------
--
-- dsp.effect.BARPOISON
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.POISONRES,effect:getPower());
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
    target:delMod(dsp.mod.POISONRES,effect:getPower());
end;