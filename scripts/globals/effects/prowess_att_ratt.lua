-----------------------------------
--
-- dsp.effect.PROWESS : Increased treasure casket discovery.
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
-- This might not be % in retail...If not a % just change ATTP to just ATT
    target:addMod(dsp.mod.ATTP, effect:getPower());
    target:addMod(dsp.mod.RATTP, effect:getPower());
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
    target:delMod(dsp.mod.ATTP, effect:getPower());
    target:delMod(dsp.mod.RATTP, effect:getPower());
end;