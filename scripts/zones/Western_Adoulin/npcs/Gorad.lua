-----------------------------------
-- Area: Western Adoulin
--  NPC: Gorad
-- Type: Standard NPC
--  @zone 256
-- !pos 23 0 -115
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard dialogue
    player:startEvent(542);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
