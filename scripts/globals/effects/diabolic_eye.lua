-----------------------------------
--
--     dsp.effect.BERSERK
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ACC,15 + effect:getPower());
    target:addMod(dsp.mod.HPP,-15);
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
    target:delMod(dsp.mod.ACC,15 + effect:getPower());
    target:delMod(dsp.mod.HPP,-15);
end;