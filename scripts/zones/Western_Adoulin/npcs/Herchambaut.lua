-----------------------------------
-- Area: Western Adoulin
--  NPC: Herchambaut
-- Type: Standard NPC
--  @zone 256
-- !pos 95 0 -47
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard dialogue
    player:startEvent(572);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
