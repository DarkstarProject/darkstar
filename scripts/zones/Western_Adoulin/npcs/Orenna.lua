-----------------------------------
-- Area: Western Adoulin
--  NPC: Orenna
-- Type: Standard NPC
--  @zone 256
-- !pos -30 0 -26
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard dialogue
    player:startEvent(512);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
