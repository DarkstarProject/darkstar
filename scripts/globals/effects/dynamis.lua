-----------------------------------
--
--     dsp.effect.DYNAMIS
--
-----------------------------------
require("scripts/globals/keyitems")
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
    target:delKeyItem(dsp.ki.CRIMSON_GRANULES_OF_TIME)
    target:delKeyItem(dsp.ki.AZURE_GRANULES_OF_TIME)
    target:delKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME)
    target:delKeyItem(dsp.ki.ALABASTER_GRANULES_OF_TIME)
    target:delKeyItem(dsp.ki.OBSIDIAN_GRANULES_OF_TIME)
    if effect:getTimeRemaining() == 0 then
        target:triggerListener("DYNAMIS_EXPIRE", target)
        target:startEvent(100)
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(target,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(target,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);
end;
