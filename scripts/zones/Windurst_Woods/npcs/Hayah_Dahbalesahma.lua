-----------------------------------
-- Area: Windurst Woods
--  NPC: Hayah Dahbalesahma
-- Type: Standard NPC
-- !pos -50.363 -1.292 -147.883 241
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(263);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

