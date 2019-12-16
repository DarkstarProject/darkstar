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
    local pet = target:getPet()
    if pet then
        pet:delStatusEffect(dsp.effect.BATTLEFIELD)
        pet:leaveBattlefield(1)
    end
    target:setLocalVar("[battlefield]area", 0)
end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid)
    -- printf("onUpdate RESULT: %u",option)
end

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid)
    -- printf("onFinish RESULT: %u",option)
end
