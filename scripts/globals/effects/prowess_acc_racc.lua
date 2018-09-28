-----------------------------------
--
-- dsp.effect.PROWESS : Enhanced accuracy and ranged accuracy
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
-- This might not be % in retail...If not a % just change ACCP to just ACC
    target:addMod(dsp.mod.ACC, effect:getPower());
    target:addMod(dsp.mod.RACC, effect:getPower());
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
    target:delMod(dsp.mod.ACC, effect:getPower());
    target:delMod(dsp.mod.RACC, effect:getPower());
end;
