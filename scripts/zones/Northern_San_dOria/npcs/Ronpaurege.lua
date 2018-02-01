-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Ronpaurege
-- Type: Standard Info NPC
--  @zone 231
-- !pos 65.739 -0.199 74.275
--
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(669);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

