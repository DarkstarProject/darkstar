-----------------------------------
--
--    dsp.effect.MINUET
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ATT, effect:getPower());
    target:addMod(dsp.mod.RATT, effect:getPower());
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
    target:delMod(dsp.mod.ATT, effect:getPower());
    target:delMod(dsp.mod.RATT, effect:getPower());
end;
