-----------------------------------
--
-- EFFECT_ATMA
--
-- Global needs redone into table instead of functions
--
-----------------------------------
require("scripts/globals/atma");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target, effect)
    atmaEffectGain(target, effect);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target, effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target, effect)
    atmaEffectLose(target, effect);
end;