-----------------------------------
--
-- dsp.effect.PROWESS : Enhanced magic acc. and magic atk
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MATT, effect:getPower());
    target:addMod(dsp.mod.MACC, effect:getPower());
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
    target:delMod(dsp.mod.MATT, effect:getPower());
    target:delMod(dsp.mod.MACC, effect:getPower());
end;