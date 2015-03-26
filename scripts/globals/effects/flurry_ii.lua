-----------------------------------
--
--  Flurry
--
-----------------------------------
require("scripts/globals/status")

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_RANGED_DELAYP, -effect:getPower());
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
    target:delMod(MOD_RANGED_DELAYP, -effect:getPower());
end;