-----------------------------------
--
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
    if (player:getVar("Abyssea_Time") >= 3) then
        player:setVar("Abyssea_Time",duration);
    end
-- TODO: messages about remaining time.
-- Some will need to handled outside of this effect (zone ejection warnings after visitant is gone).
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;