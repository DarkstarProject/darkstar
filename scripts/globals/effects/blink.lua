-----------------------------------
-- Blink
--No need for addMod since blinks never stack.
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:setMod(MOD_BLINK,effect:getPower());
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
    target:setMod(MOD_BLINK,0);
end;