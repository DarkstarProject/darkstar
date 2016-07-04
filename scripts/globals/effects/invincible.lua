-----------------------------------
--
--     EFFECT_INVINCIBLE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_UDMGPHYS, -100);
    target:addMod(MOD_UDMGRANGE, -100);
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
    target:delMod(MOD_UDMGPHYS, -100);
    target:delMod(MOD_UDMGRANGE, -100);
end;
