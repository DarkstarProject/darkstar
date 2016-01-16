-----------------------------------
-- EFFECT_RETALIATION
-- Allows you to counterattack but reduces movement speed.
-- Unlike counter, grants TP like a regular melee attack.
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MOVE, -8);
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
    target:delMod(MOD_MOVE, -8);
end;