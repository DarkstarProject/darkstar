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
    target:addMod(MOD_STR,effect:getPower());
    target:addMod(MOD_HASTE_ABILITY,102);
    target:addMod(MOD_ACC,10);
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
    target:delMod(MOD_STR,effect:getPower());
    target:delMod(MOD_HASTE_ABILITY,102);
    target:delMod(MOD_ACC,10);
end;