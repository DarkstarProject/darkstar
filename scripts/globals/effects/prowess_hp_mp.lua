-----------------------------------
--
-- dsp.effect.PROWESS : Increased HP and MP
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HPP, effect:getPower());
    target:addMod(dsp.mod.MPP, effect:getPower());
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
    target:delMod(dsp.mod.HPP, effect:getPower());
    target:delMod(dsp.mod.MPP, effect:getPower());
end;