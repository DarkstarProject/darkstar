-----------------------------------
--
-- EFFECT.ATTACK_BOOST
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (effect:getPower()>100) then
        effect:setPower(50);
    end
    target:addMod(MOD_ATTP,effect:getPower());
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
    target:delMod(MOD_ATTP,effect:getPower());
end;