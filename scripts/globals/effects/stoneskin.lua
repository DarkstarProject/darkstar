-----------------------------------
--  Stoneskin
--
--  Absorbs a certain amount of damage from physical and magical attacks.
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:setMod(MOD_STONESKIN, effect:getPower());
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
    target:setMod(MOD_STONESKIN, 0);
end;