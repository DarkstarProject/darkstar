-----------------------------------
-- Area: Western Adoulin
--  NPC: Phileem
-- Type: Standard NPC
--  @zone 256
-- !pos -20 0 -105
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard dialogue
    player:startEvent(537);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
