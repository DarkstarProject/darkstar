-----------------------------------
-- Ninjutsu Elemental Debuff
-- Reduces a targets given elemental resistance
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(effect:getSubPower(), -effect:getPower());
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
    target:delMod(effect:getSubPower(), -effect:getPower());
end;
