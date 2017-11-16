-----------------------------------
--
--     EFFECT_DYNAMIS
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
    player:delKeyItem(CRIMSON_GRANULES_OF_TIME)
    player:delKeyItem(AZURE_GRANULES_OF_TIME)
    player:delKeyItem(AMBER_GRANULES_OF_TIME)
    player:delKeyItem(ALABASTER_GRANULES_OF_TIME)
    player:delKeyItem(OBSIDIAN_GRANULES_OF_TIME)
    if effect:getTimeRemaining() == 0 then
        player:fireEvent("DYNAMIS_EXPIRE", player)
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);
end;
