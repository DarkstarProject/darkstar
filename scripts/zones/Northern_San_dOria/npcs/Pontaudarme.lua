-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Pontaudarme
-- Type: Standard Info NPC
--  @zone 231
-- !pos -51.628 -0.199 16.593
--
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(717);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

