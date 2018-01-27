-----------------------------------
-- Area: Western Adoulin
--  NPC: Neivaig
-- Type: Standard NPC
--  @zone 256
-- !pos -4 3 73
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard dialogue
    player:startEvent(556);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
