-----------------------------------
--
-- dsp.effect.BATTLEFIELD
--
-----------------------------------

function onEffectGain(target,effect)
    if (target:getPet()) then
        target:getPet():addStatusEffect(effect)
    end
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    if (target:getPet()) then
        target:getPet():delStatusEffect(dsp.effect.BATTLEFIELD)
    end
end

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid)
    -- printf("onUpdate RESULT: %u",option)
end

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid)
    -- printf("onFinish RESULT: %u",option)
end