-----------------------------------
-- Area: Al Zahbi
--  NPC: Zwiyaam
-- Type: Standard NPC
-- !pos 14.814 -7.667 41.889 48
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(247);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
