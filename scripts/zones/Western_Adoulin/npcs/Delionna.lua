-----------------------------------
-- Area: Western Adoulin
--  NPC: Delionna
-- Type: Standard NPC
--  @zone 256
-- !pos 16 0 165
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard dialogue
    player:startEvent(561);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
