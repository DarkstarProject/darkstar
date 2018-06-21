-----------------------------------
--
--     dsp.effect.COSTUME
--
-----------------------------------

function onEffectGain(target,effect)
    target:costume(effect:getPower())
    if effect:getPower() == 1999 then
        if effect:getTimeRemaining() / 1000 >= 7170 then
            target:speed(target:speed()+5)
            effect:setPower(19991)
        else
            target:speed(target:speed()+10)
            effect:setPower(19992)
        end
    end
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:costume(0)
    if effect:getPower() == 19991 then
        target:speed(target:speed()-5)
    elseif effect:getPower() == 19992 then
        target:speed(target:speed()-10)
    end
end