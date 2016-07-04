-----------------------------------
--
-- EFFECT_VISITANT
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
    --[[
    local duration = effect:getDuration();
    if (target:getVar("Abyssea_Time") >= 3) then
        target:setVar("Abyssea_Time",duration);
    end
    Some messages about remaining time.will need to handled outside of this effect (zone ejection warnings after visitant is gone).
    ]]
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;
