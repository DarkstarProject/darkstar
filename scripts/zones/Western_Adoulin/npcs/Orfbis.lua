-----------------------------------
-- Area: Western Adoulin
--  NPC: Orfbis
-- Type: Standard NPC
--  @zone 256
-- !pos -13 0 -44
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard dialogue
    player:startEvent(523);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
