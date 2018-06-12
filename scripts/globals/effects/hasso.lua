-----------------------------------
-- Hasso
-- Straight +10% haste +10 Acc and scaling (lv) STR
-- also -50% FC
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR,effect:getPower());
    target:addMod(dsp.mod.HASTE_ABILITY,102);
    target:addMod(dsp.mod.ACC,10);
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
    target:delMod(dsp.mod.STR,effect:getPower());
    target:delMod(dsp.mod.HASTE_ABILITY,102);
    target:delMod(dsp.mod.ACC,10);
end;