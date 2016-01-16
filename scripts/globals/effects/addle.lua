-----------------------------------
--
-- EFFECT_ADDLE
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FASTCAST, -effect:getPower()); -- Yes we are subtracting in addMod()
    target:addMod(MOD_MACC, -effect:getSubPower()); -- This is intentional
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
    target:delMod(MOD_FASTCAST, -effect:getPower());
    target:delMod(MOD_MACC, -effect:getSubPower());
end;