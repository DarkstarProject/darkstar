-----------------------------------
-- Area: Western Adoulin
--  NPC: Katya
-- Type: Standard NPC
--  @zone 256
-- !pos 11 0 68
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard dialogue
    player:startEvent(559);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
