-----------------------------------
--
--  EFFECT_RERAISE
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    --power level is the raise number (1,2,3)
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