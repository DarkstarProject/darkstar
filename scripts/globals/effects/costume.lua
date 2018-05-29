-----------------------------------
--
--     dsp.effect.COSTUME
--
-----------------------------------

function onEffectGain(target,effect)
    target:costume(effect:getPower())
    if effect:getPower() == 1999 then
        target:speed(target:speed()+10) 
    end
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:costume(0)
    if effect:getPower() == 1999 then
        target:speed(target:speed()-10)
    end
end