-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.TRIPLE_ATTACK, effect:getPower());
    target:addMod(dsp.mod.DOUBLE_ATTACK, 100);
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
    target:delMod(dsp.mod.TRIPLE_ATTACK, effect:getPower());
    target:delMod(dsp.mod.DOUBLE_ATTACK, 100);
end;