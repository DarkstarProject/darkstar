-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Anieuvansand
-- Type: Standard Info NPC
--  @zone 231
-- !pos -18.608 -0.199 83.911
--
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(665);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

