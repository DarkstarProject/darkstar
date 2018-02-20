-----------------------------------
-- Area: Western Adoulin
--  NPC: Aindemont
-- Type: Standard NPC
--  @zone 256
-- !pos 171 4 -33
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard dialogue
    player:startEvent(569);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
