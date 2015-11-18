-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    -- minimum time is 10 seconds!
    if (effect:getPower() < 10) then
        effect:setPower(10);
    end
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    effect:setPower(effect:getPower()-1);

    if (effect:getPower() == 0) then
        -- sorry, you are the weakest link
        target:setHP(0);
    else
        -- doom counter
        target:messagePublic(112, target, effect:getPower(), effect:getPower());
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    if (effect:getPower() == 0) then
        target:setHP(0);
    end
end;