-----------------------------------
-- Hymnus (reraise)
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------
function onEffectGain(target,effect)
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
  if (target:getHP() <= 0) then
        target:sendReraise(effect:getPower());
    end
end;