-----------------------------------
-- Area: Al Zahbi
--  NPC: Gaweesh
-- Type: Najelith's Attendant
-- !pos -64.537 -8 37.928 48
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(258);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
