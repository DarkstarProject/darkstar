-----------------------------------
--
--     dsp.effect.INVINCIBLE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.UDMGPHYS, -100);
    target:addMod(dsp.mod.UDMGRANGE, -100);
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
    target:delMod(dsp.mod.UDMGPHYS, -100);
    target:delMod(dsp.mod.UDMGRANGE, -100);
end;
